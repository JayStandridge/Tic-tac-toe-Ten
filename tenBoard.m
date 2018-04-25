function [  ] = tenBoard( board, lastMove )
clf
load('point.mat')
xstart=[0 4 8 0 4 8 0 4 8];
ystart=[0 0 0 4 4 4 8 8 8];
for i=1:9
    x=xstart(i)+1;
    y=ystart(i)+1;
    line([x x],[y-1,y+2])
    line([x+1 x+1],[y-1,y+2])
    line([x-1 x+2],[y y])
    line([x-1 x+2],[y+1 y+1])
end
line([3.5 3.5],[0 11])
line([7.5 7.5],[0 11])
line([0 12],[3.5 3.5])
line([0 12],[7.5 7.5])
axis([0 11 0 11])
axis square
hold on
for i=1:81
    if mod(i,9)==1
        con=0;
    elseif con
        continue
    end
    if mod(i,9)==1
        if sum(board(i:min([i+8,81])))==9
            plot(xstart(ceil(i/9))+1.5,ystart(ceil(i/9))+1.5,'k x','markersize',90,'LineWidth',5)
            con=1;
            continue
        elseif sum(board(i:min([i+8,81])))==-9
            plot(xstart(ceil(i/9))+1.5,ystart(ceil(i/9))+1.5,'k o','markersize',60,'LineWidth',5)
            con=1;
            continue
        end
    end
    if board(i)==1
        plot(point(i,1),point(i,2),'k x','markersize',12,'LineWidth',2)
    elseif board(i)==-1
        plot(point(i,1),point(i,2),'k o','markersize',9,'LineWidth',2)
    end
end
title(lastMove)
drawnow
end

