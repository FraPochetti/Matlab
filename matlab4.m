benz = load('benzene.xyz')

%saves in variable 'masses' the first column of benz
masses = benz(:,1)

%deletes benz's first column; so benz is reshaped to a 12x3 matrix
benz(:,1) = []

%generates a 3x3 matrix of zeros. It serves to initialize the variable I
%which I'll overwrite in a moment.
I = zeros(3,3);

%computes tensor of Inertia.
for i=1:12
        I(1,1) = I(1,1) + benz(i,1)*(benz(i,2)^2 + benz(i,3)^2);
        I(2,2) = I(2,2) + benz(i,1)*(benz(i,1)^2 + benz(i,3)^2);
        I(3,3) = I(3,3) + benz(i,1)*(benz(i,1)^2 + benz(i,2)^2);
        I(1,2) = I(1,2) - benz(i,1)*(benz(i,1)*benz(i,2));
        I(1,3) = I(1,3) - benz(i,1)*(benz(i,1)*benz(i,3));
        I(2,3) = I(2,3) - benz(i,1)*(benz(i,2)*benz(i,3));
end       
 
%Completes the tensor exploiting its simmetry.
I(2,1) = I(1,2);
I(3,1) = I(1,3);
I(3,2) = I(2,3);

%prints I
I

%computes a matrix whise colums are the eigenvectors of I (V) and a
%diagonal matrix with its eigenvalues (D) and finally prints them.
[V D] = eig(I)

%Initialize a 12x3 matrix of zeros
benz_rot = zeros(12,3);

%cm stands for centre of mass, which is a 3x1 array.
cm = zeros(3,1);

%computes the centre of mass using first untouched coordinates (sum is a
%function which sums the components of a vector, in this case the first
%column of benz, or better the atomic masses), and in the same for
%statement switches rapresentation for the atomic positions, rotating them
%in the I's eigenvectors basis.
for i=1:12
    cm(1) = cm(1) + (masses(i)*benz(i,1))/sum(masses);
    cm(2) = cm(2) + (masses(i)*benz(i,2))/sum(masses);
    cm(3) = cm(3) + (masses(i)*benz(i,3))/sum(masses);
    for j=1:3
        for k=1:3
            benz_rot(i,j) = benz_rot(i,j) + benz(i,k)*V(k,j);
        end
    end
end     
           
benz_rot

cm

cm_rot = zeros(3,1);
  
%computes the centre of mass of the molecule in the new rotated frame.
for i=1:12
    cm_rot(1) = cm_rot(1) + (benz(i,1)*benz_rot(i,1))/sum(masses);
    cm_rot(2) = cm_rot(2) + (benz(i,1)*benz_rot(i,2))/sum(masses);
    cm_rot(3) = cm_rot(3) + (benz(i,1)*benz_rot(i,3))/sum(masses);
end           

%prints the centre of mass of the molecule in the new rotated frame.
cm_rot

%translates atomic coordinates in the centre of mass frame. 
for i=1:12
    for j=1:3
        benz_rot_tra(i,j) = benz_rot(i,j) - cm_rot(j);
    end
end 

%opens a file and writes strings and data inside; then saves it with
%close() function
fid = fopen('benzene_translated.xyz','wt'); 

fprintf(fid,'12                         \n                       \n');

for i=1:12
    if i<=6
        fprintf(fid, 'C  %f %f %f\n', benz_rot_tra(i,1), benz_rot_tra(i,2), benz_rot_tra(i,3));
    else
        fprintf(fid, 'H  %f %f %f\n', benz_rot_tra(i,1), benz_rot_tra(i,2), benz_rot_tra(i,3)); 
    end
end
    
fclose(fid); 
