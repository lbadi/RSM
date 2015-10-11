err = 0.00001
j = 1;
custom_qr_y = [];
modGS_qr_y = [];
givens_qr_y = [];
octave_eig_time_y = [];
for i = 6:1:10
  A = generateRSM(i, 5);
  [eigenValues, octaveEigenValues, custom_qr_time, modgs_qr_time,givens_qr_time, octave_eig_time] = testEig(A, err);
  x(j) = i;
  custom_qr_y(j) = custom_qr_time
  modGS_qr_y(j) = modgs_qr_time
  givens_qr_y(j) = givens_qr_time
  octave_eig_time_y(j) = octave_eig_time
  j++;
endfor

plot(x, custom_qr_y, "-;custom QR;", x, modGS_qr_y, "-;modGS QR;", x , givens_qr_y, "-;givens QR;", x, octave_eig_time_y, "-;octave eig;")
title ("Eigen values");
xlabel ("Dimension");
ylabel ("Tiempo(s)");
xbounds = xlim()
set(gca, 'xtick', xbounds(1):1:xbounds(2))