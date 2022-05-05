function [Zch_mod,Ych_mod,Zch,Ych,g,Ti,Z,Y] = mode_decomp_fun(Z_full,Y_full,freq,freq_siz,ord,decmp_flag)

Z=zeros(freq_siz,ord^2); % (num_files x ord^2)
Y=zeros(freq_siz,ord^2); % (num_files x ord^2)


for k=1:1:freq_siz 
    
    Zdis = Z_full(:,:,k);
    Ydis = Y_full(:,:,k);
    
    for o=1:ord
        Z(k,(o-1)*ord+1:o*ord)=Zdis(o,:); % ?????????? ???? ??? ?' ??? ???????? ????????? - (num_files x ord^2)
        Y(k,(o-1)*ord+1:o*ord)=Ydis(o,:); % ?????????? ???? ??? Y' ??? ???????? ????????? - (num_files x ord^2)
    end
end
%% Calculation of characteristic impedance and admittance



%% Calculation of Ti & g
if decmp_flag == 1
    [Ti,g]=simple_QR_decomp(ord,freq_siz,Z,Y); % ???? QR decomposition ????? ???????? ??? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 2
    [Ti,g]=atp_Tsiam(Z,Y,ord,freq,freq_siz); % ? ????????? ??? ?????????? - ??????????? ??? QR decomposition ??? ?????????????? ??? ??????????? ?????? ?? ???? ??? ??????????? ??? ATP/EMTP - ?????????? ?????? ??????????????? Ti (current) ((num_files x ord^2)) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 3
    [Ti,g]=product_correl_str(ord,freq_siz,Z,Y,freq); % ????????? ??? ??????? ?? eigenvector switchover ??????????? ??? ?????????? ????????????? ?? ???????????? ???????? ?? ??? ?????????? ?????????? - ???????????? ???? ??? simple_QR_decomp ???? ??? atp_Tsiam ??? ??? ?????? ?????????? - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 4
    [Ti,g]=product_correl_back(ord,freq_siz,Z,Y,freq); % ????????? ??? ??????? ?? eigenvector switchover ?????????? ??? ?????????? ????????????? ?? ???????????? ???????? ?? ??? ?????????? ?????????? - ???????????? ???? ??? simple_QR_decomp ???? ??? atp_Tsiam ??? ??? ?????? ?????????? - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 5
    [Ti,g]=NR_calc_norm_str(ord,freq_siz,Z,Y,freq); % ????????? Newton-Raphson ?? seeding ??????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 6
    [Ti,g]=NR_calc_norm_back(ord,freq_siz,Z,Y,freq); % ????????? Newton-Raphson ?? seeding ?????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
elseif decmp_flag == 7
    [Ti,g]=SQP_calc_norm_str(ord,freq_siz,Z,Y,freq); % ?????????? ???????!!! - ????????? Sequential-Quadratic-Programming (?????????????? ??????????-???????????? ?? quadratic constraints) ?? seeding ??????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
elseif decmp_flag == 8
    [Ti,g]=SQP_calc_norm_back(ord,freq_siz,Z,Y,freq); % ?????????? ???????!!! - ????????? Sequential-Quadratic-Programming (?????????????? ??????????-???????????? ?? quadratic constraints) ?? seeding ?????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)
elseif decmp_flag == 9    
    [Ti,g]=LM_calc_norm_str(ord,freq_siz,Z,Y,freq); % ????????? Levenberg-Marquardt ?? seeding ??????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
elseif decmp_flag == 10
    [Ti,g]=LM_calc_norm_back(ord,freq_siz,Z,Y,freq); % ????????? Levenberg-Marquardt ?? seeding ?????????? ??? ?????????? ??? ??????? ?? eigenvector switchover - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2) ??? ????????? g (sqrt) (num_files x ord)
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
elseif decmp_flag == 11    
    [Ti,g]=LM_fast_impl(ord,freq_siz,Z,Y,freq); % ????! - ?????????? ???????!
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
elseif decmp_flag == 12
    [Ti,g]=LM_alt_impl(ord,freq_siz,Z,Y,freq); % ????! - ?????????? ???????!
    [Zch_mod,Ych_mod,Zch,Ych]=calc_char_imped_admit(Ti,Z,Y,ord,freq_siz);
    plotwavchar_fun(freq,ord,g,Zch_mod,Ti)    
end


%% Minimization of imaginary part
%[Ti]=min_imag_part(Ti,ord,freq_siz); % ????????? ??? ??????? ?? ?????????? ????? ??????????????? ????? ??? ????????? ??? ??? ????????? ??? ????????? ??? ?????????? ??? ???????? ??? ?? ?????? ??? ???? ????????? ???? ??????????????? - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2)

[Ti]=atp_min_imag(Ti,ord,freq_siz,Y); % ????????? ??? ??????? ?? ?????????? ????? ?? ???? ?? ??????????? ??? ATP/EMTP - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2)

%[Ti]=suppr_first_elem(Ti,ord,freq_siz); % ????????? ??? ??????? ?? ?????????? ????? ?? ???? ?? ???????? ???? ??? ????????? ??? ??????????????? ?? ?????? ???????????? ???????? - ?????????? ?????? ??????????????? Ti (current) (num_files x ord^2)


