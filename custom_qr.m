function [Q,R] = custom_qr(A)
  n = length(A);
  Q(:,1) = A(:, 1) / norm(A(:, 1));

  for i = 2 : n
    u = A(:, i);
    for j = i-1  : -1 : 1
      u = u - A(:, i)' * Q(:, j) * Q(:, j);
    end
    Q(:, i) = u / norm(u);
  end
  Q = -1*Q;
  R = Q'*A;
end
