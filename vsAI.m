function [ ] = vsAI( strat10,strat12 )
board=zeros(81,1);
lastMove=0;
cap=zeros(1,9);
running=1;
count=1;
while running
    subplot(1,2,1)
    tenBoard(board,lastMove);
    drawnow
    switch iswin(board,cap)
        case 1
            tenBoard(board,lastMove);
            title('crosses win!')
            drawnow
            running=0;
            continue
        case -1
            tenBoard(board,lastMove);
            title('knots win!')
            drawnow
            running=0;
            continue
        case .25
            tenBoard(board,lastMove);
            title('draw!')
            drawnow
            running=0;
            continue
    end
    %[board, lastMove]=move( board, cap, lastMove, 1);
    [board, lastMove]=monteCarlo( board, cap, lastMove );
    [board, cap]=captured(board,cap);
    tenBoard(board,lastMove);
    drawnow
    board=-1.*board;
    cap=-1.*cap;
    switch iswin(board,cap)
        case 1
            board=-1.*board;
            tenBoard(board,lastMove);
            title('knots win!')
            drawnow
            running=0;
            continue
        case -1
            board=-1.*board;
            tenBoard(board,lastMove);
            title('crosses win!')
            drawnow
            running=0;
            continue
        case .25
            board=-1.*board;
            tenBoard(board,lastMove);
            title('draw!')
            drawnow
            running=0;
            continue
    end
    [board, lastMove]=move( board, cap, lastMove, 1);
    %[board, lastMove]=monteCarlo(board, cap, lastMove);
    % [board, lastMove, ~]=alphaBeta(board, cap, strat10, strat12, 4, lastMove, 1);
    [board, cap]=captured(board,cap);
    board=-1.*board;
    cap=-1.*cap;
    count=count+1;
    subplot(1,2,2)
end
end

