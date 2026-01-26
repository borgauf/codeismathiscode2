set terminal pngcairo size 600, 220 enhanced font "Arial,14"
set output 'number_line_arch_arrow.png'

set dummy x, y  # Ensure non-parametric mode to avoid title-related errors

# Define the low parabolic arch (height 0.4 for a low arch)
center = 6.0
half_width = 3.0
height = 0.2
f(x) = height * (1 - ((x - center) / half_width)**2)

set xrange [0:10]
set yrange [-0.05:0.5]

set xtics 1
set xtics out
unset ytics
set border 1          # Only bottom border (the number line itself)
set key off

# Add filled arrowhead at the end, starting from a point on the curve
delta = 0.4
set arrow 1 from 9-delta, f(9-delta) to 9, 0 \
    head filled size screen 0.03,15,45 \
    lc rgb "black" lw 2

# Plot the number line (thick black)
# Plot the low arching curve (black) up to just before the arrowhead to avoid overlap
plot [0:10] 0 lc rgb "black" lw 3 notitle, \
     [3:9-delta] f(x) lc rgb "black" lw 2 notitle
