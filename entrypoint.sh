#!/bin/bash

if [ "$INPUT_IGNORESSL" -eq "1" ]
then
    echo -e "set ftp:ssl-allow no;" >> args
fi

echo -e "user $INPUT_USER \"$INPUT_PASSWORD\"" >> args

if [ -n "$INPUT_REMOTEDIR" ]; then
        echo -e "rm -f -r \"$INPUT_REMOTEDIR\" 2>/dev/null; \n" >> args
        echo -e "rm -f -r \"$INPUT_REMOTEDIR\" 2>/dev/null; \n"
fi

echo -e "quit;\n" >> args

lftp  $INPUT_HOST < args