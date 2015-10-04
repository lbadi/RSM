function [Q,R] = modGS_qr(A)
  R = 0;
  m = size(A)(1);
  n = size(A)(2);
  for k = 1 : n
    R(k,k) = norm(A(1:m,k));
    Q(1:m,k) = A(1:m,k) / R(k,k);
    for j=k+1 : n
      R(k,j) = Q(1:m,k)' * A(1:m,j);
      A(1:m,j) = A(1:m,j) - Q(1:m,k) * R(k,j);
    end
  end  
end