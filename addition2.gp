# ------------------------------------------------------------------
# VISUALIZING ADDITION AS A MAP (PNG OUTPUT - CMU SERIF)
# ------------------------------------------------------------------

reset

# 1. Set Output to PNG Image
# Changed font to "CMU Serif" and size to 12 for better legibility
set terminal pngcairo size 720,600 enhanced font "CMU Serif,12"
set output 'addition_mapping_cmu.png'

# 2. Set up the viewing angle and aesthetics
set title "Addition as a Surface Mapping\n (2, 3) ↦ 5" font "CMU Serif,15"
 
# set title "Addition as a Surface Mapping\nInput Tuple (2, 3) {/Symbol \256} 5" font "CMU Serif,15"
# set title "Addition as a Surface Mapping\nInput Tuple (2, 3) \u2192 Output 5" font "CMU Serif,16"
set view 60, 120
set xyplane at 0

# 3. Label the "Copies" of the number line
set xlabel "Copy 1 (a)" offset -1,-1 font "CMU Bright,14"
set ylabel "Copy 2 (b)" offset -1,-1 font "CMU Bright,14"
set zlabel "Result (c)" offset -0.1,0 font "CMU Bright,14" textcolor rgb "red"

# 4. Define the range
set xrange [0:6]
set yrange [0:6]
set zrange [0:10]

# 5. Grid and Style settings
set grid x y z vertical
set hidden3d
set isosamples 25
set style fill transparent solid 0.3 border lc rgb "gray"

# ------------------------------------------------------------------
# DRAWING THE SPECIFIC OPERATION: 2 + 3 = 5
# ------------------------------------------------------------------

# A. Tracer lines
set arrow 1 from 2,0,0 to 2,3,0 nohead lc rgb "blue" dt 3
set arrow 2 from 0,3,0 to 2,3,0 nohead lc rgb "blue" dt 3

# B. The "Lift" Arrow
set arrow 3 from 2,3,0 to 2,3,5 head filled lc rgb "black" lw 2

# C. Mark the points
set object 1 circle at 2,3,0 size 0.1 fc rgb "blue" fs solid front
set object 2 circle at 2,3,5 size 0.1 fc rgb "red" fs solid front

# D. Text Labels
set label 1 "(2, 3)" at 2.2, 3.2, 0.5 textcolor rgb "blue" font "CMU Serif,12"
set label 2 "Result: 5" at 2, 3, 6 textcolor rgb "red" font "CMU Bright,12"

# 6. Plot the function
splot x + y title "c = a + b" with polygons lc rgb "forest-green"
