# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import praw
import pandas as pd
#import os
import time
import datetime

#print(os.getcwd())
#os.chdir('C:/python/data')
#print(os.getcwd())

#connect to reddit
reddit = praw.Reddit(client_id='OBU5A7M8VyChGw',
                 client_secret="aLLrsXpQkpCLQlqmaRlt3u_zD6blyw",
                 username='sketchyfingers',
                 password='fallout2548',
                 user_agent='data_extract',
                 check_for_async=False)

# build a ultimate table
fanbase= []
fanbase= pd.DataFrame(fanbase)

# build sublists
blackpinkuser = [] 
naeunuser = [] 
Seolhyunuser = []
Solaruser = []
GFrienduser = [] 
iZoneuser = []
BTSuser = []
NCTuser = []
KerwinFrostuser = []
Beyonceuser = []
ZoeSaldanauser = []
KarlieKlossuser = []
YaraShahidiuser = []
PharrellWilliamsuser = []
AdrieneMishleruser = []
NinjasHyperuser = []
BadBunnyuser = []
JerryLorenzouser = []
ChinaeAlexanderuser = []
AllyLoveuser = []
Miyeonuser = []
Sanauser=[]

####
u1 = []
u2 = []
u3 = []
u4 = []
u5 = []
u6 = []
u7 = []
u8 = []
u9 = []
u10 = []
u11 = []
u12 = []
u13 = []
u14 = []
u15 = []
u16 = []
u17 = []
u18 = []
u19 = []
u20 = []
u21 = []
u22 = []

n = 0

