# -*- coding: utf-8 -*-
"""
Created on Tue Mar 23 19:41:57 2021

@author: Jinhang Jiang
"""

import praw
import pandas as pd
import time
import datetime

#print(os.getcwd())
#os.chdir('D:/OneDrive/ASU/2021 Spring/Applied Project/ASU_Applied_Project_2021/Text analytics')
#print(os.getcwd())

#reddit = praw.Reddit(client_id='4Ny8ZuJQqE_g4g',
#                 client_secret="DPzsvF90jMWRBhjmgiFEfTrg9_RywA",
#                 username='jjhasucis509',
#                 password='zxcvbnm123',
#                 user_agent='data_extract',
#                 check_for_async=False)

#connect to reddit
reddit = praw.Reddit(client_id='OBU5A7M8VyChGw',
                 client_secret="aLLrsXpQkpCLQlqmaRlt3u_zD6blyw",
                 username='sketchyfingers',
                 password='fallout2548',
                 user_agent='data_extract',
                 check_for_async=False)


# build a ultimate table
txt_data= pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])

#sub tables
Miyeonuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
Sanauser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
Seolhyunuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
Solaruser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
GFrienduser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
iZoneuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
BTSuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
NCTuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])


n = 0


start = time.time()
while n < 1:
    n += 1
    print("Round",n,"started")
    start_r = time.time()
    #Miyeon (sponsored by Adidas)
    #21 keywords
    s1=["Miyeon","miyeon","Cho Mi-yeon","Cho Miyeon"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Miyeon'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in Miyeonuser['id']:
            Miyeonuser = Miyeonuser.append(row)

            
    #Sana (Sponsored by Adidas)
    #18 keywords
    s1=["Minatozaki Sana","minatozaki","minatozaki sana"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Sana'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in Sanauser['id']:
            Sanauser = Sanauser.append(row)
    
    #Seolhyun (Sponsored by Nike)
    #17 keywords
    s1=["Kim Seol Hyun","kim seol hyun","Kim Seolhyun","seolhyun kim","Kim Seol-hyun",
       "kim seol-hyun","SEOLHYUN","seolhyun","Seolhyun","SeolHyun","KIM SEOLHYUN",
       "Seol-hyun","seol-hyun","Seolhyun Kim","Seol Hyun", "seol hyun","SEOLHYUN KIM"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Seolhyun'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in Seolhyunuser['id']:
            Seolhyunuser = Seolhyunuser.append(row)
                
    #Solar 
    #16 keywords
    s1=["Solarsido","solarsido","SOLARSIDO","Kim Yongsun","kim yongsun","Kim Yong-sun",
       "kim yongsun","solar.mamamoo","yongsun kim","Yongsun Kim","yong-sun kim","Yong-sun Kim",
       "Solar Kim","Kim Solar","MAMAMOO Solar","Yongddoni"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Solar'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in Solaruser['id']:
            Solaruser = Solaruser.append(row)

    #GFriend 
    #21 keywords
    s1=["GFRIEND","Gfriend","GFriend","Gfriends",
       "Eunha","EUNHA","eunha","Jung Eun-bi","EunHa",
       "Jung Ye-rin","Sowon","Kim So-jung","Kim So Jung",
       "YUJU","Yuju","Choi Yu-na","Choi Yu Na","SinB",
       "Umji","Kim Ye-won","Kim Ye Won"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'GFriend'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in GFrienduser['id']:
            GFrienduser = GFrienduser.append(row)
                 
    #iZone (produce 48) 
    #25 keywords
    s1=["iZone","Jang Won-young","Jang Won Young","Ahn Yu-jin","Ahn Yu Jin",
       "Jo Yu-ri","IZ*ONE","IZ*ONE's","Jo Yu Ri","Sakura Miyawaki","Nako Yabuki",
        "Kwon Eunbi","Kim Min-ju","Kim Min Ju","Lee Chaeyeon","Lee Chae-yeon",
       "Lee Chae Yeon","Hitomi Honda","Kim Chaewon","Choi Ye-na","Choi Ye Na",
       "CHOI YE NA","Kang Hye-won","Kang Hye Won","KANG HYE WON"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'iZone'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in iZoneuser['id']:
            iZoneuser = iZoneuser.append(row)
                
    #BTS (boy group 2013) 
    #18 keywords
    s1=["BTS","bangtan","bangtanboys","Bangtanboys","BangtanBoys","Jungkook",
       "Jeon Jung-kook","Jeon Jung Kook","minyoongi","Min Yoongi","Min yoongi",
        "Jung Hoseok","Kim Taehyung","Kim Seok Jin","kim seok Jin","Kim Seok-jin",
        "Park Jimin","Kim Namjoon"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'BTS'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in BTSuser['id']:
            BTSuser = BTSuser.append(row)
                
    #NCT (boy group 2018) 
    #38 keywords
    s1=["NCT","NCTDream","Neo Culture Technology""Jaehyun","Jeong Yoon-oh","Yuta Nakamoto",
        "Lee Je No","LeeJeno","chenle","Chenle","Hendery",
       "Dong Si Cheng","WayV","Shotaro","shotaro","Taeyong","Lee Tae-yong",
       "Lee Tae Yong","Park Ji Sung","Chittaphon Leechaiyapornkul","Haechan","haechan",
        "WayV for","WayV_For_Life","Mark Lee","Sungchan","Doyoung","Kim Dong-young",
        "Taeil","Moon Taeil","Jaemin","Na Jaemin","na jaemin","Johnny Suh","Jungwoo",
        "kim jungwoo","Kim Jungwoo","Renjun","Xiaojun"]
    u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'NCT'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=30)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u1.columns)
            u1 = u1.append(a_series, ignore_index=True)
    
    for index, row in u1.iterrows():
        if row['id'] not in NCTuser['id']:
            NCTuser = NCTuser.append(row)
                
    #### conclud
    end_r = time.time()
    sec_r = end_r - start_r
    print("Round",n,"completed")
    print("Time Lapses:",str(datetime.timedelta(seconds=sec_r)))
    time.sleep(1)
    
end = time.time()
sec = end - start
str(datetime.timedelta(seconds=sec))


Miyeonuser.shape
Sanauser.shape
Seolhyunuser.shape
Solaruser.shape
GFrienduser.shape
iZoneuser.shape
BTSuser.shape
NCTuser.shape

txt_data = txt_data.append(Miyeonuser)
txt_data = txt_data.append(Sanauser)
txt_data = txt_data.append(Seolhyunuser)
txt_data = txt_data.append(Solaruser)
txt_data = txt_data.append(GFrienduser)
txt_data = txt_data.append(iZoneuser)
txt_data = txt_data.append(BTSuser)
txt_data = txt_data.append(NCTuser)
txt_data.shape
txt_data.id.value_counts()

txt_data.to_csv("txt_data_korean4.csv",index=False)



#txt_data.groupby(['Celebrity','id']).size().reset_index(name='Freq')

