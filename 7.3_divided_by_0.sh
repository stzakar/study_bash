#!/bin/bash
(( 1 / 0 )) #2>/dev/null
echo "result $?"
