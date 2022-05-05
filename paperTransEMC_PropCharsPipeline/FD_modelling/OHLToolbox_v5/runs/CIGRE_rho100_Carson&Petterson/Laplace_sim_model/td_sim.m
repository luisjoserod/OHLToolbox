function [v]=td_sim(ord,f,freq,gamma_dis,Z_dis,Y_dis,Ti_dis,Ys_dis,Yr_dis,length,time_cl_brkr,samples,e,data_t_sim,time_sim)
%% 3B) Circuit Struct - Transmission Line
%[gamma,Z,Y,Ti,Ys,Yr]=do_spline(ord,freq,f,gamma_dis,Z_dis,Y_dis,Ti_dis,Ys_dis,Yr_dis);
[gamma,Z,Y,Ti,Ys,Yr]=do_pchip(ord,freq,f,gamma_dis,Z_dis,Y_dis,Ti_dis,Ys_dis,Yr_dis);

Ybranch=zeros(max(size(f)),(2*ord)^2); % (num_files x (2*ord)^2)   

for o=1:1:max(size(f))
    %Ybranch_dis=get_Ybranch(ord,length,Ti(o,:),Ys(o,:),Yr(o,:),gamma(o,:),Z(o,:)); % Function get_Ybranch - ?????????? ?? ???????? ?????? ???????????? ??? ???????? ??? ???? ??? ???????? ????????? - (1 x (2*ord)^2)
    Ybranch_dis=get_Ybranch_scaled(ord,length,Ti(o,:),Ys(o,:),Yr(o,:),gamma(o,:),Z(o,:)); % Function get_Ybranch - ?????????? ?? ???????? ?????? ???????????? ??? ???????? ??? ???? ??? ???????? ????????? - (1 x (2*ord)^2)

    Ybranch(o,:)=Ybranch_dis; % ?????????? ???? ??? Ybranch_dis ??? ???????? ????????? - (num_files x (2*ord)^2)
end

%% 5) Voltage Sources
amp=1; % Amplitude in pu!!

% a) Sinusoidal Voltage
%[vo1,Vo1]=src_sin(amp,data_t_sim); % Function src_sin

% b) Energization
%[vo1,Vo1]=src_enrg(amp,time_cl_brkr,data_t_sim,e); % Functioen src_enrg

% c) Step Response
[vo1,Vo1,c]=src_step(amp,time_cl_brkr,samples,e,f,data_t_sim,time_sim); % Function src_step with FFT or NLT!!

% d) Double Exponential
%[vo1,Vo1,c]=src_dexp(amp,time_cl_brkr,time_sim,samples,e,f,data_t_sim); % Function src_dexp with FFT or NLT!!

% e) Custom Source
%[vo1,Vo1]=src_custom(time_sim,samples,e); % Function src_dexp

% f) All frequencies
%[Vo1,c]=src_all_freq(data_t_sim,samples,time_sim,f,e); % Function src_all_freq % Function src_all_freq with FFT or NLT!!

% g) 3ph Source
%[vo1,vo2,vo3,Vo1,Vo2,Vo3,c]=src_3ph(amp,time_cl_brkr,data_t_sim,e,samples,f,time_sim); % Function src_3ph with FFT or NLT!!


%% 6) Frequency Domain Calculation
V=calc_Vnode(ord,f,Ybranch,Vo1); % Function calc_Vnode - ??????????? ??? ??????????? ??? ?????? ?? ????? ???? ??????? ??? ????? ??? ?????????? (S ??? R) - (2*ord x max(size(f)))

%% 7) Time Domain Calculation
v=tm_dmn_clc(V,f,e,data_t_sim,c,ord); % Function tm_dmn_clc - ??????????? ??? ??????????? ??? ?????? ?? ????? ???? ??????? ??? ????? ??? ?????? - (2*max(size(f)) x 2*ord)=(samples x 2*ord)

supr_zero=find(data_t_sim==time_cl_brkr);

for o=1:1:2*ord
    v(1:supr_zero,o)=0;
    figure(o)
    plot(data_t_sim,v(:,o));
    %plot(data_t_sim(1:100001),v(1:100001,o));
end
