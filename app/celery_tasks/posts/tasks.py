import re
from celery_tasks.celery_app import app
from celery_tasks.client import reddit
from datetime import datetime
from nltk.corpus import stopwords
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.stem import WordNetLemmatizer
from praw.exceptions import APIException, InvalidURL
from prawcore.exceptions import PrawcoreException
from celery_tasks.docker_logs import get_logger
from dataclasses import dataclass, field
from dataclasses_json import dataclass_json
from typing import List, Dict


def preprocess_text(text_string):
    """
    Accepts a text string and replaces:
    1) urls with URLHERE
    2) lots of whitespace with one instance
    3) mentions with MENTIONHERE
    4) hashtags with HASHTAGHERE

    This allows us to get standardized counts of urls and mentions
    Without caring about specific people mentioned
    """
    space_pattern = '\s+'
    giant_url_regex = ('http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|'
        '[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+')
    mention_regex = '@[\w\-]+'
    #hashtag_regex = '#[\w\-]+'
    parsed_text = re.sub(space_pattern, ' ', text_string)
    parsed_text = re.sub(giant_url_regex, '', parsed_text)
    parsed_text = re.sub(mention_regex, '', parsed_text)
    #parsed_text = re.sub(hashtag_regex, '', parsed_text)
    return parsed_text

@dataclass_json
@dataclass
class Post:
    _id: str
    user: str = field(default="unknown")
    nsfw: bool = field(default=False)
    score: float = field(default=0.0)
    text: str = field(default=" ")
    title: str = field(default="No Title")
    comments: int = field(default=0)
    author: str = field(default="unknown")

    def to_dict(self) -> Dict:
        return {_id: self._id, 'user': self.user, 'nsfw': self.nsfw,
                'score': self.score, 'text': self.text, 
                'title': self.title, 'comments': self.comments, 
                'author': self.author
                }


logging_sub = get_logger("preprocess")


@app.task(bind=True, name='submissions', serializer='json')
def submissions(self, user, difference):
    try:
        subreddit = reddit.subreddit(str(user))
        new_submissions = []
        for submission in subreddit.stream.submissions():
            created_time = datetime.fromtimestamp(submission.created_utc)
            time_difference = datetime.utcnow().replace(microsecond=0) - \
                created_time.replace(microsecond=0)
            if time_difference.total_seconds() <= int(difference):
                app.send_task(name='preprocess', args=(submission.url, user), queue='queueA')
    except APIException as e:
        logging_sub.info(f'Exception {e.__class__} occured')


def get_words_list(text):
    lemmatizer = WordNetLemmatizer() 
    tokens = word_tokenize(text)
    words = [word for word in tokens if word.isalpha()]
    try:
        stop_words = set(stopwords.words('english'))
    except LookupError:
        import nltk
        nltk.download('stopwords')
        stop_words = set(stopwords.words('english'))
    try:
        lemmatizer.lemmatize('says')
    except LookupError:
        import nltk
        nltk.download('wordnet')
        lemmatizer.lemmatize('says')
    words = [w for w in words if not w in stop_words]
    words = [lemmatizer.lemmatize(w) for w in words]
    return words

@app.task(bind=True, name='preprocess', serializer='json')
def preprocess(self, url, user):
    try:
        if 'http' in str(url):
            submission = reddit.submission(url=str(url))
        else:
            submission = reddit.submission(id=str(url))
        if submission.author:
            post = Post(submission.id, str(user), submission.over_18, submission.score, submission.selftext,
                           submission.title, len(submission.comments), submission.author.subreddit['name'])
        else:
            post = Post(submission.id, str(user), submission.over_18, submission.score,
                           submission.selftext, submission.title, len(submission.comments))
        logging_sub.info(post.to_json())
        reasult = post.to_dict()
        clean_text = preprocess_text(reasult['text'])
        try:
            sentences = sent_tokenize(clean_text)
        except LookupError:
            import nltk
            nltk.download('punkt')
            sentences = sent_tokenize(clean_text)
        clean_words = []
        for sentence in sentences:
            clean_words.extend(get_words_list(sentence))
        reasult['lematized_text'] = ' '.join(clean_words)
        try:
            app.send_task(name='add_post', args=(reasult, ), queue='queueC')
        except:
            logging_sub.info("Exception in database occured")
        try:
            app.send_task(name='vectorize', args=(reasult['_id'], clean_words), queue='queueB')
        except:
            logging_sub.info("Exception in vectors occured")
    except APIException as e:
        logging_sub.info(f'Exception {e.__class__} occured')
    except InvalidURL as url:
        logging_sub.info(f'Exception {url.__class__} occured')
    except PrawcoreException as notExist:
        logging_sub.info(f'Exception {notExist.__class__} occured')
