function [ board, lastMove] = move( board, cap, lastMove, isHuman )
if lastMove==0
    if isHuman
        newSquare=input('Which larger square?');
    else
        newSquare=ceil(9*rand());
    end
else
    newSquare=mod(lastMove-1,9)+1;
end
if cap(newSquare)~=0
    if isHuman
        newSquare=input('Which larger square?');
    else
        newSquare=ceil(9*rand());
        while cap(newSquare)~=0
            newSquare=ceil(9*rand());
        end
    end
end
if isHuman
    move=input('Which square?');
    while board((newSquare-1)*9+move)~=0
        
        move=input('Invald move. Which square?');
    end
else
    move=ceil(9*rand());
    while board((newSquare-1)*9+move)~=0
        move=ceil(9*rand());
    end
end
board((newSquare-1)*9+move)=1;
lastMove=move;
end