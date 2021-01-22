echo "Welcome to Arithmetic Computation and Sorting"
declare -A expressionResultStore
declare -a valueIntoArray
read -p "Enter the value of a: " a
read -p "Enter the value of b: " b
read -p "Enter the value of c: " c

expression1=`awk "BEGIN {print $a + ( $b * $c)}"`
echo "a+b*c="$expression1
expression2=`awk "BEGIN {print ($a * $b) + $c}"`
echo "a*b+c="$expression2
expression3=`awk "BEGIN {print $c + ($a / $b)}"`
echo "c+a/b="$expression3
expression4=`awk "BEGIN {print ($a % $b) + $c}"`
echo "a%b+c="$expression4
expressionResultStore[a+b*c]=$expression1
expressionResultStore[a*b+c]=$expression2
expressionResultStore[c+a/b]=$expression3
expressionResultStore[a%b+c]=$expression4
echo "Generated Dictionary:"
for i in "${!expressionResultStore[@]}"
do
	echo "$i:${expressionResultStore[$i]}"
done

for i in "${expressionResultStore[@]}"
do
	valueIntoArray[((counter++))]=$i
done


echo "Generated Array is : "${valueIntoArray[@]}

for((i=0;i<4;i++))
do
	for((j=$i+1;j<4;j++))
	do
		if [ ${valueIntoArray[i]} -lt ${valueIntoArray[j]} ]
		then
			temp=${valueIntoArray[i]}
			valueIntoArray[i]=${valueIntoArray[j]}
			valueIntoArray[j]=$temp
		fi
	done
done
echo "Sorted Array in Ascending Order is : "

for((i=3;i>=0;i--))
do
        echo ${valueIntoArray[$i]}
done
