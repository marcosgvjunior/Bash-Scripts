#uso: bash run_run.sh >& runrun.log &
date

array=(2 10 20 30 50 100)

for i in ${array[*]}
do	 		
	echo "Rodando arquivo sidet2_"$i"M.root"
	
	#Alterando nome do arquivo para o lido pela análise
	mv "sidet2_"$i"M.root" "sidet2.root"	
	sleep 2
		
	#Rodando a análise em bg e uma de cada vez	
	./runAnalysis.sh >& "runAnalysis_"$i".log" & wait $!
	#./runAnalysis.sh >& "runAnalysis_"$i".log" &
	sleep 2
	#wait	
	
	mv "sidet2.root" "sidet2_"$i"M.root"
	sleep 2

	mv "detresp_Analysis.root" "detresp_Analysis_"$i"M_hde.root"
	sleep 2

	mv "runAnalysis_"$i".log" detresp_Analysis_hde
    sleep 2

	mv "detresp_Analysis_"$i"M_hde.root" detresp_Analysis_hde
	sleep 2
	
	date
done

echo "Terminou de rodar tudo"

echo ""

ls -l "detresp_Analysis_hde"

bash Edep_run.sh >& Edeprun.log &
