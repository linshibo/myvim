path=`pwd`
while [  ! -f "$path/mtags" ] &&  [ $path != "/"  ]
do
	path=`dirname  $path`
	echo $path;
	echo "---"
done

if [  -f "$path/mtags" ] 
then
	echo $path
	cd $path
	./mtags $1
	cscope -bq 
fi
