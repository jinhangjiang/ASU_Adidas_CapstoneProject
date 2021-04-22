# -*- coding: utf-8 -*-
"""
Created on Fri Mar 26 20:33:16 2021

@author: Jinhang Jiang
"""

import praw
import pandas as pd
import time
import datetime


#connect to reddit
reddit = praw.Reddit(client_id='OBU5A7M8VyChGw',
                 client_secret="aLLrsXpQkpCLQlqmaRlt3u_zD6blyw",
                 username='sketchyfingers',
                 password='fallout2548',
                 user_agent='data_extract',
                 check_for_async=False)

# build a ultimate table
txt_data= pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])


blackpinkuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
naeunuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
KerwinFrostuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
Beyonceuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
ZoeSaldanauser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
KarlieKlossuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
YaraShahidiuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
PharrellWilliamsuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
AdrieneMishleruser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
NinjasHyperuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
BadBunnyuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt']) 
JerryLorenzouser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt']) 
ChinaeAlexanderuser = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
AllyLoveuser =  pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])

u1=[]
u1 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u2=[]
u2 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u3=[]
u3 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u4=[]
u4 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u5=[]
u5 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u6=[]
u6 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u7=[]
u7 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u8=[]
u8 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u9=[]
u9 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u10=[]
u10 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u11=[]
u11 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u12=[]
u12 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u13=[]
u13 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])
u14=[]
u14 = pd.DataFrame(columns=['Celebrity','id','author','subreddit','Date','Score','num_comments','txt'])

n = 0


