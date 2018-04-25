function [ board, lastMove, value] = alphaBeta(board, cap, strat10, strat12, depth, lastMove, player)
if isempty(board(board==0))
    switch iswin(board,cap)
        case 1
            value=1;
            return
        case -1
            value=-1;
            return
        case .5
            value=.25;
            return
    end
end
list=validMoves(board, cap, lastMove);
if isempty(list)
    value=iswin(board,cap);
    return
end
value=zeros(1,size(list,1));
if depth~=0
    for i=1:size(list,1)
        tempboard=board;
        tempboard((list(i,1)-1)*9+list(i,2))=player;
        [ tempboard, cap ] = captured( tempboard, cap );
        [~, ~, value(i)]=alphaBeta(-1*tempboard, -1*cap, strat10, strat12, depth-1, list(i,2), -1*player);
    end
else
    for i=1:size(list,1)
        tempboard=board*player;
        tempboard((list(i,1)-1)*9+list(i,2))=1;
        value(i)=evaluate(tempboard, strat10, strat12);
    end
end
if player==1
    val=max(value);
else
    val=min(value);
end
move=list(value==val,:);
move=move(ceil(size(move,1)*rand()),:);
board((move(1)-1)*9+move(2))=1;
value=val;
lastMove=move(2);
end