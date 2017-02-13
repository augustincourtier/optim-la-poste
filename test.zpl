param graphfile_a := "./visualize/man_a.txt";
param graphfile_v := "./visualize/man_v.txt";
param graphfile_p := "./visualize/man_p.txt";
param graphfile_d := "./visualize/man_d.txt";



# Initialize the INHABITANT and A
set INHABITANT := { read graphfile_v as "<2n>" comment "v"};
set A := { read graphfile_a as "<2n,3n>" comment "a"};


# Initialize POST and D


# Kézako x?
var x[A] >=0 <=1;								# paths
var open[POST] binary;  						# 1 if a post-office in on P, else 0
var client[INHABITANT cross POST] binary;		# 1 if next post-office for inhabitant i is in post p, else 0


# Open the 2 initial posts and save the time
param open[POST] := <283492455> 1, <283494345> 1;
param time[A] := read graphfile_a as "<2n,3n> 4n" comment "a";


# Minimize the distance
minimize distance: sum <u,v> in A: time[u,v] * x[u,v];


# Each inhabitant goes only to a single post-office
subto assign:
    forall <i> in INHABITANT do:
        sum <p> in POST : open[i,p] == 1;
