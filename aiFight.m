function [ score1, score2 ] = aiFight( strat10,strat12,strat20,strat22, graphics )
%plotBool=0;
board=zeros(81,1);
lastMove=0;
cap=zeros(1,9);
running=1;
count=1;
while running
    if graphics
        tenBoard(board,lastMove);
        drawnow
    end
    switch iswin(board,cap)
        case 1
            if graphics
                tenBoard(board,lastMove);
                title('crosses win!')
                drawnow
            end
            score1=1;
            score2=0;
            running=0;
            continue
        case -1
            if graphics
                tenBoard(board,lastMove);
                title('knots win!')
                drawnow
            end
            score1=0;
            score2=1;
            running=0;
            continue
        case .25
            if graphics
                tenBoard(board,lastMove);
                title('draw!')
                drawnow
            end
            running=0;
            score1=.25;
            score2=.25;
            continue
    end
    [board, lastMove, ~]=alphaBeta(board, cap, strat10, strat12, 1, lastMove, 1);
    [board, cap]=captured(board,cap);
%     if plotBool
%         think1(count)=evaluate( board,strat10,strat12);
%         think2(count)=evaluate( board,strat20,strat22);
%     end
    if graphics
        tenBoard(board,lastMove);
        drawnow
    end
    switch iswin(board,cap)
        case 1
            if graphics
                tenBoard(board,lastMove);
                title('crosses win!')
                drawnow
            end
            running=0;
            score1=1;
            score2=0;
            continue
        case -1
            if graphics
                tenBoard(board,lastMove);
                title('knots win!')
                drawnow
            end
            running=0;
            score1=0;
            score2=1;
            continue
        case .25
            if graphics
                tenBoard(board,lastMove);
                title('draw!')
                drawnow
            end
            running=0;
            score1=.25;
            score2=.25;
            continue
    end
    board=-1.*board;
    cap=-1.*cap;
    [board, lastMove, ~]=alphaBeta(board, cap, strat20, strat22, 1, lastMove, 1);
    [board, cap]=captured(board,cap);
    count=count+1;
%     if plotBool
%         think1(count)=evaluate( board,strat10,strat12);
%         think2(count)=evaluate( board,strat20,strat22);
%     end
    board=-1.*board;
    cap=-1.*cap;
    count=count+1;
end
% if plotBool
%     plot(movmean(think1,6))
%     hold on
%     plot(movmean(think2,6))
% end
end

