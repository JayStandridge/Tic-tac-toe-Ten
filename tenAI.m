generations=100;
first=0;
population=25;
surviving=20;
graphics=0;
if ~first
    load('strat10.mat')
    load('strat12.mat')
    load('mut.mat')
else
    strat10=.25*(rand(82,30,population)-.5);
    strat12=.25*(rand(31,1,population)-.5);
    mut=.1*ones(population,1);
    clear mutRec
    clear scoRec
end
mutRec(:,1)=mut;
scoRec(:,1)=ones(surviving,1);
for i=1:generations
    score=zeros(population,1);
    for j=1:population
        for k=1:population
            if j==k
                continue
            else
                [score1, score2]=aiFight(strat10(:,:,j),strat12(:,:,j),strat10(:,:,k),strat12(:,:,k),graphics);
                score(j)=score(j)+score1;
                score(k)=score(k)+score2;
            end
            clc
            disp(i)
            disp(j)
            disp(k)
        end
    end
    while size(strat10,3)>surviving
        [~,x]=min(score);
        score(x)=[];
        strat10(:,:,x)=[];
        strat12(:,:,x)=[];
        mut(x)=[];
    end
    for j=surviving+1:population
        [strat10(:,:,j),strat12(:,:,j),mut(j)]=mate(strat10(:,:,ceil(surviving*rand())),strat12(:,:,ceil(surviving*rand())),mut(ceil(surviving*rand())));
    end
    for j=1:population
        if isnan(strat10(1,1,j))
            strat10(:,:,j)=.25*(rand(82,30,1)-.5);
        end
        if isnan(strat12(1,1,j))
            strat12(:,:,j)=.25*(rand(31,1,1)-.5);
        end
        if isnan(mut(j))
            mut(j)=.1;
        end
    end 
    mutRec(:,size(mutRec,2)+1)=mut;
    scoRec(:,size(scoRec,2)+1)=score;
end
save('strat10.mat','strat10')
save('strat12.mat','strat12')
save('mut.mat','mut')
