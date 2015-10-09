function [values, firstA] = qr_eig(n, nzr)
  more off;

  max_iterations = 30;
  error = 0.00001;

  A = generateRSM(n, nzr);
  firstA = A;
  tic;
  actual_value = 0;
  do
    it = 0;
    do
      prevA = A;
      [Q, R] = givens_qr(prevA);
      A = R * Q;
      it = it+1;
    until(norm(A(n-actual_value, n-actual_value-1)) < error || it == max_iterations);
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
  toc;
end


