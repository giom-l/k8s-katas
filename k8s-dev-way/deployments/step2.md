## Editer un deployment

Finalement nous ne voulons pas 1 replicas mais 3. Peux-tu mettre à jour le deployment sans coupure pour nos clients ? Attendez que tous vos pods soient bien en running `kubectl get pods`{{execute}}

>>Affichez la liste des deployments. Que voyez-vous dans la colonne ready ?<<
( ) 1/1, ça représente le nombre de replicaset créé
(*) 3/3, ça représente le nombre de pod en running
( ) 3/3, ça représente le nombre de replicaset créé
( ) 1/1, ça représente le nombre de deployment créé


Grâce à ça on va pouvoir assurer un service qui fonctionne même si un pod crash. Mais si mon pod crash, un nouveau est créé et son adresse IP change. Comment faire pour tout le temps accéder à mes 3 pods comme s'ils n'étaient qu'un ?
