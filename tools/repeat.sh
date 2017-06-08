#!/bin/bash

__ScriptVersion="0.01rc1"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
    echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

times=1
delay=0
comm=""
while getopts ":hvt:d:c:" opt
do
  case $opt in

    h|help     )  usage; exit 0   ;;

    v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

    t ) times=$OPTARG ;;

    d ) delay=$OPTARG ;;

    c ) comm=$OPTARG ;;

    * )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

count=0

while [[ $count -lt $times ]]; do
    sleep $delay
    sh -c "$comm"
    ((count++))
    #statements
done
exit 0
