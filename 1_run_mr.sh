#uso: bash run_mr.sh 1 4 1 >& runmr.log &

count=$1
countf=$2
folder=$3

echo " "
echo "O primeiro arquivo a ser lido será: $count"
echo "O último arquivo a ser lido será: $countf"
echo "Pasta: $folder"

string=$(eval echo {$count..$countf})

for i in $string
do
  
  #Nomes em sequencia mesmo com simulações em pastas diferentes
  let "number = ($folder - 1 )*(countf - count + 1) + $i"

  echo " " >> runmr.log
  echo "Rodando arquivo sidet2 pela "$i"-ésima vez" >> runmr.log
  date >> runmr.log

  ./sidet2 sidet2.mac >& "run_sidet_"$i".log" & wait $!
  sleep 1

  mv "sidet2.root" "sidet2_"$number".root"
  sleep 1
done
