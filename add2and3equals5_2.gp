set terminal pngcairo size 700, 400 enhanced font "Arial,14"
# set terminal png
set output 'addition.png'
set xrange [0:6]
set yrange [-1:2]
unset key
unset tics
unset border
# Number line
set arrow 1 from 0,0 to 6,0 nohead lw 2
# Ticks
set arrow from 0,-0.1 to 0,0.1 nohead lw 2
set arrow from 1,-0.1 to 1,0.1 nohead lw 2
set arrow from 2,-0.1 to 2,0.1 nohead lw 2
set arrow from 3,-0.1 to 3,0.1 nohead lw 2
set arrow from 4,-0.1 to 4,0.1 nohead lw 2
set arrow from 5,-0.1 to 5,0.1 nohead lw 2
set arrow from 6,-0.1 to 6,0.1 nohead lw 2
# Labels
set label "0" at 0,-0.3 center
set label "1" at 1,-0.3 center
set label "2" at 2,-0.3 center
set label "3" at 3,-0.3 center
set label "4" at 4,-0.3 center
set label "5" at 5,-0.3 center
set label "6" at 6,-0.3 center
# Arrows for addition
set arrow 2 from 2,0 to 2.5,1 head size screen 0.02,15 filled lw 2 lc rgb "green"
set arrow 3 from 3,0 to 2.5,1 head size screen 0.02,15 filled lw 2 lc rgb "orange"
set arrow 4 from 2.5,1 to 5,0 head size screen 0.02,15 filled lw 2 lc rgb "blue"
# Plus sign at join point
set label "+" at 2.5,1.2 center font ",20"
# Equals sign near the sum
# set label "=" at 3.75,0.5 center font ",20"
set label "=" at 3.75,0.7 center font ",20"
plot NaN notitle
