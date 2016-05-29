#!/bin/bash

# 96 / 103284 | .09294760079005460600
# grep -vE "[a-z]+'s[a-z]+"

# 457 / 108326 | .42187471151893358900
# grep -vE "'[a-z]+'"

# 1735 / 475965 | .36452260145178742100
# grep -vE "[^aeiouy]{6,}"

# 20345 / 635898 | 3.19941248439215094200
# grep -vE "[^aeiouy]{5,}"

# 455 / 31353 | 1.45121678946193346700
# grep -vE "[bpfv]{3,}"

# 343 / 55885 | .61376040082311890400
# grep -vE "[cskgjqxz]{4,}"

# 4 / 1501 | .26648900732844770100
# grep -vE "[mnr]{4,}"

# 16 / 2554 | .62646828504306969400
# grep -vE "[dtl]{4,}"

#######################################
# 20737 / 712523 | 2.91036219181696590800
# 2968 / 595235 | .49862659285828286300
# 21379 / 719865 | 2.96986240475644738900
# 20933 / 715564 | 2.92538473148453527500

cat ./db/all_true.txt   | grep -vE "[a-z]+'s[a-z]+" | grep -vE "'[a-z]+'" | grep -vE "[^aeiouy]{5,}"   > ./db/all_true_rule.txt
cat ./db/all_false.txt  | grep -vE "[a-z]+'s[a-z]+" | grep -vE "'[a-z]+'" | grep -vE "[^aeiouy]{5,}"   > ./db/all_false_rule.txt
cat ./db/data.txt       | grep -vE "[a-z]+'s[a-z]+" | grep -vE "'[a-z]+'" | grep -vE "[^aeiouy]{5,}"   > ./db/data_rule.txt


# cat ./db/all_true.txt   | grep -vE "[^aeiouy]{6,}" > ./db/all_true_rule.txt
# cat ./db/all_false.txt  | grep -vE "[^aeiouy]{6,}" > ./db/all_false_rule.txt
# cat ./db/data.txt       | grep -vE "[cskgjqxz]{4,}" > ./db/data_rule.txt



T1=`cat ./db/all_true.txt | wc -l`
T2=`cat ./db/all_true_rule.txt | wc -l`
TT=$((T1 - T2))

F1=`cat ./db/all_false.txt | wc -l`
F2=`cat ./db/all_false_rule.txt | wc -l`
FF=$((F1 - F2))

T=$(echo "($TT / $FF) * 100" | bc -l)
echo "${TT} / ${FF} | ${T}"