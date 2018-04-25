board=zeros(81,1);
lastMove=0;
cap=zeros(1,9);
running=1;
GIF=0;
if GIF
    gif('ten.gif')
end
while running
    tenBoard(board,lastMove);
    drawnow
    if GIF
        gif
    end
    [board, lastMove]=move(board,cap,lastMove,1);
    [board, cap]=captured(board,cap);
    switch iswin(board,cap)
        case 1
            tenBoard(board,lastMove);
            drawnow
            title('crosses win!')
            running=0;
            if GIF
                gif
            end
            continue
        case -1
            tenBoard(board,lastMove);
            drawnow
            title('knots win!')
            running=0;
            if GIF
                gif
            end
            continue
        case .5
            tenBoard(board,lastMove);
            drawnow
            title('draw!')
            if GIF
                gif
            end
            running=0;
            continue
    end
    tenBoard(board,lastMove);
    drawnow
    if GIF
        gif
    end
    board=-1.*board;
    cap=-1.*cap;
    [board, lastMove]=move(board,cap,lastMove,1);
    [board, cap]=captured(board,cap);
    board=-1.*board;
    cap=-1.*cap;
    switch iswin(board,cap)
        case 1
            tenBoard(board,lastMove);
            drawnow
            title('crosses win!')
            running=0;
            if GIF
                gif
            end
            continue
        case -1
            tenBoard(board,lastMove);
            drawnow
            title('knots win!')
            running=0;
            if GIF
                gif
            end
            continue
        case .5
            tenBoard(board,lastMove);
            drawnow
            title('draw!')
            running=0;
            if GIF
                gif
            end
            continue
    end
end