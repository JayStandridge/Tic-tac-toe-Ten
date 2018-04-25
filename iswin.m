function [ bool ] = iswin( board,cap )
check=1+[0 1 2 0 3 6 0 6; 3 4 5 1 4 7 4 4; 6 7 8 2 5 8 8 2];
total=sum(cap(check));
if ~isempty(total(total==3))
    bool=1;
elseif ~isempty(total(total==-3))
    bool=-1;
elseif isempty(board(board==0))||isempty(cap(cap==0))
    bool=.25;
else
    bool=0;
end
end

