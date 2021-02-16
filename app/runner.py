from celery.signals import after_task_publish,task_success,task_prerun,task_postrun
from prometheus_client import start_http_server
from prometheus_client import Counter, Histogram, generate_latest
from flask import Flask, send_file, request, Response

d = {}
app = Flask(__name__)
CONTENT_TYPE_LATEST = str('text/plain; version=0.0.4; charset=utf-8')

scrape = Histogram('scrap_in_seconds', 'scrapping in seconds')
preprocess = Histogram('preprocess_in_seconds', 'preprocess in seconds')
list_fetch = Counter('fetching_requests', 'The number of requests.')
preprocess_count = Counter('preprocess_request', 'The number of preprocess_requests')

@task_prerun.connect
def task_prerun_handler(signal, sender, task_id, task, **kwargs):
    d[task_id] = time()

@task_postrun.connect
def task_postrun_handler(signal, sender, task_id, task, retval, state, **kwargs):
    if state == 'SUCCESS' and task.__name__ == 'submissions':
        try:
            cost = time() - d.pop(task_id)
        except KeyError:
            cost = -1
        scrape.observe(cost)
        list_fetch.inc()
    elif state == 'SUCCESS' and task.__name__ == 'preprocess':
        try:
            cost = time() - d.pop(task_id)
        except KeyError:
            cost = -1
        preprocess.observe(cost)
        preprocess_count.inc()

@app.route('/metrics', methods=['GET'])
def get_data():
    """Returns all data as plaintext."""
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == '__main__':
    app.run(host= '0.0.0.0')