#!/bin/bash


ng(){
      echo ${1}行目が違うよ
      res=1
}
res=0

a=朱
[ "$a" = 種 ] || ng "$LINENO"
[ "$a" = 朱 ] || ng "$LINENO"

exit $res
