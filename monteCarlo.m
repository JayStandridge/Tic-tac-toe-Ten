function [ board, lastMove] = monteCarlo( board, cap, lastMove )
list=validMoves(board,cap,lastMove);
depth=ceil(100000/(size(list,1)*length(board(board==0))));
score=zeros(size(list,1),1);
for i=1:size(list,1)
    for j=1:depth
        tempboard=board;
        tempboard((list(i,1)-1)*9+list(i,2))=1;
        templastMove=list(i,2);
        [tempboard, tempcap]=captured(tempboard,cap);
        score(i)=score(i)-abs(tempcap(list(i,2))/5)-.1*(templastMove==5);
        running=1;
        templist=validMoves(tempboard,tempcap,templastMove);
        while running
            switch iswin(tempboard,tempcap)
                case 1
                    running=0;
                    score1=1;
                    continue
                case -1
                    running=0;
                    score1=0;
                    continue
                case .25
                    running=0;
                    score1=.25;
                    continue
            end
            tempboard=-1.*tempboard;
            tempcap=-1.*tempcap;
            [tempboard, templastMove]=randMove( tempboard, tempcap, templastMove);
            [tempboard, tempcap]=captured(tempboard,tempcap);
            tempboard=-1.*tempboard;
            tempcap=-1.*tempcap;
            %tenBoard(tempboard,templastMove)
            switch iswin(tempboard,tempcap)
                case 1
                    score1=1;
                    running=0;
                    continue
                case -1
                    score1=-1;
                    running=0;
                    continue
                case .25
                    running=0;
                    score1=.25;
                    continue
            end
            [tempboard, templastMove]=randMove( tempboard, tempcap, templastMove);
            [tempboard, tempcap]=captured(tempboard,tempcap);
            
        end
        score(i)=score(i)+score1;
    end
end
score=score/depth;
move=list(score==max(score),:);
move=move(ceil(size(move,1)*rand()),:);
board((move(1)-1)*9+move(2))=1;
lastMove=move(2);
end