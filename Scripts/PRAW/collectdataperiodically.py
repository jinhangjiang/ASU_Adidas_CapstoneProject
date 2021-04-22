# -*- coding: utf-8 -*-
"""
Created on Sun Mar 21 20:14:24 2021

@author: Jinhang Jiang
"""

import praw
import pandas as pd
import os
import time
import datetime

print(os.getcwd())
os.chdir('D:/OneDrive/ASU/2021 Spring/Applied Project/ASU_Applied_Project_2021/Data')
print(os.getcwd())

reddit = praw.Reddit(client_id='4Ny8ZuJQqE_g4g',
                 client_secret="DPzsvF90jMWRBhjmgiFEfTrg9_RywA",
                 username='jjhasucis509',
                 password='zxcvbnm123',
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


n = 0


start = time.time()
while n < 18:
    n += 1
    print("Round",n,"started")
    start_r = time.time()
    #BlackPink (sponsored by Adidas)
    #21 keywords
    s1=["BlackPink","BLACKPINK","blackpink","Blackpink","blackPink","Black Pink"
       "Kim Ji-soo","Jisoo","jisoo","Jisoo turtle rabbit Kim","JISOO",
       "Jennie Kim","JENNIE KIM",
       "Lalisa Manoban","LISA MANOBAN","LISA"
       "Roseanne Park","Rosé Park","Rose Park","ROSE PARK","Park Chae-young"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
                       
    for u in u1:
        if u1.count(u) > 2:
            if u not in blackpinkuser:
                blackpinkuser.append(u)
            
    #Naeun (Sponsored by Adidas)
    #18 keywords
    s1=["naeun","Naeun","NAEUN","Son Na-eun","son Na-eun","SonNa-eun","SonNaeun",
       "Naeun son","naeun son","sonnaeun","Na-eun","GoToNyu","Son Naeun","Son Yeoshin",
       "son yeoshin","SON YEOSHIN","na-eun","son na-eun"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
            
    for u in u1:
        if u1.count(u) > 2:
            if u not in naeunuser:
                naeunuser.append(u)
    
    #Seolhyun (Sponsored by Nike)
    #17 keywords
    s1=["Kim Seol Hyun","kim seol hyun","Kim Seolhyun","seolhyun kim","Kim Seol-hyun",
       "kim seol-hyun","SEOLHYUN","seolhyun","Seolhyun","SeolHyun","KIM SEOLHYUN",
       "Seol-hyun","seol-hyun","Seolhyun Kim","Seol Hyun", "seol hyun","SEOLHYUN KIM"]
    u1 = []

    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
                       
    for u in u1:
        if u1.count(u) > 2:
            if u not in Seolhyunuser:
                Seolhyunuser.append(u)
    #Solar 
    #16 keywords
    s1=["Solarsido","solarsido","SOLARSIDO","Kim Yongsun","kim yongsun","Kim Yong-sun",
       "kim yongsun","solar.mamamoo","yongsun kim","Yongsun Kim","yong-sun kim","Yong-sun Kim",
       "Solar Kim","Kim Solar","MAMAMOO Solar","Yongddoni"]
    u1 = []
   
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
            
    for u in u1:
        if u1.count(u) > 2:
            if u not in Solaruser:
                Solaruser.append(u)
    #GFriend 
    #21 keywords
    s1=["GFRIEND","Gfriend","GFriend","Gfriends",
       "Eunha","EUNHA","eunha","Jung Eun-bi","EunHa",
       "Jung Ye-rin","Sowon","Kim So-jung","Kim So Jung",
       "YUJU","Yuju","Choi Yu-na","Choi Yu Na","SinB",
       "Umji","Kim Ye-won","Kim Ye Won"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
            
    for u in u1:
        if u1.count(u) > 2:
            if u not in GFrienduser:
                GFrienduser.append(u)
    
    #iZone (produce 48) 
    #25 keywords
    s1=["iZone","Jang Won-young","Jang Won Young","Ahn Yu-jin","Ahn Yu Jin",
       "Jo Yu-ri","IZ*ONE","IZ*ONE's","Jo Yu Ri","Sakura Miyawaki","Nako Yabuki",
        "Kwon Eunbi","Kim Min-ju","Kim Min Ju","Lee Chaeyeon","Lee Chae-yeon",
       "Lee Chae Yeon","Hitomi Honda","Kim Chaewon","Choi Ye-na","Choi Ye Na",
       "CHOI YE NA","Kang Hye-won","Kang Hye Won","KANG HYE WON"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)           
            
    for u in u1:
        if u1.count(u) > 2:
            if u not in iZoneuser:
                iZoneuser.append(u)
    #BTS (boy group 2013) 
    #18 keywords
    s1=["BTS","bangtan","bangtanboys","Bangtanboys","BangtanBoys","Jungkook",
       "Jeon Jung-kook","Jeon Jung Kook","minyoongi","Min Yoongi","Min yoongi",
        "Jung Hoseok","Kim Taehyung","Kim Seok Jin","kim seok Jin","Kim Seok-jin",
        "Park Jimin","Kim Namjoon"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
                        
    for u in u1:
        if u1.count(u) > 2:
            if u not in BTSuser:
                BTSuser.append(u) 
    #NCT (boy group 2018) 
    #38 keywords
    s1=["NCT","NCTDream","Neo Culture Technology""Jaehyun","Jeong Yoon-oh","Yuta Nakamoto",
        "Lee Je No","LeeJeno","chenle","Chenle","Hendery",
       "Dong Si Cheng","WayV","Shotaro","shotaro","Taeyong","Lee Tae-yong",
       "Lee Tae Yong","Park Ji Sung","Chittaphon Leechaiyapornkul","Haechan","haechan",
        "WayV for","WayV_For_Life","Mark Lee","Sungchan","Doyoung","Kim Dong-young",
        "Taeil","Moon Taeil","Jaemin","Na Jaemin","na jaemin","Johnny Suh","Jungwoo",
        "kim jungwoo","Kim Jungwoo","Renjun","Xiaojun"]
    u1 = []
    all = reddit.subreddit("all")
    for j in s1:
        for i in all.search(j, limit=None):
            a = i.author
            u1.append(a)
                 
    for u in u1:
        if u1.count(u) > 2:
            if u not in NCTuser:
                NCTuser.append(u)
    #### conclud
    end_r = time.time()
    sec_r = end_r - start_r
    print("Round",n,"completed")
    print("Time Lapses:",str(datetime.timedelta(seconds=sec_r)))
    time.sleep(300)
    
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
table8 = pd.DataFrame({"Celebrity":"BTS","Usernames":BTSuser})
fanbase = fanbase.append(table8)

#df=pd.read_csv('networkanalysis_cum.csv')
#df.groupby(['Celebrity','Usernames']).size().reset_index(name='Freq')
#df.groupby(['Celebrity','Usernames']).size().reset_index(name='Freq').Freq.sort_values()

