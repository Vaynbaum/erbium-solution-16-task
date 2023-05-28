FROM python:3.10
RUN mkdir /tager
WORKDIR /tager
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m pip install numpy tensorflow gTTS
RUN pip install -U nltk
RUN python -m nltk.downloader -q Russian wordnet omw-1.4 punkt stopwords
COPY . /tager                                                                                                                                                                                                       

CMD gunicorn main:app --workers 1 --worker-class uvicorn.workers.UvicornWorker --bind=0.0.0.0:8000
EXPOSE 8000