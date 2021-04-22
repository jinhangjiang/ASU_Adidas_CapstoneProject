# -*- coding: utf-8 -*-
"""
Created on Thu Apr  1 23:02:56 2021

@author: Jinhang Jiang
"""
# Python program to generate word vectors using Word2Vec
  
# importing all necessary modules
import nltk
from nltk.tokenize import sent_tokenize, word_tokenize
from nltk.corpus import stopwords
from textblob import Word
nltk.download('stopwords')
import warnings 
warnings.filterwarnings(action = 'ignore')
  
import gensim
from gensim.models import Word2Vec

  
# import basic packages
import pandas as pd
import numpy as np
import os
import time
import datetime

# clean txt
import string
import re

# cosine similarity
from sklearn.metrics.pairwise import cosine_similarity

print (os.getcwd())
os.chdir('D:/OneDrive/ASU/2021 Spring/Applied Project/ASU_Applied_Project_2021/Text analytics')
print (os.getcwd())

df=pd.read_csv("FullData.csv")
df['patterns'] = df.txt

stop = stopwords.words('english')
df['patterns'] = df['patterns'].apply(lambda x:' '.join(x.lower() for x in x.split()))
df['patterns'] = df['patterns'].apply(lambda x:' '.join(x for x in x.split() if x not in string.punctuation))
df['patterns'] = df['patterns'].str.replace('https*\S+','')
df['patterns'] = df['patterns'].str.replace('[^\w\s]','')
df['patterns'] = df['patterns'].apply(lambda x: ' '.join(x for x in x.split() if  not x.isdigit()))
df['patterns'] = df['patterns'].apply(lambda x:' '.join(x for x in x.split() if not x in stop))
df['patterns'] = df['patterns'].apply(lambda x: " ".join([Word(word).lemmatize() for word in x.split()]))

data=[]
for i in df['patterns']:
     li = list(i.split(" "))
     data.append(li)	
############################################### train
# Create skip-gram model
model1 = gensim.models.Word2Vec(data,
                                min_count = 2, 
                                size = 50, 
                                window = 15, 
                                negative= 10,
                                sg=1)
#model1.build_vocab(data)
model1.train(data, total_examples=model1.corpus_count,epochs=10)

############################################## extract embedding
vocab, vectors = model1.wv.vocab, model1.wv.vectors

# get node name and embedding vector index.
name_index = np.array([(v[0], v[1].index) for v in vocab.items()]) #.index

# init dataframe using embedding vectors and set index as node name
skip_gram =  pd.DataFrame(vectors[name_index[:,1].astype(int)])
skip_gram.index = name_index[:,0]
skip_gram


print(model1.wv.similarity('kpop','idol'))
print(model1.wv.similarity('kpop','movie'))
print(model1.wv.similarity('kpop','fortnite'))
print(model1.wv.similarity('ninja','fortnite'))
print(model1.wv.similarity('ninja','idol'))
print(model1.wv.similarity('ninja','kpop'))

model1.wv.most_similar('ninja',topn=15)

############################################ generate the avg
df_merge = pd.DataFrame(df.groupby('Celebrity').apply(lambda x: ",".join(x['txt'])))
df_merge

def flatten(data):
    return " ".join([str(item) for var in data for item in var])
embedding = []
embedding = pd.DataFrame(embedding)
start = time.time()
for i in range(len(df.index)):
    print('Round #',i+1,'for:',df_merge.index[i],"started")
    temp_list = []
    res = 0
    temp_df = []
    score = []
    temp_list = pd.DataFrame(temp_list)
    for j in word_tokenize(flatten(df_merge[i])):
        if j in skip_gram.index:
            try:
                temp_list = temp_list.append(skip_gram.loc[[j]])
            except:
                pass
    res = [temp_list.mean(axis=0)]
    res = pd.DataFrame(res)
    res.reset_index(drop=True, inplace=True)
    temp_df = pd.Series(df_merge.index[i])
    #temp_df.reset_index(drop=True, inplace=True)
    score = pd.concat([temp_df, res], axis=1)
    embedding = embedding.append(score)
    print('Round #',i+1,'for:',df_merge.index[i],"completed")
end = time.time()
sec = end - start
str(datetime.timedelta(seconds=sec))

####################################### embedings for each celebrity
embedding.columns=list(range(skip_gram.shape[1]+1))
embedding.rename(columns={ embedding.columns[0]: "Celebrity" }, inplace = True)
embedding=embedding.set_index(["Celebrity"])
embedding


######################################### Define similarity
from numpy.linalg import norm
def similarity(data,target,order = 'TopN'):
    #default of parameter 'order' is equal to TopN, alternative is BotN
    sim = []
    for i in data.index:
        if i != target:
            a = data.loc[target]
            b = data.loc[i]
            dist = (a @ b.T) / (norm(a)*norm(b))
            temp = (i,dist)
            sim.append(temp)
    if order == 'TopN':
        sim = sorted(sim, key=lambda t: t[1], reverse=True)
    elif order == 'BotN':
        sim = sorted(sim, key=lambda t: t[1], reverse=False)
    return sim

########################################## Calculate Similarity
similarity(embedding,'Naeun Son','TopN')

