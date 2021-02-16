import os
from celery import Celery

app = Celery("app",
            backend=os.environ.get("CELERY_RESULT_BACKEND"),
            broker=os.environ["CELERY_BROKER_URL"])
