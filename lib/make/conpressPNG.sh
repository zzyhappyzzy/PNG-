#!/bin/sh
SRC_LIB=$(cd "$(dirname "$0")"; pwd)
cd ${SRC_LIB}
echo "开始压缩..."
if [[ -d "../out" ]]; then
   $(rm -rf ${SRC_LIB}/../out/*)
 else
  #echo "need create out dir"
  mkdir "../out"
fi

cd ${SRC_LIB}/..

function list_all_png_file() {
  for fileTmp in $(ls $1) ;do 
     if [[ -f $fileTmp ]]; then
	if [[ $fileTmp =~ ".png" ]]; then
	#echo $fileTmp
	 ${SRC_LIB}/pngquant/pngquant $fileTmp -o "${SRC_LIB}/../out/$fileTmp"
	fi
     fi	
  done
}


list_all_png_file

echo "压缩完成!"
