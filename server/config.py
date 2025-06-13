import os


# Note, it's very important that keys read from the environment have the same name as in the config
class Config(object):
    SQLALCHEMY_DATABASE_URI = "sqlite://:memory:"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    ADMIN_PASSWORD = os.getenv("ADMIN_PASSWORD", "abc123")


class ProdConfig(Config):
    ENV = "production"
    SQLALCHEMY_DATABASE_URI = os.getenv("SQLALCHEMY_DATABASE_URI", None)
    CELERY_BROKER_URL = os.getenv("CELERY_BROKER_URL", None)
    MESSAGE_QUEUE_URL = os.getenv("MESSAGE_QUEUE_URL", None)
    REDIS_URL = os.getenv("REDIS_URL", None)
    SECRET_KEY = os.getenv("SECRET_KEY", None)
    AWS_ACCESS_KEY_ID = os.getenv("AWS_ACCESS_KEY_ID", None)
    AWS_SECRET_ACCESS_KEY = os.getenv("AWS_SECRET_ACCESS_KEY", None)
    S3_REGION = os.getenv("S3_REGION", None)
    S3_BUCKET = os.getenv("S3_BUCKET", None)
    PREFERRED_URL_SCHEME = "https"


class DevConfig(Config):
    ENV = "development"
    DEBUG = True
    # Use DATABASE_URL environment variable instead of hardcoded localhost
    # SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'postgresql://postgres:postgres@postgres:5432/pbots')
    SQLALCHEMY_DATABASE_URI = os.getenv("SQLALCHEMY_DATABASE_URI")
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SECRET_KEY = "SUPER SECRET KEY"
    PREFERRED_URL_SCHEME = "http"
    S3_BUCKET = "pokerbots-dev"
    # CELERY_BROKER_URL = "pyamqp://"
    # MESSAGE_QUEUE_URL = "pyamqp://"
    # REDIS_URL = "redis://"
    CELERY_BROKER_URL = os.getenv("CELERY_BROKER_URL")
    MESSAGE_QUEUE_URL = os.getenv("MESSAGE_QUEUE_URL")
    REDIS_URL = os.getenv("REDIS_URL")
