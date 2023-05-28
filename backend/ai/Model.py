import pickle
import numpy as np
import os

os.environ["TF_CPP_MIN_LOG_LEVEL"] = "3"
import nltk
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords

russian_stopwords = stopwords.words("russian")
from keras.models import load_model


class NLPrecom:
    def __init__(self, model_name="modelNLP"):
        # Открытие файлов
        self.model_name = model_name
        self.words = pickle.load(open(f"{self.model_name}_words.pkl", "rb"))
        self.classes = pickle.load(open(f"{self.model_name}_classes.pkl", "rb"))
        self.model = load_model(f"{self.model_name}.h5")
        self.lemmatizer = WordNetLemmatizer()
        self.taglist = []
        with open("./class.txt", encoding="cp1251") as file:
            self.taglist += file.readlines()

    def bag_of_words(self, sentence, words):
        sentence_words = nltk.word_tokenize(sentence)
        sentence_words = [
            self.lemmatizer.lemmatize(word.lower()) for word in sentence_words
        ]

        bag = [0] * len(words)
        for s in sentence_words:
            for i, word in enumerate(words):
                if word == s:
                    bag[i] = 1

        return np.array(bag)

    def predict_tag(self, sentence):
        p = self.bag_of_words(sentence, self.words)
        resai = self.model.predict(np.array([p]))[0]
        resault = []
        tagstr = self.taglist[np.argmax(resai)][:-1]
        resault += tagstr.replace(",", "").split(" ")
        return resault
