param graphfile := "man.txt";

set INHABITANT := { read graphfile as "<2n>" comment "a"};
TODO set P (len(P) must be 125
set POST := Ensemble des sommets avec degré sortant est au moins 4
TODO is this A useful?
set A := { read graphfile as "<2n,3n>" comment "v"};

TODO can we set param before creating the associated variable? Is it sufficient to set params so that values are not modified afterwards
param open[283492455] = 1;
param open[283494345] = 1;

param time[A] := read graphfile as "<2n,3n> 4n" comment "v";

# Calculate distance using Haversine formula
TODO add the formula
defnumb dist(a,b) :=

var x[A] >=0 <=1;   # paths
var open[POST]             binary: # 1 if a post-office in on P, else 0
var client[INHABITANT cross POST]   binary: # 1 if next post-office for inhabitant i is in post p, else 0


minimize distance: sum <u,v> in A: time[u,v] * x[u,v];

# Each inhabitant goes only to a single post-office
subto assign:
    forall <i> in INHABITANT do:
        sum <p> in POST : open[i,p] == 1;

subto flow_conservation:
forall <v> in V - {source, target}:
    sum <u,v> in A: x[u,v] == sum <v,u> in A: x[v,u];

subto single_path_leaving1:
    sum <source,u> in A: x[source,u] == 1;

subto single_path_arriving0:
    sum <v,source> in A: x[v,source] == 0;