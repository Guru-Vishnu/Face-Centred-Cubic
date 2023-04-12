# Face-Centred-Cubic
MATLAB Program to Determine and Plot the Coordinates of Atoms in a Face Centred Cubic System based on the Atomic Radius and the Dimensions of the Space that is to be filled

This program was created as a part of the course MEPC18 - Engineering Materials during the July 2022 session. 

The input variables to the program include radius of the atom (r) and length (l), breadth (b), and height (h) of the space that needs to be filled with face centered cubic structures (FCC). Then, based on this the side length (a) of the unit cell is calculated and the number of unit cells along each principal directions of the cuboidal space (nx, ny, nz) are determined. 

If the cuboidal space that needs to be filled is insufficient even for a single unit cell, i.e., if either one of nx, ny, or nz which denote the numbers of unit cells along the principal directions is zero, the program informs that the space is insufficient and gets terminated. 

Test Case 1:

Input
r = sqrt(2);
l = 10;
b = 15;
h = 20;

Output:
![image](https://user-images.githubusercontent.com/72333932/231341063-72b1e53d-1f48-41c7-9e27-5b2e9589a338.png)
n = 24
s = 1464
