function [ strat5, strat52, mut2 ] = mate( strat4,strat42, mut )
strat5=strat4+normrnd(0,mut,82,30);
strat52=strat42+normrnd(0,mut,31,1);
mut2=abs(tanh(mut+normrnd(0,mut/2)));
end