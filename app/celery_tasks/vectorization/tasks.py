import json
from celery_tasks.celery_app import app
from pymagnitude import *
from celery_tasks.docker_logs import get_logger
import numpy as np

logging_vector = get_logger("vectorize")

@app.task(bind=True, name='vectorize', serializer='json')
def vectorize(self, post_id, words):
    reasult = []
    vecs = Magnitude(MagnitudeUtils.download_model('http://magnitude.plasticity.ai/fasttext/light/crawl-300d-2M.magnitude'))
    for word in words:
        try:
            vector = vecs.query(word)
            word_vector = vector.tolist()
            reasult.append(word_vector)
        except:
            logging_vector.info(f"Exception has occured")
    logging_vector.info(f"Zwektoryzowano post")
    app.send_task(name='add_vectors', args=(post_id, reasult, ), queue='queueC')