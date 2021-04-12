TIME_LIMIT=1
for i in {1..10}
do
	[[ -f ./our_ans/ans$i ]] || cat ./map/map$i | ./our_ans/our_rush > ./our_ans/ans$i
done
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
flag="${GREEN}OK${NC}\n"
for i in {1..10}
do
	start=`date +%s%N`
	cat map/map$i | timeout $TIME_LIMIT ../rush > your_ans/ans$i
	time_check=$(echo $?)
	diff your_ans/ans$i our_ans/ans$i > diff/diff$i.txt
	printf "test $i result : "
	if [[ -s diff/diff$i.txt ]];
	then
		flag="${RED}KO${NC}\n"
		if [[ "$time_check" = "124" ]]
		then
			printf "${RED}TLE${NC}\n"
		else
			printf "${RED}KO${NC}\n"
		fi
	else
		rm -rf diff/diff$i.txt
		printf "${GREEN}OK${NC}\n"
		end=`date +%s%N`
		run_time=`expr $end - $start`;
		base_time=1000000
		printf "execution time : "
		printf "$((run_time / base_time)) ms\n"
	fi
done
printf "test result : $flag"
