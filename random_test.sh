./map/map_generator $1
GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m"
make -C ../
if [[ -f ../rush ]]
then
	echo "rush compilation OK"
else
	echo "rush not found, please make sure you have Makefile and it can generate the executable file ../rush"
	exit 1
fi
cat map/random_map | our_ans/our_rush > our_ans/random_ans
start=`date +%s%N`
cat map/random_map | ../rush > your_ans/random_ans
diff your_ans/random_ans our_ans/random_ans > diff/random.txt
flag="${GREEN}OK${NC}\n"
if [[ -s diff/random.txt ]];
then
	flag="${RED}KO${NC}\n"
else
	rm -rf diff/random.txt
fi
printf "test result : $flag"
end=`date +%s%N`
run_time=`expr $end - $start`;
base_time=1000000
printf "execution time : "
printf "$((run_time / base_time)) ms\n"
