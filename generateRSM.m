function ret = generateRSM(N,NZR)
	A = rand(NZR,N);
	B = zeros(N-NZR,N);
	A = [A ; B];
	% Suffle the matrix
	for i=1:N
		ret(:,i) = A(randperm(size(A,NZR)),i);
	end
end
