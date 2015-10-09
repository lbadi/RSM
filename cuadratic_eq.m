function [x1, x2] = cuadratic_eq(a, b, c)
  x2 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
  x1 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
end
