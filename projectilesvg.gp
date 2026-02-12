### projectile_cmu_svg.gnuplot
### SVG version with adjusted label positions
### Uses CMU Serif (title) and CMU Bright (axes/labels)

# ==============================
#  Output and font setup
# ==============================

set terminal svg size 900,600 enhanced font "CMU Bright,12"
set output 'projectile_motion_cmu.svg'

set title "Projectile Motion: h(t) = -16t² + 40t + 5" font "CMU Serif,14"
set xlabel "Time (seconds)" font "CMU Bright,12"
set ylabel "Height (feet)" font "CMU Bright,12"
set grid
set key top right box

# ==============================
#  Motion model
# ==============================

h(x) = -16*x**2 + 40*x + 5

# Key points
t_launch = 0.0
h_launch = 5.0

t_peak = 1.25
h_peak = 30.0

t_impact = 2.62
h_impact = 0.0

# ==============================
#  Label adjustments
# ==============================

# Slightly lower launch label (from y=7 → y=6)
set label 1 "Launch (0 s, 5 ft)"  at -9.15,-1800.0 font "CMU Bright,11" tc rgb "green"

# Slightly higher peak label (from y=32 → y=33.5)
set label 2 "Peak (1.25 s, 30 ft)" at 4.0,37.5 font "CMU Bright,11" tc rgb "red"

# Leave impact label unchanged
set label 3 "Impact (2.62 s, 0 ft)" at 1.9,3 font "CMU Bright,11" tc rgb "orange"

# ==============================
#  Plot the function
# ==============================

plot h(x) title "Height vs. Time" lw 2 lc rgb "dark-blue", \
     0 notitle lc rgb "gray" lw 1

# ==============================
#  Overlay key points
# ==============================

replot \
     '-' using 1:2 title "Launch" with points pt 7 ps 1.7 lc rgb "green", \
     '-' using 1:2 title "Peak" with points pt 7 ps 1.7 lc rgb "red", \
     '-' using 1:2 title "Impact" with points pt 7 ps 1.7 lc rgb "orange"

# Inline coordinate data
0.0 5.0
e
1.25 30.0
e
2.62 0.0
e

unset output
### End of file
