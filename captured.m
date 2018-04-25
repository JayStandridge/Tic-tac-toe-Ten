function [ board, cap ] = captured( board, cap )
for i=1:9
    check=[0 1 2 0 3 6 0 6; 3 4 5 1 4 7 4 4; 6 7 8 2 5 8 8 2]+(i*9-8);
    total=sum(board(check));
    tempboard=board((i*9-8):i*9);
    if ~isempty(total(total==3))
        board((i*9-8):i*9)=1;
        cap(i)=1;
    elseif ~isempty(total(total==-3))
        board((i*9-8):i*9)=-1;
        cap(i)=-1;
    elseif isempty(tempboard(tempboard==0))
        cap(i)=.5;
    end
end
end

