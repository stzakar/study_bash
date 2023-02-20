#!/bin/bash
echo "Please enter first NUMBER"
read a
echo "Please enter second NUMBER"
read b
if [[ a -gt 0 ]]
        if (( b > 0 ))
        then                     #второй if
                echo $a echo $b
        else                     #второй if
                "false"
        fi
then                             # первый if
        echo "true"
else                             # первый if
        echo "false"
fi
