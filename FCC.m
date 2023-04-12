% Input Variables
r = sqrt(2);
l = 5;
b = 5;
h = 5;

a = 2 * sqrt(2) * r;
nx = floor(l/a);
ny = floor(b/a);
nz = floor(h/a);

if nx == 0 || ny == 0 || nz == 0
 disp("Insufficient Space")
 return 
end

w = 0 : a : max([nx, ny, nz]) * a;

Ax = ones(nx + 1, ny + 1);
Ay = ones(nx + 1, ny + 1);
Ax = Ax .* w(1:nx+1)';
Ay = Ay .* w(1:ny+1);

Bx = Ax(1:nx, 1:ny) + a/2;
By = Ay(1:nx, 1:ny) + a/2;

Cx = Ax(1:nx, :) + a/2;
Cy = Ay(1:nx, :);

Dx = Ax(:, 1:ny);
Dy = Ay(:, 1:ny) + a/2;

A = ones((nx + 1) * (ny + 1) * (nz + 1), 3);
for z = 1 : nz + 1
    A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 1) = A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 1) .* Ax(:);
    A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 2) = A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 2) .* Ay(:);
    A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 3) = A(1 + (z - 1) * ((nx + 1) * (ny + 1)) : z * ((nx + 1) * (ny + 1)), 3) * w(z);
end

B = ones(nx * ny * (nz + 1), 3);
for z = 1 : nz + 1
    B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 1) = B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 1) .* Bx(:);
    B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 2) = B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 2) .* By(:);
    B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 3) = B(1 + (z - 1) * (nx * ny) : z * (nx * ny), 3) * w(z);
end

C = ones(nx * (ny + 1) * nz, 3);
for z = 1 : nz
    C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 1) = C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 1) .* Cx(:);
    C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 2) = C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 2) .* Cy(:);
    C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 3) = C(1 + (z - 1) * (nx * (ny + 1)) : z * (nx * (ny + 1)), 3) * w(z) + a/2;
end

D = ones((nx + 1) * ny * nz, 3);
for z = 1 : nz
    D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 1) = D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 1) .* Dx(:);
    D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 2) = D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 2) .* Dy(:);
    D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 3) = D(1 + (z - 1) * ((nx + 1) * ny) : z * ((nx + 1) * ny), 3) * w(z) + a/2;
end

% Plotting the Unit Cells

p1 = plot3(A(:,1), A(:,2), A(:, 3), 'o', color = [1 0 0]);
p1.MarkerFaceColor = [1 0 0];

axis equal;
hold on;

p2 = plot3(B(:,1), B(:,2), B(:, 3), 'o', color = [0 1 0]);
p2.MarkerFaceColor = [0 1 0];

p3 = plot3(C(:,1), C(:,2), C(:, 3), 'o', color = [0 1 0]);
p3.MarkerFaceColor = [0 1 0];

p4 = plot3(D(:,1), D(:,2), D(:, 3), 'o', color = [0 1 0]);
p4.MarkerFaceColor = [0 1 0];

for z = 0 : nz
    for x = 0 : nx
        plot3([(x * a) (x * a)], [0 (ny * a)], [(z * a) (z * a)], color = [1 0 0]);
    end
    for y = 0 : ny
        plot3([(nx * a) 0], [(y * a) (y * a)], [(z * a) (z * a)], color = [1 0 0]);
    end
end

for x = 0 : nx
    for y = 0 : ny
        plot3([(x * a) (x * a)], [(y * a) (y * a)], [0 (nz * a)], color = [1 0 0]);
    end
end

% xlabel("Length")
% ylabel("Breadth")
% zlabel("Height")

hold off;

% Statistics
n = nx * ny * nz                    % Number of Unit Cells
s = round(l * b * h - n * a^3, 10)  % Space which is unfilled

% Exporting the Coordinates as a CSV File
Output = [A; B; C; D];
writematrix(Output, 'FCC_Coordinates.csv');
