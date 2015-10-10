function [graph,time] = testGenerateRSM()
	j = 1;
	for i=100:200:1500
		initTime = time();
		% Los nzn son el 20% de la dimension de la matriz
		generateRSM(i,i*0.20);
		totalTime = time() - initTime;
		x(j) = i;
		y(j) = totalTime;
		j++;
	end
	set (0, "defaultaxesfontname", "Helvetica")
	hold on;
	graph = plot(x,y)
	title ("RSM");
	xlabel ("Dimension");
	ylabel ("Tiempo(s)");
	time = y;
	print -djpg image.jpg
end