with open('./mane.txt') as file:
    lines = file.readlines()
file.close()

split_lines = []
for line in lines:
    split_lines.append(line.split())

possible_posts_1 = []
for element in split_lines:
    possible_posts_1.append(element[1])

count_1 = {}
for post in possible_posts_1:
    if post not in count_1.keys():
        count_1[post] = 1
    else:
        count_1[post] += 1

searched_posts_1 = []
input_searched_posts_1 = []
for post in count_1.keys():
    if count_1[post] >= 4:
        input_searched_posts_1.append("p " + post)
        searched_posts_1.append(post)

file = open('./manp.txt', 'w')
for post in input_searched_posts_1:
    file.write(post + "\n")
file.close()