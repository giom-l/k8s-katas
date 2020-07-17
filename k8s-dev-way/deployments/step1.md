## Créer un pod pour le cactus front

On peut facilement créer un pod pour déployer notre cactus front :

`kubectl run cactus-front --image=scauglog/hello-front:nginx-alpine`{{execute}}

Attendez de le voir en status **running** : `kubectl get pods`{{execute}}

En revanche si votre conteneur s'éteint, il ne se relancera pas :
`kubectl delete pod cactus-front`{{execute}}
`kubectl get pods`{{execute}}

## Créer le deployment pour cactus front
Pour éviter ce genre de problème, on ne crée pas directement un pod mais un deployment.

Créer un deployment avec les caractéristiques suivantes :
* **deploy name** : cactus-front
* **image** : scauglog/hello-front:nginx-alpine
* **replicas** : 1
* **containerPort** : 80
* **labels** : app=front

## Tester son deployment

En utilisant la commande **curl** et en récupérant l'adresse IP du pod créé, envoyez une requête **GET** à votre pod.

## Supprimer le pod

Essayez de supprimer le pod créé en récupérant son nom `kubectl get pods`{{execute}}, il se recréera. Sauf si vous supprimez le deployment. Notez que lorsque kubernetes recrée un pod, l'IP change. Vous ne pouvez plus utiliser le même **curl**.

## Lister les ressources

>>Lorsque vous avez créé votre deployment, qu'est-ce qui a été créé par kubernetes ?<<
(*) un pod, un replicaset et un deployment
( ) un pod et un deployment
( ) un deployment
( ) un deployment et un replicaset