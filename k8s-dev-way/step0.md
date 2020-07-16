Lorsque nous sommes à utiliser fréquemment Kubernetes, nous sommes amenés à outil la ligne de commande `kubectl`

Pour éviter de perdre du temps, il est possible de mettre en place un alias :
 
 `alias k=kubectl`{{execute}}
 
 Pour que cet alias puisse également utiliser la completion automatique, il est nécessaire de l'activer
 
 `complete -F __start_kubectl k`{{execute}}
 
 Vous pouvez maintenant utiliser `k get <TAB><TAB>` et voir les options utilisables :)