start = time.time()
while n < 1:
    n += 1
    print("Round",n,"started")
    start_r = time.time()
    #BlackPink (sponsored by Adidas)
    #21 keywords
    s1=["BlackPink","BLACKPINK","blackpink","Blackpink","blackPink","Black Pink"
       "Kim Ji-soo","Jisoo","jisoo","Jisoo turtle rabbit Kim","JISOO",
       "Jennie Kim","JENNIE KIM",
       "Lalisa Manoban","LISA MANOBAN","Roseanne Park","Rosé Park","Rose Park"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u1.append(b)
                       
    for u in u1:
        if u1.count(u) > 2:
            if u not in blackpinkuser:
                blackpinkuser.append(u)
    print("1/22")        
    #Naeun (Sponsored by Adidas)
    #18 keywords
    s1=["naeun","Naeun","NAEUN","Son Na-eun","son Na-eun","SonNa-eun","SonNaeun",
       "Naeun son","naeun son","sonnaeun","Na-eun","GoToNyu","Son Naeun","Son Yeoshin",
       "son yeoshin","SON YEOSHIN","na-eun","son na-eun"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u2.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u2.append(b)
            
    for u in u2:
        if u2.count(u) > 2:
            if u not in naeunuser:
                naeunuser.append(u)
    print("2/22")
    #Seolhyun (Sponsored by Nike)
    #17 keywords
    s1=["Kim Seol Hyun","kim seol hyun","Kim Seolhyun","seolhyun kim","Kim Seol-hyun",
       "kim seol-hyun","SEOLHYUN","seolhyun","Seolhyun","SeolHyun","KIM SEOLHYUN",
       "Seol-hyun","seol-hyun","Seolhyun Kim","Seol Hyun", "seol hyun","SEOLHYUN KIM"]
    

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u3.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u3.append(b)
                       
    for u in u3:
        if u3.count(u) > 2:
            if u not in Seolhyunuser:
                Seolhyunuser.append(u)
    print("3/22")
    #Solar 
    #16 keywords
    s1=["Solarsido","solarsido","SOLARSIDO","Kim Yongsun","kim yongsun","Kim Yong-sun",
       "kim yongsun","solar.mamamoo","yongsun kim","Yongsun Kim","yong-sun kim","Yong-sun Kim",
       "Solar Kim","Kim Solar","MAMAMOO Solar","Yongddoni"]
   
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u4.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u4.append(b)
            
    for u in u4:
        if u4.count(u) > 2:
            if u not in Solaruser:
                Solaruser.append(u)
    print("4/22")
    #GFriend 
    #21 keywords
    s1=["GFRIEND","Gfriend","GFriend","Gfriends",
       "Eunha","EUNHA","eunha","Jung Eun-bi","EunHa",
       "Jung Ye-rin","Sowon","Kim So-jung","Kim So Jung",
       "YUJU","Yuju"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u5.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u5.append(b)
            
    for u in u5:
        if u5.count(u) > 2:
            if u not in GFrienduser:
                GFrienduser.append(u)
    
    print("5/22")
    #iZone (produce 48) 
    #25 keywords
    s1=["iZone","Jang Won-young","Jang Won Young","Ahn Yu-jin","Ahn Yu Jin",
       "Jo Yu-ri","IZ*ONE","IZ*ONE's","Jo Yu Ri","Sakura Miyawaki","Nako Yabuki",
        "Kwon Eunbi","Kim Min-ju","Kim Min Ju","Lee Chaeyeon","Lee Chae-yeon"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u6.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u6.append(b)          
            
    for u in u6:
        if u6.count(u) > 2:
            if u not in iZoneuser:
                iZoneuser.append(u)
    
    print("6/22")
    #BTS (boy group 2013) 
    #18 keywords
    s1=["BTS","bangtan","bangtanboys","Bangtanboys","BangtanBoys","Jungkook",
       "Jeon Jung-kook","Jeon Jung Kook","minyoongi","Min Yoongi","Min yoongi",
        "Jung Hoseok"]
    
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u7.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u7.append(b)
            
                        
    for u in u7:
        if u7.count(u) > 2:
            if u not in BTSuser:
                BTSuser.append(u) 
    
    print("7/22")
    #NCT (boy group 2018) 
    #38 keywords
    s1=["NCT","NCTDream","Neo Culture Technology""Jaehyun","Jeong Yoon-oh","Yuta Nakamoto",
        "Lee Je No","LeeJeno","chenle","Chenle","Hendery",
       "Dong Si Cheng","WayV","Shotaro","shotaro","Taeyong"
       ]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u8.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u8.append(b)
                 
    for u in u8:
        if u8.count(u) > 2:
            if u not in NCTuser:
                NCTuser.append(u)
    
    print("8/22")
    #Kerwin Frost 
    #8 keywords
    s1=["kerwin frost","Kerwin Frost","kerwinfrost","KerwinFrost",
        "kerwin Frost","Kerwin frost","Kerwinfrost","kerwinFrost"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u9.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u9.append(b)
                 
    for u in u9:
        if u9.count(u) > 2:
            if u not in NCTuser:
                KerwinFrostuser.append(u)
                
    print("9/22")
    #Beyonce
    #9 keywords
    s1=["Beyoncé","beyoncé","Beyonce","beyonce","Beyoncé Giselle Knowles-Carter","BEYONCE",
        "Beyoncé Giselle Knowles-Carter","beyoncé giselle knowles-carter","Beyoncé Giselle Knowles Carter"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u10.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u10.append(b)
                 
    for u in u10:
        if u10.count(u) > 2:
            if u not in NCTuser:
                Beyonceuser.append(u)
    
    print("10/22")
    #Zoe Saldana
    #8 keywords
    s1=["Zeo Saldana","ZoeSaldana","zoesaldana","zoe saldana", "Zoe Yadira Saldana Nazario",
        "zoe Saldana","zoeSaldana","Zoesaldana"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u11.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u11.append(b)
                 
    for u in u11:
        if u11.count(u) > 2:
            if u not in NCTuser:
                ZoeSaldanauser.append(u)
                            
    print("11/22")
    #Karlie Kloss
    #9 keywords
    s1=["karlie kloss","Karlie Kloss","karliekloss","KarlieKloss","karlie Kloss",
        "Karlie kloss","karlieKloss","Karliekloss","Karlie Elizabeth Kloss"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u12.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u12.append(b)
                 
    for u in u12:
        if u12.count(u) > 2:
            if u not in NCTuser:
                KarlieKlossuser.append(u)
    
    print("12/22")
    #Yara Shahidi
    #12 keywords
    s1=["Yara Shahidi","YaraShahidi","yara shahidi","yarashahidi","Yara shahidi","yara Shahidi","Yarashahidi","yaraShahidi",
        "Yara Sayeh Shahidi","YaraSayehShahidi","yara sayeh shahidi","yarasayehshahidi"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u13.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u13.append(b)
                 
    for u in u13:
        if u13.count(u) > 2:
            if u not in NCTuser:
                YaraShahidiuser.append(u)
    
    print("13/22")
    #Pharrell Williams
    #12 keywords
    s1=["PharrellWilliams","Pharrell Williams","pharrellwilliams","pharrell williams",
        "Pharrell Lanscilo Williams","PharrellLansciloWilliams","pharrell lanscilo williams"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u14.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u14.append(b)
                 
    for u in u14:
        if u14.count(u) > 2:
            if u not in NCTuser:
                PharrellWilliamsuser.append(u)
                
    
    print("14/22")
    #Adriene Mishler
    #12 keywords
    s1=["AdrieneMishler","Adriene Mishler","adriene mishler","adrienemishler",
        "Adriene mishler","adriene Mishler","Adrienemishler","adrieneMishler"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u15.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u15.append(b)
                 
    for u in u15:
        if u15.count(u) > 2:
            if u not in NCTuser:
                AdrieneMishleruser.append(u)
    
    print("15/22")
    #Ninjas Hyper
    #8 keywords
    s1=["NinjasHyper","Ninjas Hyper","ninjashyper","ninjas hyper",
        "ninjasHyper","Ninjashyper","ninjas Hyper","Ninjas hyper"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u16.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u16.append(b)
                 
    for u in u16:
        if u16.count(u) > 2:
            if u not in NCTuser:
                NinjasHyperuser.append(u)
    
    print("16/22")
    #Bad Bunny
    #10 keywords
    s1=["BadBunny","Badbunny","badBunny","badbunny","BADBUNNY", "Bad Bunny",
        "bad bunny","Bad bunny","bad Bunny","Benito Antonio Martínez Ocasio"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u17.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u17.append(b)
                 
    for u in u17:
        if u17.count(u) > 2:
            if u not in NCTuser:
                BadBunnyuser.append(u)
    
    print("17/22")
    #Jerry Lorenzo
    #8 keywords
    s1=["JERRY LORENZO","Jerry Lorenzo","jerry lorenzo","JERRYLORENZO","jerrylorenzo",
        "JerryLorenzo","jerrylorenzo","Fear of God"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u18.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u18.append(b)
                 
    for u in u18:
        if u18.count(u) > 2:
            if u not in NCTuser:
                JerryLorenzouser.append(u)
    
    print("18/22")
    #Chinae Alexander
    #8 keywords
    s1=["CHINAE ALEXANDER","CHINAEALEXANDER","Chinae Alexander",
        "ChinaeAlexander","chinae alexander","Chinae alexander",
        "chinaealexander","chinaeAlexander"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u19.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u19.append(b)
                 
    for u in u19:
        if u19.count(u) > 2:
            if u not in NCTuser:
                ChinaeAlexanderuser.append(u)
    
    print("19/22")
    #Chinae Alexander
    #8 keywords
    s1=["ALLY LOVE","ALLYLOVE","Ally Love","allylove","ally love",
        "AllyLove","ally Love","ALLYLove"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u20.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u20.append(b)
                 
    for u in u20:
        if u20.count(u) > 2:
            if u not in NCTuser:
                AllyLoveuser.append(u)
                
    print("20/22")
    #Miyeon
    #4 keywords
    s1=["Miyeon","miyeon","Cho Mi-yeon","Cho Miyeon"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u21.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u21.append(b)
                 
    for u in u21:
        if u21.count(u) > 2:
            if u not in NCTuser:
                Miyeonuser.append(u)
    
    print("21/22")
    #Minatozaki Sana
    #8 keywords
    s1=["Minatozaki Sana","minatozaki","Beautiful Sana","Sana"]

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u22.append(a)
            i.comments.replace_more(limit=32)
            flatten = i.comments.list()
            for comment in flatten:
                b = comment.author
                u22.append(b)
                 
    for u in u22:
        if u22.count(u) > 2:
            if u not in NCTuser:
                Sanauser.append(u)
    print("22/22")
    #### conclud
    end_r = time.time()
    sec_r = end_r - start_r
    print("Round",n,"completed")
    print("Time Lapses:",str(datetime.timedelta(seconds=sec_r)))
    time.sleep(1)
    
end = time.time()
sec = end - start
str(datetime.timedelta(seconds=sec))




table1 = pd.DataFrame({"Celebrity":"BlackPink","Usernames":blackpinkuser})
fanbase = fanbase.append(table1)
table2 = pd.DataFrame({"Celebrity":"Naeun Son","Usernames":naeunuser})
fanbase = fanbase.append(table2)
table3 = pd.DataFrame({"Celebrity":"Seolhyun","Usernames":Seolhyunuser})
fanbase = fanbase.append(table3)
table4 = pd.DataFrame({"Celebrity":"Solar","Usernames":Solaruser})
fanbase = fanbase.append(table4)
table5 = pd.DataFrame({"Celebrity":"GFriend","Usernames":GFrienduser})
fanbase = fanbase.append(table5)
table6 = pd.DataFrame({"Celebrity":"iZone","Usernames":iZoneuser})
fanbase = fanbase.append(table6)
table7 = pd.DataFrame({"Celebrity":"BTS","Usernames":BTSuser})
fanbase = fanbase.append(table7)
table8 = pd.DataFrame({"Celebrity":"NCT","Usernames":NCTuser})
fanbase = fanbase.append(table8)
table9 = pd.DataFrame({"Celebrity":"Kerwin Frost","Usernames":KerwinFrostuser})
fanbase = fanbase.append(table9)
table10 = pd.DataFrame({"Celebrity":"Beyonce","Usernames":Beyonceuser})
fanbase = fanbase.append(table10)
table11 = pd.DataFrame({"Celebrity":"Zoe Saldana","Usernames":ZoeSaldanauser})
fanbase = fanbase.append(table11)
table12 = pd.DataFrame({"Celebrity":"Karlie Kloss","Usernames":KarlieKlossuser})
fanbase = fanbase.append(table12)
table13 = pd.DataFrame({"Celebrity":"Yara Shahidi","Usernames":YaraShahidiuser})
fanbase = fanbase.append(table13)
table14= pd.DataFrame({"Celebrity":"Pharrell Williams","Usernames":PharrellWilliamsuser})
fanbase = fanbase.append(table14)
table15 = pd.DataFrame({"Celebrity":"Adriene Mishlder","Usernames":AdrieneMishleruser})
fanbase = fanbase.append(table15)
table16 = pd.DataFrame({"Celebrity":"Ninjas Hyper","Usernames":NinjasHyperuser})
fanbase = fanbase.append(table16)
table17 = pd.DataFrame({"Celebrity":"Bad Bunny","Usernames":BadBunnyuser})
fanbase = fanbase.append(table17)
table18 = pd.DataFrame({"Celebrity":"Jerry Lorenzo","Usernames":JerryLorenzouser})
fanbase = fanbase.append(table18)
table19 = pd.DataFrame({"Celebrity":"Chinae Alexander","Usernames":ChinaeAlexanderuser})
fanbase = fanbase.append(table19)
table20 = pd.DataFrame({"Celebrity":"Ally Love","Usernames":AllyLoveuser})
fanbase = fanbase.append(table20)
table21 = pd.DataFrame({"Celebrity":"Miyeon","Usernames":Miyeonuser})
fanbase = fanbase.append(table21)
table22 = pd.DataFrame({"Celebrity":"Sana","Usernames":Sanauser})
fanbase = fanbase.append(table22)

#df=pd.read_csv('networkanalysis_cum.csv')
#df.groupby(['Celebrity','Usernames']).size().reset_index(name='Freq')
#fanbase.groupby(['Celebrity','Usernames']).size().reset_index(name='Freq').Freq.sort_values()
fanbase.to_csv("nw_korea_2.csv",index=False)
fanbase.Celebrity.unique()
fanbase.Celebrity.value_counts()
s1=['BlackPink', 'Naeun Son', 'Kerwin Frost', 'Beyonce', 'Zoe Saldana',
       'Karlie Kloss', 'Yara Shahidi', 'Pharrell Williams',
       'Adriene Mishlder', 'Ninjas Hyper', 'Bad Bunny', 'Jerry Lorenzo',
       'Chinae Alexander', 'Ally Love']
s2=['BlackPink', 'Naeun Son', 'Seolhyun', 'Solar', 'GFriend', 'iZone',
       'BTS', 'NCT',  'Miyeon', 'Sana']

adidas = fanbase.loc[fanbase.Celebrity.isin(s1)]
adidas.to_csv("nw_adidas.csv",index=False)
korean = fanbase.loc[fanbase.Celebrity.isin(s2)]
korean.to_csv("nw_kor.csv",index=False)
