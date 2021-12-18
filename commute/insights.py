import pandas as pd
import math
import re

commute = pd.read_csv('output/commute.csv')
excludeDays = ['Fri', 'Sat', 'Sun']
fromWorkTimes = ["02:30.*PM", "03:00.*PM", "03:30.*PM", "04:00.*PM"]
ToWorkTimes = ["05:30.*AM", "06:00.*AM", "06:30.*AM", "07:00.*AM"]
fromWorkMeans = {i.replace(".*", " "):math.ceil(commute.loc[~commute['Time'].str.contains('|'.join(excludeDays))][commute['Time'].str.contains(i)]['FromWork'].mean()) for i in fromWorkTimes}
toWorkMeans = {i.replace(".*", " "):math.ceil(commute.loc[~commute['Time'].str.contains('|'.join(excludeDays))][commute['Time'].str.contains(i)]['FromWork'].mean()) for i in ToWorkTimes}
print("<!DOCTYPE html>\n<html>\n<body>\n")
print("<h1>Approximate commute times in minutes</h1>")
print("<h2>Commuting to work</h2>")
print(f'<p style="font-size:18px;"><strong>{toWorkMeans}</strong></p>')
print("<h2>Commuting home</h2>")
print(f'<p style="font-size:18px;"><strong>{fromWorkMeans}</strong></p>')
print("</body>\n</html>")
