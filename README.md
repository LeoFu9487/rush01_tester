# rush01_tester
by yfu

## Usage :

1. Go in your repository where we can find your ```Makefile``` and please make sure it will generate an executable ```rush```

2. ```git clone https://github.com/LeoFu9487/rush01_tester.git```

3. ```cd rush01_testser```

4. ```bash test.sh```   or    ```bash random_test.sh <map size>```

5. If answer is correct, you will see OK and the execution time. Otherwise, you will see KO and you can ```cd diff``` to see the details


```KO``` means wrong answer, ```TLE``` means the execution time of your program is too long.

If you want to change the time limit, just modify the variable ```time_limit``` in both *.sh

I created this under Ubuntu 20.04. Please use Docker if your OS is not linux.
