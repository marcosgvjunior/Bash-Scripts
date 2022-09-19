array=(2 10 20 30 50)

for i in ${array[*]}
do

	mkdir pasta_$i	
	cd pasta_$i

	n=0
	until [ $n -ge 5 ]
	do
		echo "Começou download"
		sshpass -p 'senha' scp user@remote_computer:"directory"/filename . && break  
		n=$[$n+1]
		echo "Transfer disrupted, retrying in 15 seconds..."
		sleep 15
	done	

	date
	echo "Acabaram os downloads de $i"
	cd ..
	
done

echo "Terminou de rodar tudo"
echo ""



