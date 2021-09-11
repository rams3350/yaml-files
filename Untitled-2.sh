#!/bin/bash
echo 
echo "please give the first number" 
read a
echo
echo "please give the second number"
read b

c=`expr $a + $b`
echo "the total value is $c"

echo "the hostname of the machine is `hostname`"
echo
echo "the working directory is `pwd`"