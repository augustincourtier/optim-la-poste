# Optimization course – Yannick Morel & Augustin Courtier
Devoir maison numéro 2 – Février 2017

### Données utilisées
À partir des données fournies dans man.txt, nous avons construit différents documents utiles pour la résolution du problème :
+ `manv.txt` regroupe l'ensemble des sommets du graph
+ `mane.txt` regroupe l'ensemble des arcs du graph
+ `manp.txt` regroupe l'ensemble des sommets où il est possible de construire une poste (>= 4 arcs sortants). Ce fichier est construit à l'aide du fichier python `manp.py`
+ `mand.txt` qui regroupe les distances entre les sommets du graph et l'ensemble des sommets où il est possible de construire une poste. Ces distances sont calculées grâce à la formule de Haversine, avec le fichier python `mand.py`

### Fichier Zimpl
Pour la résolution du problème, les explications sont dans les commentaires du document `main.zpl`. 