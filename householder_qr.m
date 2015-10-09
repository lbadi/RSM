function [Q,H] = householder_qr(A)
  % R = A;
  % m = size(A)(1);
  % n = size(A)(2);
  % Q = eye(m,n);
  % for k = 1 : n
  %   x = R(k:m,k);
  %   s = sign(x(k)) * norm(x);
  %   u = x;
  %   u(k) = x(k) + s;
  %   H = eye(m-k+1,m-k+1) - (u*u')/(s*u(k));
  %   R(k:m,k:m) = H*R(k:m,k:m);
  %   H
  %   k:m
  %   Q(k:m,k:m) = H(1:m-k,1:m-k) * Q(k:m,k:m);
  % end
  % Compute the Hessenberg decomposition H = Q'*A*Q using
  % Householder transformations.
  n = length(A);
  Q = eye(n); % Orthogonal transform so far
  H = A; % Transformed matrix so far
  for j = 1:n-2
  % -- Find W = I-2vv' to put zeros below H(j+1,j)
  u = H(j+1:end,j);
  u(1) = u(1) + sign(u(1))*norm(u);
  v = u/norm(u);
  % -- H := WHW', Q := QW
  H(j+1:end,:) = H(j+1:end,:)-2*v*(v'*H(j+1:end,:));
  H(:,j+1:end) = H(:,j+1:end)-(H(:,j+1:end)*(2*v))*v';
  Q(:,j+1:end) = Q(:,j+1:end)-(Q(:,j+1:end)*(2*v))*v';
  end
