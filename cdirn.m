function[dir]= cdirn(pr_defl)
dir=0;
ps=1-pr_defl;
pl=pr_defl/2;
pr=pr_defl/2; %This is understood because ps+pl+pr =1, but ok. 
rand;
if(rand>=0 && rand<= ps)
dir = 0;
end
if(rand>ps && rand<= pl+ps)
dir=-1;
end
if(rand>pl+ps && rand<=1)
dir=1;
end

end