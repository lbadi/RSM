function [x1, x2] = cuadratic_eq(a, b, c)
  disc = sqrt(b^2 - 4*a*c);
  x2 = (-b + disc)/(2*a);
  x1 = (-b - disc)/(2*a);
end
