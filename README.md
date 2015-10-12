# RSM

function ret = generateRSM(N,NZR)

Recibe como parámetros el tamaño de la matriz y la cantidad de valores diferentes a cero en cada columna.
Ejemplo: A = generateRSM(8,2)

[values, timeElapsed] = qr_eig(firstA,error,qr_method)

Recibe como parametros la matriz, el error deseado y el metodo QR elegido y devuelve los autovalores y el tiempo utilizado. Las posibilidades para qr_method son: custom_qr, givens_qr, modGS_qr

Ejemplo: [values, timeElapsed] = qr_eig(A, 0.0001, @custom_qr)

Se puede utilizar (y modificar valores, por ejemplo el error) el script testEigScript que testea qr_eig con los distintos métodos de descomposición QR.
    