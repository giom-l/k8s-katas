## On teste l'expose avec 1 pod

Créons un nouveau deployment cactus : `kubectl run test-cactus-front --port=80 --labels='app=test' --image=scauglog/hello-front`{{execute}}

J'ai toujours la possibilité de trouver l'adresse IP du pod créé et de le requêter comme ça. Mais si mon pod crash et se recrée, il me faut retrouver la nouvelle adresse IP. Ce qu'on veut c'est ne pas se soucier de l'adresse IP de notre pod. Pour exposer un ou plusieurs pods, on utilise un service.

`kubectl expose deployment test-cactus-front --type=ClusterIP --name=my-service --dry-run -o yaml`{{execute}}

Que fait cette commande ? Vous verrez qu'à la fin j'ai ajouté les options `--dry-run` et `-o yaml`. Cela me permet de simuler l'exécution de ma commande et de récupérer l'output sous forme d'un fichier yaml. Le même yaml qui nous sert à créer nos ressources depuis du code.

Cette commande permet de créer un service qui exposera le port de nos pods définis dans notre deployment `test-cactus-front`. Le yaml que l'on récupère est la définition as code de ce service. On peut le récupérer dans un fichier et créer notre service depuis ce fichier comme ça :

`kubectl expose deployment test-cactus-front --type=ClusterIP --name=my-service --dry-run -o yaml > service.yaml`{{execute}}
`kubectl apply -f service.yaml`{{execute}}

On peut récupérer l'adresse IP de notre service : `kubectl get svc`{{execute}} dans la colonne `CLUSTER-IP` et l'utiliser pour requêter nos pods. Peu importe combien de fois nos pods redémarreront, notre service nous permettra toujours de les joindre de la même façon.

Faites le ménage et cette fois-ci on va exposer notre `cactus-front`
`kubectl delete -f service.yaml`{{execute}}
`kubectl delete deploy test-cactus-front`{{execute}}

## ClusterIP

Créez un service pour exposer les pods de votre deployment `cactus-front` :
* type : clusterIP
* port : 80
* targetPort : 80
* selector : celui qui correspond à vos pods

>>Combien de clusterIP crée notre service pour exposer nos 3 pods ?<<
(*) 1
( ) 3

>>Est-ce que je peux utiliser l'IP de notre clusterIP pour accéder à notre cactus depuis les internets mondiaux ? (indice : essayez)<<
( ) oui
(*) non
