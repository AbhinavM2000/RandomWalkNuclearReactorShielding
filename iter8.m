%Particle stats keeping number of particles, array size and KE constant

clear all
conf_perc=0;
f=1;
array_size=20;
kin_E=5;
deflec=0.25;
np=10000; %Number of particles
data = zeros(8, np);
s_h_c=0; %side hit count (should this be considered as 'trapped' ?)
r_c_c=0; %return to core count
p_c_c=0; %penetrate count
ke_over_c=0; %trapped inside count

fileId = fopen('data_ext_3.txt', 'w');
fprintf(fileId, '%s\n', 'f array_size kin_E deflec np s_h_c r_c_c p_c_c ke_over_c conf_perc'); %printing header


while(f<=np)
[s_h,r_c,p_c,ke_over]=main(array_size,kin_E,deflec); %array_size, KE,pr_defl
s_h_c=s_h+s_h_c;
r_c_c=r_c+r_c_c;
p_c_c=p_c+p_c_c;
ke_over_c=ke_over_c+ke_over;
data(1, f) = f;
data(2, f) = array_size;
data(3, f) = kin_E;
data(4, f) = deflec;
data(5, f) = np;
data(6, f) = s_h_c;
data(7, f) = r_c_c;
data(8, f) = p_c_c;
data(9,f) = ke_over_c;
conf_perc=100*(f/(s_h_c+r_c_c+p_c_c+ke_over_c)); %for debugging...(this must equal n_p...error decreases with higher n_p)
data(10,f) = conf_perc; %confidence %
f=f+1;
end
fprintf(fileId, '%d %d %d %f %d %d %d %d %d %f\n', data);
fclose(fileId);




