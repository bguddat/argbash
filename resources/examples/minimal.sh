#!/bin/bash

# ARG_POSITIONAL_SINGLE([positional-arg],[Positional arg description])
# ARG_OPTIONAL_SINGLE([option],[o],[A option with short and long flags and default],[b])
# ARG_OPTIONAL_BOOLEAN([print],[],[A boolean option with long flag (and implicit default: off)],[])
# ARG_VERSION([echo $0 v0.1])
# ARG_HELP([This is a minimal demo of Argbash potential])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY ARGBASH v1.1.2a one line above ###
# Argbash is FREE SOFTWARE, know your rights: https://github.com/matejak/argbash
# THE DEFAULTS INITIALIZATION --- POSITIONALS
# THE DEFAULTS INITIALIZATION --- OPTIONALS
_ARG_OPTION="b"
_ARG_PRINT=off

# THE PRINT HELP FUNCION
function print_help
{
	echo "This is a minimal demo of Argbash potential"
	echo "Usage: $0 <positional-arg> [--option <arg>] [--(no-)print] [--version] [--help]"
	echo -e "\t<positional-arg>: Positional arg description"
	echo -e "\t-o,--option: A option with short and long flags and default (default: '""b""')"
	echo -e "\t--print,--no-print: A boolean option with long flag (and implicit default: off) (default: '"off"')"
	echo -e "\t-v,--version: Prints version"
	echo -e "\t-h,--help: Prints help"
}
# THE PARSING ITSELF
while test $# -gt 0
do
	_key="$1"
	case "$_key" in
		-o|--option)
			test $# -lt 2 && { echo "Missing value for the positional argument." >&2; exit 1; }
			_ARG_OPTION="$2"
			shift
			;;
		--no-print|--print)
			_ARG_PRINT="on"
			test "${1:0:5}" = "--no-" && _ARG_PRINT="off"
			;;
		-v|--version)
			echo $0 v0.1
			exit 0
			;;
		-h|--help)
			print_help
			exit 0
			;;
		*)
		    	POSITIONALS+=("$1")
			;;
	esac
	shift
done

POSITIONAL_NAMES=('_ARG_POSITIONAL_ARG' )
test ${#POSITIONALS[@]} -lt 0 && { ( echo "FATAL ERROR: Not enough positional arguments."; print_help ) >&2; exit 1; }
test ${#POSITIONALS[@]} -gt 1 && { ( echo "FATAL ERROR: There were spurious positional arguments --- we expect at most 1."; print_help ) >&2; exit 1; }
for (( ii = 0; ii <  ${#POSITIONALS[@]}; ii++))
do
	eval "${POSITIONAL_NAMES[$ii]}=\"${POSITIONALS[$ii]}\""
done
# OTHER STUFF GENERATED BY Argbash


### END OF CODE GENERATED BY Argbash ### ])
# [ <-- needed because of Argbash


if [ "$_ARG_PRINT" = on ]
then
	echo "Positional arg value: '$_ARG_POSITIONAL_ARG'"
	echo "Optional arg '--option' value: '$_ARG_OPTION'"
else
	echo "Not telling anything, print not requested"
fi

# ] <-- needed because of Argbash