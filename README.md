# try.sh bash script

This script was just provided to get some options with its argument(optional) and execute a bash command. It's up to you ether to export some environment variables, using the default values so there is no problems if don't want to get the options and their arguments.

when you go through the script if the command enters in a correct form and execute correctly the result shown you on the screen, but if you enter the command in a wrong way or execute with the false exit code, the script tries to run with a -i (interval per second to wait) and -n (the number of times the command runs). 

## **How to use:**

### Default usage:

`try.sh -i [interval-value] -n [number-value] command`

but you can use it without options and arguments:

`try.sh -n [number-value] command`

`try.sh -i [interval-value] command`

`try.sh command`

`try.sh -i [interval-value]`

`try.sh -n -n [number-value]`

`try.sh -i [interval-value] -n [number-value]`

`try.sh`

### Set environment variable

before executing the command you can set the environment variable with the below structure:

`TRY_INTERVAL=3`

`TRY_NUMBER=12`

`TRY_COMMAND=NULE`

## The License

Apache License 2.0

[@dwsclass](https://github.com/Ali-Neyestan/dws-dev-006-bash2) dws-dev-006-bash