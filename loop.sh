#!/bin/bash


for i in apple banana orange
do 
   echo "item : $i"
done

echo -e "\n-------------------------------------\n"


for i in {1..20..2}
do 
    echo "number : $i"
done

echo -e "\n-------------------------------------\n"



for file in /home/aedev/practice/*
do 
    echo "file : $file"
done

echo -e "\n-------------------------------------\n"


for ((i=1;i<=5;i++))
do 
   echo "value : $i"
done

echo -e "\n-------------------------------------\n"


array=("cat" "dog" "elephant")

echo "${array[@]}"
echo "$array[2]"
echo "${array[2]}"

echo -e "\n-------------------------------------\n"

for animal in "${array[@]}"
do 
   echo "animal : $animal"
done 
