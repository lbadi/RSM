function [Q,R] = givens_qr(A)
  R = A;
  m = size(A)(1);
  n = size(A)(2);
  Q = eye(m,n);
  for k = 1 : n
    for l = k +1 : m
      if (R(l,k) == 0)
        c = 1;
        s = 0;
      elseif norm(R(l,k)) < norm(R(k,k))
        t = R(l,k) / R(k,k);
        c = 1 / sqrt(1+pow2(t));
        s = c * t;
      else
        z = R(k,k) / R(l,k);
        s = 1/ sqrt(1 + pow2(z));
        c = s*z;
      end
      G = [c,s; -s,c];
      R([k,l] , k:n) = G * R([k,l], k : n);
      Q([k,l] , k:n) = G * Q([k,l], k : n);
    end
  end
Q = Q';