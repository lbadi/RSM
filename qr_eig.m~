function [values, firstA] = qr_eig(n, nzr, error)
  more off;
  A = generateRSM(n, nzr);
  firstA = A;
  do
    prevA = A;
    [Q, R] = custom_qr(prevA);
    A = R * Q;
    actualError = norm(diag(A) - diag(prevA))
  until(norm(diag(A) - diag(prevA)) < error); % Preguntar si se puede usar norm
  values = sort(diag(A)); % Preguntar si se puede usar diag
end
