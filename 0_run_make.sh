#uso: bash run_make.sh 1 3

count=$1
countf=$2

echo "Pasta inicial: $count"
echo "Pasta final  : $countf"

string=$(eval echo {$count..$countf})

for i in $string
do
  echo "Rodando em MR"$i

  cd "MR"$i

  cmake -DGeant4_DIR=$G4COMP /home/username/Desktop/MR/sidet2_MR/ & wait $!

  make -j & wait $!

  bash run_mr.sh 1 4 $i >& runmr.log &
  # bash run_mr.sh 5 6 $i >& runmr.log &

  cd ..

done
