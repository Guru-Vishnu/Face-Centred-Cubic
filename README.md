# Face-Centred-Cubic
MATLAB Program to Determine and Plot the Coordinates of Atoms in a Face Centred Cubic System based on the Atomic Radius and the Dimensions of the Space that is to be filled

This program was created as a part of the course MEPC18 - Engineering Materials during the July 2022 session. 

The input variables to the program include radius of the atom (`r`) and length (`l`), breadth (`b`), and height (`h`) of the space that needs to be filled with face centered cubic structures (FCC). Then, based on this the side length (`a`) of the unit cell is calculated and the number of unit cells along each principal directions of the cuboidal space (`nx`, `ny`, `nz`) are determined. 

If the cuboidal space that needs to be filled is insufficient even for a single unit cell, i.e., if either one of `nx`, `ny`, or `nz` which denote the numbers of unit cells along the principal directions is zero, the program informs that the space is insufficient and gets terminated. 

Following segment shows the variable naming convention for two layers as seen from the top. Atoms labelled 'A' are present at the corners of the unit cells, 'B' at the face centre of the planes parallel to the xy plane, 'C' at the face centres of planes parallel to the xz plane, and 'D' at face centres of planes parallel to the yz plane. A and B are in the same layer (i.e., have same values of z coordinates) and so do C and D. But A and B, and C and D are in different layers, each adjacent AB-CD layers separated by a distance of `a/2`:

```
A D A D A D A
C B C B C B C
A D A D A D A
C B C B C B C 
A D A D A D A
C B C B C B C
A D A D A D A 

(3 unit cells in x direction x 3 unit cells in y direction)
```

Array `w` consists of the distances of each atom along one of the principal directions. This is used further to calculate the x and y coordinates of the atoms in one layer and store them in a `nx + 1` by `ny + 1` matrices `Ax` and `Ay`. From the layout shown above, it is evident that the atoms labelled `B` are shifted by distance `a/2` along both the x and y axes from the atoms labelled 'A'. And, the number of 'B' atoms is one less than the number of 'A' atoms along each direction. Based on this the x and y coordinates of 'B' atoms are determined and stored in `Bx` and `By`. Using a similar logic x and y coordinates are determined for 'C' and 'D'. 

Now, the x and y coordinates of atoms in layer 1 (consisting of A and B), and layer 2 (consisting of C and D) has been calculated. Next, we need to move to the third dimension. The z coordinates of layer 1 will be same as that of vector w. For layer 2, the z coordinates will be the vector w(2:nz+1)/2.

After this, the unit cells are plotted and the coordinates are exported as a CSV file. 

Test Case 1:

Input:

```
r = sqrt(2);
l = 10;
b = 15;
h = 20;
```

Output:

![image](https://user-images.githubusercontent.com/72333932/231341063-72b1e53d-1f48-41c7-9e27-5b2e9589a338.png)

```
n = 24
s = 1464
```

Test Case 2:

Input:

```
r = sqrt(2);
l = 3;
b = 15;
h = 20;
```

Output:

`Insufficient Space`
