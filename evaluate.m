function [ output ] = evaluate( board,strat10,strat12)
board2(:,1)=board(:)';
board2(82)=1;
hidden=board2'*strat10;
hidden(hidden<0)=0;
hidden(31)=1;
output=tanh((hidden*strat12));
end