%{
The following method to solve the decomposition uses elementary row operations
considering a(i,i) as the pivot for all i belonging to [1:n]
then changing the other row entries below the pivot to 0
if a(i,i) turns out to be 0 at any instance, the row exchange is done
%}

n=input('Enter the size n for a n*n matrix   ');% taking n from the user
a=input('Enter an invertible matrix of size n*n :');% input the matrix from the user
l=eye(n);% initializing l as In
u=a;% initializing u as a
p=eye(n);%initializing permutation matrix as In
%displaying input matrix
disp('a : ');disp(a);
for i = [1:n-1]
    if u(i,i)==0
        for j=[i+1:n]
            if u(j,i)!=0
            %exchange row with jth row
            temp=u(i,:);
            u(i,:)=u(j,:);
            u(j,:)=temp;
            temp=p(i,:);
            p(i,:)=p(j,:);
            p(j,:)=temp;
            op=['R',num2str(i),' <-> ','R',num2str(i)];
            disp(op);
            disp(u);
            break;
            end
        end
    end
    l(:,i) = l(:,i) + u(:,i);% copying entire column to u
    for j = [i+1:n]
        coef = u(j,i)/u(i,i);
        if coef==0
            continue;
        end
        u(j,:) = u(j,:) - coef.*u(i,:);
        op=['R',num2str(j),' ->','R',num2str(j),' - ',num2str(coef),' R',num2str(i)];
        disp(op);
        disp(u);
    end    
    l(:,i) = l(:,i) - u(:,i);% erasing values above pivot which was earlier copied in line 6
    l(:,i) = l(:,i)./u(i,i);% scaling u as we copied the values directly without scaling
    l(i,i) = 1;% l(i,i) will be equal to l(i,i)/u(i,i) before this step which is wrong and must be changed to 1. We can use alternate methods to avoid this though
end

%displaying all matrices:
disp('p : ');disp(p);
disp('a : ');disp(a);
disp('l : ');disp(l);
disp('u : ');disp(u);
disp('p*a : ');disp(p*a);
disp('l*u : ');disp(p*a);

%{
Sample Input 1:
Enter the size n for a n*n matrix   3
Enter an invertible matrix of size n*n :[[1 2 3];[1 2 6];[1 3 3]]

Sample Output 1:
a :
   1   2   3
   1   2   6
   1   3   3
R2 ->R2 - 1 R1
   1   2   3
   0   0   3
   1   3   3
R3 ->R3 - 1 R1
   1   2   3
   0   0   3
   0   1   0
R2 <-> R2
   1   2   3
   0   1   0
   0   0   3
p :
   1   0   0
   0   0   1
   0   1   0
a :
   1   2   3
   1   2   6
   1   3   3
l :
   1   0   0
   1   1   0
   1   0   1
u :
   1   2   3
   0   1   0
   0   0   3
p*a :
   1   2   3
   1   3   3
   1   2   6
l*u :
   1   2   3
   1   3   3
   1   2   6

Sample Input 2:
Enter the size n for a n*n matrix   4
Enter an invertible matrix of size n*n :[[1 1 1 1];[1 1 2 1];[1 2 1 1];[1 1 1 2]]

Sample Output 2:
a :
   1   1   1   1
   1   1   2   1
   1   2   1   1
   1   1   1   2
R2 ->R2 - 1 R1
   1   1   1   1
   0   0   1   0
   1   2   1   1
   1   1   1   2
R3 ->R3 - 1 R1
   1   1   1   1
   0   0   1   0
   0   1   0   0
   1   1   1   2
R4 ->R4 - 1 R1
   1   1   1   1
   0   0   1   0
   0   1   0   0
   0   0   0   1
R2 <-> R2
   1   1   1   1
   0   1   0   0
   0   0   1   0
   0   0   0   1
p :
   1   0   0   0
   0   0   1   0
   0   1   0   0
   0   0   0   1
a :
   1   1   1   1
   1   1   2   1
   1   2   1   1
   1   1   1   2
l :
   1   0   0   0
   1   1   0   0
   1   0   1   0
   1   0   0   1
u :
   1   1   1   1
   0   1   0   0
   0   0   1   0
   0   0   0   1
p*a :
   1   1   1   1
   1   2   1   1
   1   1   2   1
   1   1   1   2
l*u :
   1   1   1   1
   1   2   1   1
   1   1   2   1
   1   1   1   2
%}
