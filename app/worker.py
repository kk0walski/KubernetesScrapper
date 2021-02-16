import os
from celery_tasks.celery_app import app
from datetime import datetime

app.conf.beat_schedule = {
    'gaming': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']),
        'args': ('gaming', int(os.environ['NEWSPAPER_SCHEDULE']), )
    },
    'life': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 2,
        'args': ('LifeProTips', int(os.environ['NEWSPAPER_SCHEDULE']) * 2, )
    },
    'cars': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 3,
        'args': ('cars', int(os.environ['NEWSPAPER_SCHEDULE']) * 3, )
    },
    'games': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 3,
        'args': ('Games', int(os.environ['NEWSPAPER_SCHEDULE']) * 3, )
    },
    'movies': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 4,
        'args': ('movies', int(os.environ['NEWSPAPER_SCHEDULE']) * 4, )
    },
    'men': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 5,
        'args': ('MensRights', int(os.environ['NEWSPAPER_SCHEDULE']) * 5, )
    },
    'linux': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 6,
        'args': ('linux', int(os.environ['NEWSPAPER_SCHEDULE']) * 6, )
    },
    'windows': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) + 30,
        'args': ('windows', int(os.environ['NEWSPAPER_SCHEDULE']) + 30, )
    },
    'xboxone': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 1 + 30,
        'args': ('xboxone', int(os.environ['NEWSPAPER_SCHEDULE']) * 1 + 30, )
    },
    'news': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 2 + 30,
        'args': ('worldnews', int(os.environ['NEWSPAPER_SCHEDULE']) * 2 + 30, )
    },
    'corona': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 3 + 30,
        'args': ('Coronavirus', int(os.environ['NEWSPAPER_SCHEDULE']) * 3 + 30, )
    },
    'ubisoft': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 4 + 30,
        'args': ('ubisoft', int(os.environ['NEWSPAPER_SCHEDULE']) * 4 + 30, )
    },
    'cyberpunkgame': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 5 + 30,
        'args': ('cyberpunkgame', int(os.environ['NEWSPAPER_SCHEDULE']) * 5 + 30, )
    },
    'CDProjektRed': {
        'task': 'submissions',
        'schedule': int(os.environ['NEWSPAPER_SCHEDULE']) * 6 + 30,
        'args': ('CDProjektRed', int(os.environ['NEWSPAPER_SCHEDULE']) * 6 + 30, )
    }
}
