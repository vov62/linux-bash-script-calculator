#!/bin/bash


options=("add" "subtract" "multiply" "divide" "power_of" "modules" "exit")

readInput(){
	read -p "Enter first number " num1 
	read -p "Enter second number " num2 
}

# Function to validate input numbers
validate_input() {
    local num="$1"

    # Check if the input is a valid integer 
    if ! [[ "$num" =~ ^[[:space:]]*[-+]?[0-9]+[[:space:]]*$ ]]; then
        echo "Invalid input: '$num'. Please enter a valid integer."
        return 1
    fi

    # Remove spaces and return the trimmed number
    echo "$num" | xargs
}



is_prime() {
    local num=$1

    if (( num <= 1 ))
	then
        echo "$num is not a prime number."
        return
    fi

    for (( i = 2; i * i <= num; i++ ))
	do
        if (( num % i == 0 ))
		then
            echo "$num is not a prime number."
            return
        fi
    done

    echo "$num is a prime number."
}

is_odd_even() {
    local num=$1

    if [[ $((num % 2)) -eq 0 ]]
	then
        echo "$num is even"
    else
        echo "$num is odd"
    fi
}

is_divided_by_five() {
    local num=$1
    if [[ $((num % 5)) -eq 0 ]]
	 then
        echo "$num Divisible by 5"
    else
        echo "$num Not divisible by 5"
    fi
}

add(){
	readInput

	# validate inputs
  	num1=$(validate_input "$num1")
    # if [[ $? -ne 0 ]]; then return 1; fi

    num2=$(validate_input "$num2")
    # if [[ $? -ne 0 ]]; then return 1; fi

	sum=$(($num1 + $num2))
	echo "The sum for your choice is: $sum"
	is_prime "$sum"
	echo 
	is_odd_even "$sum"
	echo
	is_divided_by_five "$sum";
}


subtract(){
	readInput

	result=$(($num1 - $num2))
	echo "The result for your choice is:: $result"
	is_prime "$result"
	echo 
	is_odd_even "$result"
	echo
	is_divided_by_five "$result"
}


multiply(){
	readInput

	result=$(($num1 * $num2))
 	echo "The result for your choice is:: $result"
	is_prime "$result"
	echo 
	is_odd_even "$result"
	echo
	is_divided_by_five "$result"
}


divide(){
	readInput

	result=$(($num1 / $num2))
	echo "The result for your choice is:: $result"
	is_prime "$result"
	echo 
	is_odd_even "$result"
	echo
	is_divided_by_five "$result"
}



power_of(){
	readInput

	result=$(($num1 ** $num2))
	echo "The result for your choice is:: $result"
	is_prime "$result"
	echo 
	is_odd_even "$result"
	echo
	is_divided_by_five "$result"
}


modules(){
	readInput

	result=$(($num1 % $num2))
	echo "The result for your choice is:: $result"
	is_prime "$result"
	echo 
	is_odd_even "$result"
	echo
	is_divided_by_five "$result"
}

echo "-----------------------------"
echo "----welcome to calculator----"
echo "-----------------------------"

PS3="select one option " 

select option in "${options[@]}"
do

	case $option in
		add) 
			add;;

		subtract)
			subtract;;

		multiply)
			multiply;;
			
		divide)
			divide;;

		power_of)
			power_of;;

		modules)
			modules;;

		exit)
		echo " exiting...."
		break ;;
		
		*)
		echo "wrong choice, choose again.." ;;
	

	esac 
done


