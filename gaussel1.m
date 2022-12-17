function [x] = gaussel1(MatrixA,VictorB)
%please enter matrix of NxM and victor of Mx1 or else the program wont
%work.
%Length of M in NxM
N = length(VictorB);
%Zeros  victor  to store the Xs later
X = zeros(N,1);
%colliding the matrix  and victor into one matrix
Matrix = [MatrixA VictorB];
%in case of underdetermined LES
if length(MatrixA) > length(VictorB)
    disp("This is an underdetermined LES");
end
%if the user want to see the steps
user = input(" 1 for displaying matrices \n 0 for not displaying matrices \n:");
%the opperation for GE
for j = 1:N-1
    for i = j+1:N
        m = Matrix(i,j)/Matrix(j,j);
        Matrix(i,:) = Matrix(i,:) - m*Matrix(j,:);
        %if the user want to display the steps of GE

        %if row or coloumn swap needed throw an error and terminate the
        %program
        if Matrix(i,j+1) == 0
            error(" GE can t be solved without row or coloumn swap!") ;
        end
    end
        if user
              disp(Matrix);
        end
end
%assigning the solutions to the Xs
X(N) = Matrix(N,N+1)/Matrix(N,N);
%Calculating what are the Xs are equal to.
for k = N-1:-1:1
    X(k) = (Matrix(k,N+1)- Matrix(k,k+1:N)*X(k+1:N))/Matrix(k,k);
end

x=X;
end
