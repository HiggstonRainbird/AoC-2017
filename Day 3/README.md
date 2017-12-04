# Mathematica Advent of Code
# 2017, Day 3 

**WARNING:** This code is a mess, and the README is not yet completed.  

## Background

Integer spirals are created on a Cartesian grid by placing the number 1 at coordinates (0,0), and wrapping around in concentric squares, counterclockwise, incrementing by 1 at each step.

    37 \36\ 35  34  33  32  31
    38  17 \16\ 15  14  13  30
    39  18   5  \4\  3  12  29
    40  19   6  *1*  2  11  28
    41  20   7   8  *9* 10  27
    42  21  22  23  24 *25* 26
    43  44  45  46  47  48 *49*

The `*odd squares*` and `\even squares\` are marked on the grid; you can see that they follow a regular pattern:

* Odd squares at (0,0), (1,-1), (2,-2), (3,-3), ...
* Even squares at (0,1), (-1,2), (-2,3),...

We can use this (with a little help from `FindSequenceFunction[]`) to come up with the closed form expressions of each 'corner' of the spiral (where `x` is the number of 'layers' away from :

1. Top right 'corner' (1,3,13,31,...): `4x^2 - 10x + 7`.
2. Top left 'corner' (1,5,17,37,...): `4x^2 - 8x + 5`.
3. Bottom left 'corner' (1,7,21,43,...): `4x^2 - 6x + 3`.
4. Bottom right 'corner' (1,9,25,49,...): `4x^2 - 4x + 1`.

Because integer spirals follow this regular pattern, there are two ways to work with them: calculating the position of a specific integer directly, or filling out an entire spiral element by element.  We'll end up doing both.

## Functions Made

* **`spiralPosition[n]`**: Returns the x and y coordinates of `n` on an integer spiral.
* **`rookNeighbors[mat,{i,j}]`**: Returns the values of `mat` vertically or horizontally adjacent to position `(i,j)`. 
* **`kingNeighbors[mat,{i,j}]`**:  Returns the values of `mat` vertically, horizontally, or diagonally adjacent to position `(i,j)`. 
* **`populateSpiral[func[],x]`**: Creates an `x`-by-`x` spiral with `func[n]` at each point, rather than `n`.

## Part 1

To find the position of an arbitrary integer `n` on the integer spiral, while avoiding iterating through every number in between 1 and `n`, we look at the two different cases that `n` could fall into:

1. `n` is on one of the corners of the spiral.  If any of the following values of `s` (roughly, the number of square 'layers' away from the center) is an integer, `n` is on the corresponding corner.
 1. `s1 = (5 + Sqrt[-3 + 4*n])/4 - 1` -> (x,y) = (s1,s1)
 2. `s2 = (2 + Sqrt[-1 + n])/2 - 1` -> (x,y) = (-s2,s2)
 3. `s3 = (3 + Sqrt[-3 + 4*n])/4 - 1` -> (x,y) = (-s3,-s3) 
 4. `s4 = (1 + Sqrt[n])/2 - 1` -> (x,y) = (s4,-s4)
2. `n` is not on one of the spiral corners.  If that's the case, then there must either be an integer `sTrue` in between two values of `s`, or an integer `sTrue` equal to the ceiling of all values of `s`.
 1. `sTrue > s1` -> (x,y) = (sTrue,`n - (4sTrue^2 - 10sTrue + 7) + (sTrue-1)`)
 2. `s1 > sTrue > s2` -> (x,y) = (`- (n - (4sTrue^2 - 8sTrue + 5) + (sTrue-1))`,sTrue)
 3. `s2 > sTrue > s3` -> (x,y) = (-sTrue,`- (n - (4sTrue^2 - 6sTrue + 3) + (sTrue-1))`)
 4. `s3 > sTrue > s4` -> (x,y) = (`n - (4sTrue^2 - 4sTrue + 1) + (sTrue-1)`,-sTrue)

This is sufficiently fast to meet our needs for individual integers; `IntegerQ[]` does slow down for sufficiently large square root tests, but to cause a speed delay noticeable outside a loop, those integers would have to be hundreds of digits long.

## Part 2


