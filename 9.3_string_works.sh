#!/bin/bash
string1=asdERTdetpJr24e
echo ${#string1}
echo $(expr length "$string1")
echo $(expr "$string1" : '.*')
echo "========================="
string2=abcABC1333323ABCabc
echo $(expr match "$string2" 'abc[A-Z].*2')
echo $(expr "$string2" : 'abc[A-Z].*2')
echo "========================="
echo $(expr index "$string2" A3)
echo "========================="
string3=abcABC123ABCabc
echo ${string3:0}
echo ${string3:7}
echo ${string3:7:3}
echo ${string3: -4}
echo ${string3:(-6)}
echo "========================="
echo ${*:2}
echo ${@:2}
echo ${*:2:3}
echo "========================="
echo $(expr substr $string3 1 2)
echo $(expr substr $string3 3 8)
echo "========================="
echo $(expr match "$string3" '\(.[b-c]*[A-Z]..[0-9]\)')
echo $(expr "$string3" : '\(.[b-c]*[A-Z]..[0-9]\)')
echo $(expr "$string3" : '\(.......\)')
echo "========================="
echo $(expr match "$string3" '.*\([A-C][A-C][A-C][a-c]*\)')
echo $(expr "$string3" : '.*\(.......\)')
echo "========================="
echo ${string3#a*C}
echo ${string3##a*C}
echo "========================="
echo ${string3%b*c}
echo ${string3%%b*c}
echo "========================="
echo ${string3/abc/MMM}
echo ${string3//abc/MMM}
echo "========================="
echo ${string3/#abc/START}
echo ${string3/%abc/END}

