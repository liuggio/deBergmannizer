#!/bin/bash
BPATH=/usr/share/php/PHPUnit/Runner/Version.php
EXPECTED_ARGS=1
E_BADARGS=65
E_FILENOTFOUND=66
STRREPLACE="by Sebastian Bergmann."

STRHELP=$(cat <<EOF
Usage with one argument:
  `basename $0` REPLACEWITH

EOF
)

STRNOTFOUND=$(cat <<EOF
File not $BPATH found

The Version.php file is not found.

try to run this:
 find / -type f -wholename "*PHPUnit/Runner/Version.php*"
then modify that filename
and please please please do a pull request with your file path :)

EOF
)


if [[ $EUID -ne 0 ]]; then
   echo "To debermannize yourself you have to be root";
   echo "this file $FILE need the root previlege, Aborting"
   echo "YOU ARE STILL BERGMANNIZED."
   exit 1;
fi

if [ $# -ne $EXPECTED_ARGS ]
then
  echo $STRHELP
  exit $E_BADARGS
fi

echo "debergmannizer started"

if [ ! -f $BPATH ];
then
    echo $STRNOTFOUND
    exit $E_FILENOTFOUND
else	
    echo "File Found ..."
    echo "de-Bergmannizing yourself"
    sed -i "s/$STRREPLACE/$1/g" $BPATH
    echo "done"
fi



