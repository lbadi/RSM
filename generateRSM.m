function ret = generateRSM(N,NZR)
	A = rand(NZR,N);
	B = zeros(N-NZR,N);
	A = [A ; B];

  % Shuffle the matrix
  for i = 1:N
		ret(:,i) = A(randperm(N), i);
	end
end
