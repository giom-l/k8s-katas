echo "In order to type quicker your command, you may use some aliases."
echo "Let's try : alias k=kubectl"
alias k=kubectl
echo "and complete -F __start_kubectl k"
complete -F __start_kubectl k
echo "You can now use only k instead of kubectl and still have completion working :)"
