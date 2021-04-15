function[s_h,r_c,p_c,ke_over]= main(p,k_e,pr_defl)
s_h=0;
%cdirnprev=zeros(10);
r_c=0;
return_count=0;
side_hits=0;
penetration_count=0;
ke_over=0;
p_c=0;
m=p;
n=p;
particle_count=6;
shield=zeros(m,n);
k=2;
w=0;

%while(particle_count>0)
cdirnprev=zeros(1,30);
cdirnprev(1,1)=0;
%clear cdirnprev;
%particle_count=particle_count-1;
j=randi([1,n],1);
w=0;
i=1;
while(k<=k_e)   %KE=k
    
[w,side_hits,return_count,penetration_count]=curr_status(i,j,m,n,k,k_e);
w;
r_c=r_c+return_count;
p_c=p_c+penetration_count;
s_h=s_h+side_hits;
if(w==1)
break;
end

[dir]=cdirn(pr_defl);
cdirnprev(1,k)=dir;

if(cdirnprev(1,k-1)==0&&dir==0)
i=i+1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==0&&dir==1)
j=j+1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==0&&dir==-1)
j=j-1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end



if(cdirnprev(1,k-1)==1&&dir==0)
j=j+1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==1&&dir==1)
i=i+1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==1&&dir==-1)
i=i-1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end


if(cdirnprev(1,k-1)==-1&&dir==0)
j=j-1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==-1&&dir==1)
i=i+1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end

if(cdirnprev(1,k-1)==-1&&dir==-1)
i=i-1;
if(i>=1&&j>=1)
shield(i,j)=particle_count;
end
end
k=k+1;
if(k==k_e&&side_hits+return_count+penetration_count==0)
ke_over=ke_over+1;
end


end

end