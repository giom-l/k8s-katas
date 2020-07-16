test=$(kubectl get pod busybox)
if [$test = ""]; then
	echo done
fi
echo fail