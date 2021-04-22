# -*- coding: utf-8 -*-
"""
Created on Wed Mar 24 09:40:02 2021

@author: Jinhang Jiang
"""

import praw
import pandas as pd
import time
import datetime

reddit = praw.Reddit(client_id='4Ny8ZuJQqE_g4g',
                 client_secret="DPzsvF90jMWRBhjmgiFEfTrg9_RywA",
                 username='jjhasucis509',
                 password='zxcvbnm123',
                 user_agent='data_extract',
                 check_for_async=False)
blackpinkuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])

n=0
while n < 1:
    n += 1
    print("Round",n,"started")
    start_r = time.time()
    #BlackPink (sponsored by Adidas)
    #21 keywords
    s1=["blackPink"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'BlackPink'
            b = i.id
            h = i.author
            c = i.subreddit
            d = i.created_utc
            e = i.score
            f = i.num_comments
            i.comments.replace_more(limit=2)
            for comment in i.comments:
               g = []
               g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
            #flatten = [item for items in g for item in items]
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in blackpinkuser['id']:
            blackpinkuser = blackpinkuser.append(row)
    
    #### conclud
    end_r = time.time()
    sec_r = end_r - start_r
    print("Round",n,"completed")
    print("Time Lapses:",str(datetime.timedelta(seconds=sec_r)))
    time.sleep(1)

blackpinkuser.shape
blackpinkuser.txt[1]
blackpinkuser.head(1)
len(blackpinkuser.id.unique())
