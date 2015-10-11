function [eigenValues, octaveEigenValues, custom_qr_time, modGS_qr_time,givens_qr_time, octave_eig_time] = testEig(A, err)

[eigenValues, modGS_qr_time] = qr_eig(A,err, @modGS_qr);
[eigenValues, givens_qr_time] = qr_eig(A,err, @givens_qr);
[eigenValues, custom_qr_time] = qr_eig(A,err, @custom_qr);

tic()
octaveEigenValues = eig(A);
octave_eig_time = toc();


eigenValues = sort(eigenValues);
octaveEigenValues = sort(octaveEigenValues);

endfunction