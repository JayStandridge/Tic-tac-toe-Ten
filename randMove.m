function [ board, lastMove ] = randMove( board, cap, lastMove )
if lastMove==0
    newSquare=randi(9);
else
    newSquare=lastMove;
end
if cap(lastMove)~=0
    newSquare=randi(9);
    while cap(newSquare)~=0
        newSquare=randi(9);
    end
end
move=randi(9);
while board((newSquare-1)*9+move)~=0
    move=randi(9);
end
board((newSquare-1)*9+move)=1;
lastMove=move;
end