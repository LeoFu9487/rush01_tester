GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m"
make -C ../
if [[ -f ../rush ]]
then
	echo "rush compilation OK"
else
	echo "rush not found, please make sure you have the executable file ../rush"
	exit 1
fi
start=`date +%s%N`
for i in {1..10}
do
	cat map/map$i | ../rush > your_ans/ans$i
	diff your_ans/ans$i our_ans/ans$i > diff/diff$i.txt
done
flag="${GREEN}OK${NC}\n"
for i in {1..10}
do
	if [[ -s diff/diff$i.txt ]];
	then
		flag="${RED}KO${NC}\n"
	else
		rm -rf diff/diff$i.txt
	fi
done
printf "test result : $flag"
end=`date +%s%N`
run_time=`expr $end - $start`;
base_time=1000000
printf "execution time : "
printf "$((run_time / base_time)) ms\n"
