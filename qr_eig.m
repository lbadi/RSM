function [values, firstA] = qr_eig(n, nzr, error)
  more off;
  A = generateRSM(n, nzr);
  firstA = A;
  do
    prevA = A;
    [Q, R] = givens_qr(prevA);
    A = R * Q;
    actualError = norm(diag(A) - diag(prevA))
  until(norm(diag(A) - diag(prevA)) < error); % Preguntar si se puede usar norm
  values = zeros(1,length(A))';

  for i = 1:2:length(diag(A))
    a = A(i,i);
    b = A(i,i+1);
    c = A(i+1,i);
    d = A(i+1,i+1);
    [x1, x2] = cuadratic_eq(1, -a-d, a*d - c*b);
    values(i,1) = x1;
    values(i+1,1) = x2;
  end
  % values = sort(values, 'descend');
end



