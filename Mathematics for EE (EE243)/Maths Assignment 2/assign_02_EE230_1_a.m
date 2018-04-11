%{
The following method to solve the decomposition uses elementary row operations
considering a(i,i) as the pivot for all i belonging to [1:n]
then changing the other row entries below the pivot to 0
Note : This doesn't consider row exchanges
%}

n=input('Enter the size n for a n*n matrix  ');% taking n from the user
a=input('Enter an invertible matrix of size n*n :');% input the matrix from the user
l=eye(n);% initializing l as In
u=a;% initializing u as a
%displaying input matrix
disp('a : ');disp(a);
for i = [1:n-1]
    l(:,i) = l(:,i) + u(:,i);% copying entire column to u
    j=i+1;
    for j = [i+1:n]
        coef = u(j,i)/u(i,i);
        if coef==0
            continue;
        end
        u(j,:) = u(j,:) - coef.*u(i,:);
        op=['R',num2str(j),' -> ','R',num2str(j),' - ',num2str(coef),' R',num2str(i)];
        disp(op);
        disp(u);
    end    
    l(:,i) = l(:,i) - u(:,i);% erasing values above pivot which was earlier copied in line 15
    l(:,i) = l(:,i)./u(i,i);% scaling u as we copied the values directly without scaling
    l(i,i) = 1;% l(i,i) will be equal to l(i,i)/u(i,i) before this step which is wrong and must be changed to 1. We can use alternate methods to avoid this though
end

d = u.*eye(n);% d is all the diagonal elements of u
for i = [1:n]
    u(i,:) = u(i,:)/d(i,i);%dividing all rows of u by d(i,i) to make the pivots 1
end   
%displaying all matrices:
disp('l : ');disp(l);
disp('d : ');disp(d);
disp('u : ');disp(u);
disp('l*d*u : ');disp(l*d*u);% This will return a

%{
Sample Input 1:
Enter the size n for a n*n matrix   3
Enter a non invertible matrix of size n*n :  [[1:3];[1,3,9];[4,3,4]]

Sample Output 1:
a :
   1   2   3
   1   3   9
   4   3   4
R2 -> R2 - 1 R1
   1   2   3
   0   1   6
   4   3   4
R3 -> R3 - 4 R1
   1   2   3
   0   1   6
   0  -5  -8
R3 -> R3 - -5 R2
    1    2    3
    0    1    6
    0    0   22
l :
   1   0   0
   1   1   0
   4  -5   1
d :
    1    0    0
    0    1    0
    0    0   22
u :
   1   2   3
   0   1   6
   0   0   1
l*d*u :
   1   2   3
   1   3   9
   4   3   4

Sample Input 2:
Enter the size n for a n*n matrix   4
Enter an invertible matrix of size n*n :[[2 1 1 0];[4 3 3 1];[8 7 9 5];[6 7 9 8]]

Sample Output 2:
a :
   2   1   1   0
   4   3   3   1
   8   7   9   5
   6   7   9   8
R2 -> R2 - 2 R1
   2   1   1   0
   0   1   1   1
   8   7   9   5
   6   7   9   8
R3 -> R3 - 4 R1
   2   1   1   0
   0   1   1   1
   0   3   5   5
   6   7   9   8
R4 -> R4 - 3 R1
   2   1   1   0
   0   1   1   1
   0   3   5   5
   0   4   6   8
R3 -> R3 - 3 R2
   2   1   1   0
   0   1   1   1
   0   0   2   2
   0   4   6   8
R4 -> R4 - 4 R2
   2   1   1   0
   0   1   1   1
   0   0   2   2
   0   0   2   4
R4 -> R4 - 1 R3
   2   1   1   0
   0   1   1   1
   0   0   2   2
   0   0   0   2
l :
   1   0   0   0
   2   1   0   0
   4   3   1   0
   3   4   1   1
d :
   2   0   0   0
   0   1   0   0
   0   0   2   0
   0   0   0   2
u :
   1.00000   0.50000   0.50000   0.00000
   0.00000   1.00000   1.00000   1.00000
   0.00000   0.00000   1.00000   1.00000
   0.00000   0.00000   0.00000   1.00000
l*d*u :
   2   1   1   0
   4   3   3   1
   8   7   9   5
   6   7   9   8
%}