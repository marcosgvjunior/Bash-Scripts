
RETT=1
until [ ${RETT} -eq 0 ]; do

	date

	sshpass -p 'senha' scp filename user@remote_computer:"directory"

	RETT=$?
	
   sleep 10
done

date

echo "Acabou de enviar."
