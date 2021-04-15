function[kill,side_hits,return_count,penetration_count]= curr_status(i,j,m,n,k,k_e)
kill=0;
side_hits=0;
return_count=0;
penetration_count=0;
if(j<1||j>n&&k<=k_e)
side_hits=1;
kill=1;
end

if(i<1&&k<=k_e)
return_count=1;
kill=1;
end


if(i>=m&&k<=k_e)
penetration_count=1;
kill=1;
end


end