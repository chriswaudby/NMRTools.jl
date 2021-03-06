#!/bin/csh

#
# Basic 2D Phase-Sensitive Processing:
#   Cosine-Bells are used in both dimensions.
#   Use of "ZF -auto" doubles size, then rounds to power of 2.
#   Use of "FT -auto" chooses correct Transform mode.
#   Imaginaries are deleted with "-di" in each dimension.
#   Phase corrections should be inserted by hand.

nmrPipe -in test.fid \
| nmrPipe -fn SOL                                              \
| nmrPipe -fn EM  -lb 4.0 -c 0.5                               \
#| nmrPipe  -fn SP -off 0.5 -end 1.00 -pow 1 -c 0.5    \
| nmrPipe  -fn ZF -auto                               \
| nmrPipe  -fn FT -auto                               \
| nmrPipe  -fn PS -p0 -102.00 -p1 -65.00 -di -verb         \
| nmrPipe -fn EXT -x1 6ppm -xn 12ppm -sw                                    \
| nmrPipe -fn BASE -nw 10 -nl 0% 2% 98% 100%                    \
| nmrPipe  -fn TP                                     \
| nmrPipe -fn LP -fb                                           \
| nmrPipe -fn EM  -lb 8.0 -c 1.0                               \
#| nmrPipe  -fn SP -off 0.5 -end 1.00 -pow 1 -c 1.0    \
| nmrPipe  -fn ZF -auto                               \
| nmrPipe  -fn FT -auto                               \
| nmrPipe  -fn PS -p0 -90.00 -p1 180.00 -di -verb         \
   -ov -out test.ft2
