# ------------------------------------------------------------------
# VISUALIZING ADDITION AS A MAP: c = a + b
# ------------------------------------------------------------------

reset

# 1. Set up the viewing angle and aesthetics
set title "Addition as a Surface Mapping\nInput Tuple (2, 3) -> Output 5" font ",14"
set view 60, 120    # Adjust angle to see the relationship clearly
set xyplane at 0    # Ensures the z-axis starts at the "floor" (0)

# 2. Label the "Copies" of the number line
set xlabel "Copy 1 (a)" offset -1,-1 font ",11"
set ylabel "Copy 2 (b)" offset -1,-1 font ",11"
set zlabel "Result (c)" offset -1,0 font ",11" textcolor rgb "red"

# 3. Define the range (Zoom in on the relevant area)
set xrange [0:6]
set yrange [0:6]
set zrange [0:10]

# 4. Grid and Style settings
set grid x y z vertical
set hidden3d
set isosamples 25
set style fill transparent solid 0.3 border lc rgb "gray"

# ------------------------------------------------------------------
# DRAWING THE SPECIFIC OPERATION: 2 + 3 = 5
# ------------------------------------------------------------------

# A. Tracer lines on the "floor" showing where we pull 2 and 3 from
# From x-axis (2) to the tuple point
set arrow 1 from 2,0,0 to 2,3,0 nohead lc rgb "blue" dt 3
# From y-axis (3) to the tuple point
set arrow 2 from 0,3,0 to 2,3,0 nohead lc rgb "blue" dt 3

# B. The "Lift" - The mapping function taking the tuple to the result
set arrow 3 from 2,3,0 to 2,3,5 head filled lc rgb "black" lw 2

# C. Mark the points with circles
# The Input Tuple (2,3) on the floor plane
set object 1 circle at 2,3,0 size 0.15 fc rgb "blue" fs solid front
# The Result (5) on the surface
set object 2 circle at 2,3,5 size 0.15 fc rgb "red" fs solid front

# D. Text Labels
set label 1 "(2, 3)" at 2.2, 3.2, 0.5 textcolor rgb "blue" font ",10"
set label 2 "Result: 5" at 2, 3, 6 textcolor rgb "red" font "Bold,10"

# 5. Plot the function
# We plot "x + y" as the surface
splot x + y title "c = a + b" with polygons lc rgb "forest-green"

pause -1 "Press Enter to exit..."
