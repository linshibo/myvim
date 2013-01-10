path=`pwd`
while [  ! -f "$path/mtags" ] &&  [ $path != "/"  ]
do
	path=`dirname  $path`
done

if [  -f "$path/mtags" ] 
then
	echo $path
	cd $path
	./mtags $1
	cscope -bq 
elif [  -f ~/.vim/bundle/myfix/mtags ]   
then    
	echo $path
    ~/.vim/bundle/myfix/mtags
    cscope -bq 
fi

#~/.vim/mtags_comm
