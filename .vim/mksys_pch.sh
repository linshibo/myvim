#!/bin/bash
cd `dirname $0` 
clang  -x c++-header  -fno-exceptions -fgnu-runtime -I /usr/include/dbser -I /usr/include/mysql   -I /usr/include/i386-linux-gnu/   -I /usr/include/c++/4.5 -I /usr/include/c++/4.5/i686-linux-gnu/ -DDB_GET_LIST_NEW -D LIBTAOMEE_LOG_H_   -c sys.h -o ./sys.pch 