start = time.time()
while n < 1:
    n += 1
    print("Round",n,"started")
    start_r = time.time()
    print("0/14")
    #BlackPink (sponsored by Adidas)
    #21 keywords
    s1=["BlackPink","BLACKPINK","blackpink","Blackpink","blackPink","Black Pink"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'BlackPink'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
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
        if row['id'] not in blackpinkuser['id']:
            blackpinkuser = blackpinkuser.append(row)
    print("Black Pink:",blackpinkuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

    print("1/14")        
    #Naeun (Sponsored by Adidas)
    #18 keywords
    s1=["naeun","Naeun","NAEUN","Son Na-eun","son Na-eun","SonNa-eun","SonNaeun",
       "Naeun son","naeun son","sonnaeun","Na-eun","GoToNyu","Son Naeun","Son Yeoshin",
       "son yeoshin","SON YEOSHIN","na-eun","son na-eun"]
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Naeun Son'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u2.columns)
            u2 = u2.append(a_series, ignore_index=True)
    
    for index, row in u2.iterrows():
        if row['id'] not in naeunuser['id']:
            naeunuser = naeunuser.append(row)
    print("Naeun Son:",naeunuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("2/14")
    #Kerwin Frost (Sponsored by Nike)
    #8 keywords
    s1=["kerwin frost","Kerwin Frost","kerwinfrost","KerwinFrost",
        "kerwin Frost","Kerwin frost","Kerwinfrost","kerwinFrost"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Kerwin Frost'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u3.columns)
            u3 = u3.append(a_series, ignore_index=True)
    
    for index, row in u3.iterrows():
        if row['id'] not in KerwinFrostuser['id']:
            KerwinFrostuser = KerwinFrostuser.append(row)
    print("Kerwin Frost:",KerwinFrostuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("3/14")            
    #Beyoncé 
    #9 keywords
    s1=["Beyoncé","beyoncé","Beyonce","beyonce","Beyoncé Giselle Knowles-Carter","BEYONCE",
        "Beyoncé Giselle Knowles-Carter","beyoncé giselle knowles-carter","Beyoncé Giselle Knowles Carter"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Beyonce'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u4.columns)
            u4 = u4.append(a_series, ignore_index=True)
    
    for index, row in u4.iterrows():
        if row['id'] not in Beyonceuser['id']:
            Beyonceuser = Beyonceuser.append(row)
    print("Beyonce:",Beyonceuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("4/14")
    #Zoe Saldana 
    #9 keywords
    s1=["Zoe Saldana","ZoeSaldana","zoesaldana","zoe saldana",
         "Zoë Yadira Saldaña Nazario","Zoe saldana","zoe Saldana","zoeSaldana","Zoesaldana"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Zoe Saldana'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u5.columns)
            u5 = u5.append(a_series, ignore_index=True)
    
    for index, row in u5.iterrows():
        if row['id'] not in ZoeSaldanauser['id']:
            ZoeSaldanauser = ZoeSaldanauser.append(row)
    print("Zoe Saldana:",ZoeSaldanauser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("5/14")           
    #Karlie Kloss (produce 48) 
    #25 keywords
    s1=["karlie kloss","Karlie Kloss","karliekloss","KarlieKloss",
        "karlie Kloss","Karlie kloss","karlieKloss","Karliekloss","Karlie Elizabeth Kloss"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Karlie Kloss'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u6.columns)
            u6 = u6.append(a_series, ignore_index=True)
    
    for index, row in u6.iterrows():
        if row['id'] not in KarlieKlossuser['id']:
            KarlieKlossuser = KarlieKlossuser.append(row)
    print("Karlie Kloss:",KarlieKlossuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("6/14")        
    #Yara Shahidi (boy group 2013) 
    #18 keywords
    s1=["Yara Shahidi","YaraShahidi","yara shahidi","yarashahidi","Yara shahidi","yara Shahidi","Yarashahidi","yaraShahidi",
        "Yara Sayeh Shahidi","YaraSayehShahidi","yara sayeh shahidi","yarasayehshahidi"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Yara Shahidi'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u7.columns)
            u7 = u7.append(a_series, ignore_index=True)
    
    for index, row in u7.iterrows():
        if row['id'] not in YaraShahidiuser['id']:
            YaraShahidiuser = YaraShahidiuser.append(row)
    print("Yara Shahidi:",YaraShahidiuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("7/14")            
    #Pharrell Williams
    # keywords
    s1=["PharrellWilliams","Pharrell Williams","pharrellwilliams","pharrell williams",
        "Pharrell Lanscilo Williams","PharrellLansciloWilliams","pharrell lanscilo williams"]
  
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Pharrell Williams'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u8.columns)
            u8 = u8.append(a_series, ignore_index=True)
    
    for index, row in u8.iterrows():
        if row['id'] not in PharrellWilliamsuser['id']:
            PharrellWilliamsuser = PharrellWilliamsuser.append(row)
    print("Pharrell Williams:",PharrellWilliamsuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("8/14")
    #Adriene Mishler
    # keywords
    s1=["AdrieneMishler","Adriene Mishler","adriene mishler","adrienemishler",
        "Adriene mishler","adriene Mishler","Adrienemishler","adrieneMishler"]
   
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Adriene Mishler'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u9.columns)
            u9 = u9.append(a_series, ignore_index=True)
    
    for index, row in u9.iterrows():
        if row['id'] not in AdrieneMishleruser['id']:
            AdrieneMishleruser = AdrieneMishleruser.append(row)
    print("Adriene Mishler:",AdrieneMishleruser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("9/14")
    #Ninjas Hyper
    # keywords
    s1=["NinjasHyper","Ninjas Hyper","ninjashyper","ninjas hyper",
        "ninjasHyper","Ninjashyper","ninjas Hyper","Ninjas hyper"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Ninjas Hyper'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u10.columns)
            u10 = u10.append(a_series, ignore_index=True)
    
    for index, row in u10.iterrows():
        if row['id'] not in NinjasHyperuser['id']:
            NinjasHyperuser = NinjasHyperuser.append(row)                
    print("Ninjas Hyper:",NinjasHyperuser.shape)
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("10/14")
    #Bad Bunny
    # keywords
    s1=["BadBunny","Badbunny","badBunny","badbunny","BADBUNNY", "Bad Bunny",
        "bad bunny","Bad bunny","bad Bunny","Benito Antonio Martínez Ocasio"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Bad Bunny'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u11.columns)
            u11 = u11.append(a_series, ignore_index=True)
    
    for index, row in u11.iterrows():
        if row['id'] not in BadBunnyuser['id']:
            BadBunnyuser = BadBunnyuser.append(row)
    print("Bad Bunny:", BadBunnyuser.shape)                
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
    
    print("11/14")
    #Jerry Lorenzo
    # keywords
    s1=["JERRY LORENZO","Jerry Lorenzo","jerry lorenzo","JERRYLORENZO","jerrylorenzo",
        "JerryLorenzo","jerrylorenzo","Fear of God"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Jerry Lorenzo'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u12.columns)
            u12 = u12.append(a_series, ignore_index=True)
    
    for index, row in u12.iterrows():
        if row['id'] not in JerryLorenzouser['id']:
            JerryLorenzouser = JerryLorenzouser.append(row) 
    print("Jerry Lorenzo:",JerryLorenzouser.shape) 
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))


    print("12/14")
    #Chinae Alexander
    # keywords
    s1=["CHINAE ALEXANDER","CHINAEALEXANDER","Chinae Alexander",
        "ChinaeAlexander","chinae alexander"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Chinae Alexander'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u13.columns)
            u13 = u13.append(a_series, ignore_index=True)
    
    for index, row in u13.iterrows():
        if row['id'] not in ChinaeAlexanderuser['id']:
            ChinaeAlexanderuser = ChinaeAlexanderuser.append(row) 
    print("Chinae Alexander:",ChinaeAlexanderuser.shape) 
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))    

    print("13/14")
    #Ally Love
    # keywords
    s1=["ALLY LOVE","ALLYLOVE","Ally Love","allylove","ally love",
        "AllyLove"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = 'Ally Love'
            b = str(i.id)
            h = i.author
            c = i.subreddit
            d = datetime.datetime.fromtimestamp(i.created_utc)
            e = i.score
            f = i.num_comments
            g = []
            i.comments.replace_more(limit=20)
            flat_comments = i.comments.list()
            already_done = set()
            for comment in flat_comments:
              if comment.id not in already_done:
                g.append(str(comment.body).replace(";", "").replace("'","").replace(",","").replace("\"","").replace("\n", " ").replace("\r"," "))
                already_done.add(comment.id)
            row = [a,b,h,c,d,e,f,g]
            a_series = pd.Series(row, index = u14.columns)
            u14 = u14.append(a_series, ignore_index=True)
    
    for index, row in u14.iterrows():
        if row['id'] not in AllyLoveuser['id']:
            AllyLoveuser = AllyLoveuser.append(row) 
    print("Ally Love:",AllyLoveuser.shape) 
    print(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))    
    print("14/14")

    #### conclud
    end_r = time.time()
    sec_r = end_r - start_r
    print("Round",n,"completed")
    print("Time Lapses:",str(datetime.timedelta(seconds=sec_r)))
    time.sleep(1)
      
end = time.time()
sec = end - start
print(str(datetime.timedelta(seconds=sec)))



txt_data = txt_data.append(blackpinkuser)
txt_data = txt_data.append(naeunuser)
txt_data = txt_data.append(KerwinFrostuser)
txt_data = txt_data.append(Beyonceuser)
txt_data = txt_data.append(ZoeSaldanauser)
txt_data = txt_data.append(KarlieKlossuser)
txt_data = txt_data.append(YaraShahidiuser)
txt_data = txt_data.append(PharrellWilliamsuser)
txt_data = txt_data.append(AdrieneMishleruser)
txt_data = txt_data.append(NinjasHyperuser)
txt_data = txt_data.append(BadBunnyuser)
txt_data = txt_data.append(JerryLorenzouser)
txt_data = txt_data.append(ChinaeAlexanderuser)
txt_data = txt_data.append(AllyLoveuser)


txt_data.shape
txt_data.id.value_counts()

txt_data.to_csv("txt_data_full4.csv",index=False)


txt_data.groupby(['Celebrity','id']).size().reset_index(name='Freq')
