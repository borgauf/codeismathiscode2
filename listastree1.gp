# Set up the output format (PNG image) with CMU Bright font
set terminal pngcairo size 800,600 enhanced font 'CMU Bright,16'
set output 'tree_structure_cmu.png'

# Clean up the canvas (remove axes, borders, ticks)
unset border
unset tics
unset key
set margins 0, 0, 0, 0
set xrange [-3:3]
set yrange [0:3]

# Define styles
set style line 1 lc rgb '#404040' lt 1 lw 2    # Edge color

# --- DEFINING THE NODES AND EDGES ---

# Node Centers (for reference, radius = 0.35):
# Root: (0, 2.5)
# Atom 1: (-2, 1.5)  | Sublist: (0, 1.5) | Atom 4: (2, 1.5)
# Atom 2: (-0.7, 0.5)| Atom 3: (0.7, 0.5)

# 1. Draw Edges (Arrows) - Adjusted to stop at circle boundary

# Root -> Atom 1
# Vector: (-2, -1). Start offset: (-0.31, -0.16). End offset: (+0.31, +0.16)
set arrow 1 from -0.31, 2.34 to -1.69, 1.66 nohead ls 1

# Root -> Sublist
# Vertical drop. Start: 2.5 - 0.35. End: 1.5 + 0.35
set arrow 2 from 0, 2.15 to 0, 1.85 nohead ls 1

# Root -> Atom 4
# Vector: (2, -1). Symmetric to Atom 1.
set arrow 3 from 0.31, 2.34 to 1.69, 1.66 nohead ls 1

# Sublist -> Atom 2
# Vector: (-0.7, -1). Start offset: (-0.20, -0.29). End offset: (+0.20, +0.29)
set arrow 4 from -0.20, 1.21 to -0.50, 0.79 nohead ls 1

# Sublist -> Atom 3
# Symmetric to Atom 2.
set arrow 5 from 0.20, 1.21 to 0.50, 0.79 nohead ls 1


# 2. Draw Nodes (Circles)
# Note: 'fillstyle solid' makes them opaque so lines behind them would be hidden anyway
# Root Node
set object 1 circle at 0, 2.5 size 0.35 fc rgb "#D3D3D3" fillstyle solid
set label 1 "Root\nList" at 0, 2.5 center

# Level 1 Nodes
set object 2 circle at -2, 1.5 size 0.35 fc rgb "#ADD8E6" fillstyle solid
set label 2 "1" at -2, 1.5 center font ",14"

set object 3 circle at 0, 1.5 size 0.35 fc rgb "#D3D3D3" fillstyle solid
set label 3 "Sub\nList" at 0, 1.5 center

set object 4 circle at 2, 1.5 size 0.35 fc rgb "#ADD8E6" fillstyle solid
set label 4 "4" at 2, 1.5 center font ",14"

# Level 2 Nodes (Children of Sublist)
set object 5 circle at -0.7, 0.5 size 0.35 fc rgb "#ADD8E6" fillstyle solid
set label 5 "2" at -0.7, 0.5 center font ",14"

set object 6 circle at 0.7, 0.5 size 0.35 fc rgb "#ADD8E6" fillstyle solid
set label 6 "3" at 0.7, 0.5 center font ",14"

# 3. Add a title
set label 10 "Tree Structure of (1, (2, 3), 4)" at 0, 0.1 center font ",16"

# Trigger the plot
plot NaN
