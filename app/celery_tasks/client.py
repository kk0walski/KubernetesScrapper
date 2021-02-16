import os
import praw

reddit = praw.Reddit(
    client_id=os.environ.get("REDDIT_ID"),
    client_secret=os.environ.get("REDDIT_SECRET"),
    user_agent=os.environ.get("REDDIT_AGENT")
)