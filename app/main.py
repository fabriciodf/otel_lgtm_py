from fastapi import FastAPI
import logging

app = FastAPI()
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.get("/ping")
def ping():
    return {"message": "pong"}
@app.get("/")
def home():
    return {"message": "Hello World"}
