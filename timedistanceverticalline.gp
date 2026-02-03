# ------------------------------------------------------------------
# VISUALIZING THE "VERTICAL LINE TEST" FAILURE
# ------------------------------------------------------------------

reset

# 1. Set Output to PNG Image
# We set a default font, but we will override it for specific elements below.
set terminal pngcairo size 700,500 enhanced font "CMU Serif,12"
set output 'vertical_line_test_failure.png'

# 2. Titles and Labels with Mixed Fonts
# Title in Serif (Formal)
set title "Failure of the Vertical Line Test at t = 4" font "CMU Serif-Bold,16"

# Axis Labels in Bright (Technical/Sans-Serif)
set xlabel "Time (seconds)" font "CMU Bright-SemiBold,14" offset 0,-1
set ylabel "Distance (meters)" font "CMU Bright-SemiBold,14" offset -1,0

# 3. Axis and Grid Settings
set xrange [0:8]
set yrange [0:10]
set grid lt 1 lc rgb "#dddddd" # Light gray grid
set border 3 lw 2              # Only bottom and left borders

# 4. Define the Data (The Relation)
# This uses a standard inline data block.
# Notice the multiple entries for x=4.
$Trajectory << EOD
0   0
1   1
2   2
3   3
4   4
4   5
4   6
4   7
4   8
5   8.5
6   9
EOD

# 5. Annotations
# Draw a red circle around the "glitch"
set object 1 circle at 4,6 size 1.5 fc rgb "#FFcccc" fs solid 0.3 border lc rgb "red" lw 2

# Add a text explanation pointing to the vertical segment
set label 1 "At t=4, the object is at\nmultiple locations simultaneously.\n(Infinite Velocity / Teleportation)" \
    at 4.5, 6 font "CMU Bright,10" textcolor rgb "red"

# Add an arrow pointing from the text to the line
set arrow 1 from 4.4, 6 to 4.1, 6 lc rgb "red" lw 2

# 6. Plotting
plot $Trajectory using 1:2 with linespoints \
     lw 3 lc rgb "blue" pt 7 ps 1.5 \
     title "Path of the Particle" 
