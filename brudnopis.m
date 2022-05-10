hold on
polygon(4,1,[0,0.5,1])
polygon(2,3,[0,0.5,1])
polygon(2,2,[0,0.5,1])
polygon(3,2,[0,0.5,1])
polygon(1,4,[0,0.5,1])
polygon(3,3,[1,0,0])
polygon(2,4,[1,0,0])
polygon(4,2,[1,0,0])
polygon(3,4,[1,1,0])
polygon(4,3,[1,1,0])
polygon(4,4,[0,0,0])




function polygon(x,y,color)

pgon = polyshape([x x x+1 x+1],[y+1 y y y+1]);
p=plot(pgon);
p.FaceColor=color;
p.FaceAlpha=0.8;
end