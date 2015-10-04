function [graph,time] = testGenerateRSM()
	j = 1;
	for i=100:500:1500
		initTime = time();
		% Los nzn son el 20% de la dimension de la matriz
		generateRSM(i,i*0.20);
		totalTime = time() - initTime;
		x(j) = i;
		y(j) = totalTime;
		j++;
	end
	graph = plot(x,y)
	time = y;
end