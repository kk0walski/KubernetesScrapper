import os
from pymongo import MongoClient, errors
from celery_tasks.docker_logs import get_logger
from celery_tasks.celery_app import app

logging_sub = get_logger("database")

@app.task(bind=True, name='add_post')
def add_post(self, post):
    try:
        client = MongoClient(str(os.environ['MONGO_ADDRESS']), int(os.environ['MONGO_PORT']),
                username=str(os.environ['MONGO_INITDB_ROOT_USERNAME']),
                password=str(os.environ['MONGO_INITDB_ROOT_PASSWORD']),
                authSource=str(os.environ['MONGO_INITDB_DATABASE']),
                serverSelectionTimeoutMS = 3000)
        
        db = client[str(os.environ['MONGO_INITDB_DATABASE'])]
        collection = db['posts']
        collection.save(post)
        logging_sub.info(f"Wstawiono post")
        client.close()
    except errors.ServerSelectionTimeoutError as err:
        # set the client and DB name list to 'None' and `[]` if exception
        logging_sub.info(f'Exception {err.__class__} occured')
        client.close()
        client = None
        raise Exception
    except errors.DuplicateKeyError as dup:
        logging_sub.info(f'Exception {dup.__class__} occured')
        raise Exception


@app.task(bind=True, name='add_vectors')
def update_post(self, post_id, vector):
    try:
        client = MongoClient(str(os.environ['MONGO_ADDRESS']), int(os.environ['MONGO_PORT']),
                username=str(os.environ['MONGO_INITDB_ROOT_USERNAME']),
                password=str(os.environ['MONGO_INITDB_ROOT_PASSWORD']),
                authSource=str(os.environ['MONGO_INITDB_DATABASE']),
                serverSelectionTimeoutMS = 3000)
        
        db = client[str(os.environ['MONGO_INITDB_DATABASE'])]
        collection = db['posts']
        myquery = {'_id': str(post_id)}
        newValues = {"$set": {'vectors': vector}}
        doc = collection.find_one_and_update(myquery, newValues, upsert=True)
        if type(doc) == dict:
            logging_sub.info(f"updated doc")
        client.close()
    except errors.ServerSelectionTimeoutError as err:
        # set the client and DB name list to 'None' and `[]` if exception
        logging_sub.info(f'Exception {err.__class__} occured')
        client.close()
        client = None