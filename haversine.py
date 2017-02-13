from math import *


def distance(a, b):
    lat1 = a["latitude"]
    lat2 = b["latitude"]
    lon1 = a["longitude"]
    lon2 = b["longitude"]
    d = 2 * 6400 * asin(sqrt(sin((lat2 - lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((lon2 - lon1)/2)**2))
    return d

# with open("./post.txt", r) as post:
# 	post.open()
# 	posts = post.read()
# 	with open("h")



