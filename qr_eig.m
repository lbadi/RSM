function [values, timeElapsed] = qr_eig(firstA,error,qr_method)
  more off;
  A = firstA;
  n = length(A);
  tic;
  actual_value = 0;
  do
    prevA = A;
    [Q, R] = qr_method(prevA);
    A = R * Q;
    if (abs(A(n-actual_value,n-actual_value-1)) < error*(abs(A(n-actual_value-1,n-actual_value-1))+abs(A(n-actual_value,n-actual_value)))) %Shif
      values(n-actual_value,1) = A(n-actual_value,n-actual_value);
      A = A(1:n-actual_value-1, 1:n-actual_value-1);
      actual_value = actual_value+1;

    elseif (abs(A(n-actual_value-1,n-actual_value-2)) < error*(abs(A(n-actual_value-1,n-actual_value-1))+abs(A(n-actual_value-2,n-actual_value-2)))) %Double-Shif
      a = A(n-actual_value-1,n-actual_value-1);
      b = A(n-actual_value-1,n-actual_value);
      c = A(n-actual_value,n-actual_value-1);
      d = A(n-actual_value,n-actual_value);
      [x1, x2] = cuadratic_eq(1, -a-d, a*d - c*b);
      values(n-actual_value-1,1) = x1;
      values(n-actual_value,1) = x2;

      A = A(1:n-actual_value-2, 1:n-actual_value-2);
      actual_value = actual_value + 2;
    end
  until(actual_value >= n-2);
  if(actual_value == n-2)
      a = A(n-actual_value-1,n-actual_value-1);
      b = A(n-actual_value-1,n-actual_value);
      c = A(n-actual_value,n-actual_value-1);
      d = A(n-actual_value,n-actual_value);
      [x1, x2] = cuadratic_eq(1, -a-d, a*d - c*b);
      values(n-actual_value-1,1) = x1;
      values(n-actual_value,1) = x2;
      A = A(1:n-actual_value-2, 1:n-actual_value-2);
  elseif(actual_value == n-1)
    values(1) = A(1,1);
  end
  % values = sort(values, 'descend');
  timeElapsed = toc();
end


