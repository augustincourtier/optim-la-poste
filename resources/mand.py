from math import *
from manp import searched_posts_1


def distance(position, post):
    lat1 = deg_to_rad(float(position_dict[position]["latitude"]))
    lat2 = deg_to_rad(float(position_dict[post]["latitude"]))
    lon1 = deg_to_rad(float(position_dict[position]["longitude"]))
    lon2 = deg_to_rad(float(position_dict[post]["longitude"]))
    d = 2 * 6371 * asin(sqrt(sin((lat2 - lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((lon2 - lon1)/2)**2))
    return d


def deg_to_rad(deg):
    return deg/180*pi

with open('./manv.txt') as file:
    lines = file.readlines()
    file.close()

split_lines = []

for line in lines:
    split_lines.append(line.split())

position_dict = {}
for position in split_lines:
    if position[1] not in position_dict.keys():
        position_dict[position[1]] = {}
        position_dict[position[1]]["longitude"] = position[3]
        position_dict[position[1]]["latitude"] = position[2]

distances = []
for position in split_lines:
    for post in searched_posts_1:
        distances.append("d " + position[1] + " " + post + " " + str(distance(position[1], post)))


file2 = open('./mand.txt', 'w')
for dist in distances:
    file2.write(dist + "\n")
file2.close()



