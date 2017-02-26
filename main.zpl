# Parameters
param graphfile_v := "./resources/manv.txt";
param graphfile_p := "./resources/manp.txt";
param graphfile_d := "./resources/mand.txt";
param graphfile_e := "./resources/mane.txt";


# Initializations
set INHABITANTS := { read graphfile_v as "<2n>" };				# ids of the inhabitants
set POSTS := { read graphfile_p as "<2n>" };					# ids of the posts
set DISTANCES := { read graphfile_d as "<2n,3n>" };				# tuples of ids for the distances


# Variables
var open[POSTS] binary;  										# 1 if a post-office in on post, else 0
var client[INHABITANTS cross POSTS] >= 0 <=1;					# 1 if next post-office for inhabitant i is in post p, else 0


# Parameters
param dist[DISTANCES] := read graphfile_d as "<2n,3n> 4n";		# save the distance for each tuple of ids in DISTANCES


# Minimize the distance + the cost of opening
minimize cost: (sum<p> in POSTS: 500*open[p]) + (sum<i, p> in INHABITANTS cross POSTS: client[i, p]*dist[i,p]);


# Each inhabitant goes only to a single post-office
subto assign:
    forall <i> in INHABITANTS :
        sum <p> in POSTS : client[i, p] == 1;

# If a post is open then it has at least one client
subto build:
	forall <i, p> in INHABITANTS cross POSTS :
		forall <p> in POSTS : client[i,p] <= open[p];

# Open the first posts
subto start:
	open[283492455] + open[283494345] == 2;
