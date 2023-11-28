#!/bin/bash
# SPDX-FileCopyrightText: 2023 Tougo Kataita 　　　　　
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が間違えてる
	res=1
}

res=0

out=$(seq 5 | ./plus)
output="0 + 1 = 1
1 + 2 = 3
3 + 3 = 6
6 + 4 = 10
10 + 5 = 15

1 ~ 5の合計 : 15
平均値 : 3.0
奇数"
[ "${out}" = "${output}" ] || ng ${LINENO}


out=$(seq 2 | ./plus)
output="0 + 1 = 1
1 + 2 = 3

1 ~ 2の合計 : 3
平均値 : 1.5
奇数
素数"
[ "${out}" = "${output}" ] || ng ${LINENO}

out=$(echo あ | ./plus)
[ "$?" = 1 ]       || ng ${LINENO}
[ "${out}" = "" ]  || ng ${LINENO}

out=$(echo | ./plus)
[ "$?" = 1 ]       || ng ${LINENO}
[ "${out}" = "" ]  || ng ${LINENO}

[ "$res" = 0 ] && echo OK
exit $res
