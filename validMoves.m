function [list ] = validMoves( board, cap, lastMove )
if lastMove==0
    run=1;
    count=1;
    while run
        if board(count)==0
            list=[ceil(count/9),mod(count-1,9)+1];
            run=0;
        else
            count=count+1;
        end
    end
    for i=count:81
        if board(i)==0
            list(size(list,1)+1,:)=[ceil(i/9),mod(i-1,9)+1];
        end
    end
    list=unique(list,'rows');
elseif cap(lastMove)~=0
    run=1;
    count=1;
    while run
        if count>81
            list=[[],[]];
            return
        end
        if board(count)==0
            list=[ceil(count/9),mod(count-1,9)+1];
            run=0;
        else
            count=count+1;
        end
    end
    for i=count:81
        if board(i)==0
            list(size(list,1)+1,:)=[ceil(i/9),mod(i-1,9)+1];
        end
    end
    list=unique(list,'rows');
else
    square=board((lastMove*9-8):lastMove*9);
    list=(1:9)'.*(ones(9,1)-abs(square));
    list(list==0)=[];
    list=[lastMove.*ones(size(list)) list];
    list=unique(list,'rows');
end
end