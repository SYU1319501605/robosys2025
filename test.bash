#!/bin/bash
# SPDX-FileCopyrightText: 2025 Kaki Syu
# SPDX-License-Identifier: BSD-3-Clause

ng(){
      echo ${1}行目が違うよ
      res=1
}

res=0

### NORMAL INPUT ###
out=$(echo 'abc123XYZ!?@' | ./plus)
[ "$(echo "$out" | grep -i total | awk '{print $2}')" = 12 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i alphabets | awk '{print $2}')" = 6 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i digits | awk '{print $2}')" = 3 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i others | awk '{print $2}')" = 3 ] || ng "$LINENO"


### STRANGE INPUT ###
out=$(echo | ./plus)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo あいう | ./plus)
[ "$?" = 0 ] || ng "$LINENO"  # エラーにならない
[ "$(echo "$out" | grep -i total | awk '{print $2}')" = 3 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i alphabets | awk '{print $2}')" = 0 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i digits | awk '{print $2}')" = 0 ] || ng "$LINENO"
[ "$(echo "$out" | grep -i others | awk '{print $2}')" = 3 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
