% OHTL run

close all; % Deletes all figures whose handles are not hidden
clc; % Clears all input and output from the Command Window display, giving you a "clean screen"
clear;
close all;
format longEng; % Engineering format that has exactly 16 significant digits and a power that is a multiple of three.

% job parameters
soil_rho=1000;%resistivity of earth
soil_eps=5;
fd_model = 0; %constant
Zmod_src='Ztot_Carson';
Ymod_src='Ytot_Imag';
jobid = ['FD' num2str(fd_model) '_' Zmod_src '_' Ymod_src '_rho' num2str(soil_rho) '_eps' num2str(soil_eps)];

%% Library functions
currmfile = mfilename('fullpath');
currPath = currmfile(1:end-length(mfilename()));
addpath([currPath 'ZY_OHTL_pul_funs']);
addpath([currPath 'mode_decomp_funs']);
addpath([currPath 'FD_soil_models_funs']);

%% Frequency range 
points_per_dec=10;
f_dec1=1:10/points_per_dec:10;
f_dec2=10:100/points_per_dec:100;
f_dec3=100:1000/points_per_dec:1000;
f_dec4=1000:10000/points_per_dec:10000;
f_dec5=10000:100000/points_per_dec:100000;
f_dec6=100000:1000000/points_per_dec:1000000;
f=transpose([f_dec1(1:length(f_dec1)-1) f_dec2(1:length(f_dec2)-1) f_dec3(1:length(f_dec3)-1) f_dec4(1:length(f_dec4)-1) f_dec5(1:length(f_dec5)-1) f_dec6]);
%f=transpose([f_dec4(1:length(f_dec4)-1) f_dec5(1:length(f_dec5)-1) f_dec6]); % for NB-PLC
%f_dec7=1000000:10000:100000000;
%f=transpose(f_dec7); % for BB-PLC
%f=transpose([1E-6 f_dec1(1:length(f_dec1)-1) f_dec2(1:length(f_dec2)-1) f_dec3(1:length(f_dec3)-1) f_dec4(1:length(f_dec4)-1) f_dec5(1:length(f_dec5)-1) f_dec6(1:length(f_dec6)-1) f_dec7]);
%f=50;
freq_siz=length(f);

%% Line Parameters
[line_length,ord,soil,h,d,Geom]=LineData_fun_(soil_rho,soil_eps);

%% Flags
ZYprnt=1; % Flag to print parameters
ZYsave=1; % Flag to save parameters to matfiles
FD_flag=fd_model; % Flag for FD soil models. (0) Constant, (1) Longmire & Smith, (2) Portela, (3) Alipio & Visacro, (4) Datsios & Mikropoulos, (5) Scott, (6) Messier, (7) Visacro & Portela, (8) Visacro & Alipio, (9) Cigre
decmp_flag = 9; % Modal decomposition flag. (1) QR,(2)QR ATP,(3)simple_QR,(4)simple_QR,(5)NR,(6)NR_back,(7)SQP,(8)SQP_back,(9)LM,(10)LM_back,(11)LM_fast,(12)LM_alt

%% Calculations
tic
[Ztot_Carson,Ztot_Noda,Ztot_Deri,Ztot_AlDe,Ztot_Sunde,Ztot_Pettersson,Ztot_Semlyen] = Z_clc_fun(f,ord,ZYprnt,FD_flag,freq_siz,soil,h,d,Geom,ZYsave,jobid); % Calculate Z pul parameters by different earth approaches
[Ytot_Imag,Ytot_Pettersson,sigma_g_total,e_g_total] = Y_clc_fun(f,ord,ZYprnt,FD_flag,freq_siz,soil,h,d,Geom,ZYsave,jobid); % Calculate Y pul parameters by different earth approaches
[Zch_mod,Ych_mod,Zch,Ych,g_dis,a_dis,vel_dis,Ti_dis,Z_dis,Y_dis] = mode_decomp_fun(eval(Zmod_src),eval(Ymod_src),f,freq_siz,ord,decmp_flag,sigma_g_total,e_g_total,ZYprnt,jobid); % Modal decomposition
%[H_mod,F_mod,pol_co] = HF_VF_fun(Ti_dis,g_dis,line_length,f,ord); % Vector Fitting
toc


%% Save files

%eval is not pretty but gets the job done 
eval([jobid '_data.Ztot_Pettersson = Ztot_Pettersson;' ])
eval([jobid '_data.Ytot_Pettersson = Ytot_Pettersson;' ])
eval([jobid '_data.Ztot_Carson = Ztot_Carson;' ]) % this the pul (per unit len) impedance
eval([jobid '_data.Ytot_Imag = Ytot_Imag;' ]) % this the pul (per unit len) admittance
eval([jobid '_data.Zch_mod = Zch_mod;' ]) % this is the modal characteristic impedance
eval([jobid '_data.Ych_mod = Ych_mod;' ]) % this is the modal characteristic admittance
eval([jobid '_data.Zch = Zch;' ])
eval([jobid '_data.Ych = Ych;' ])
eval([jobid '_data.g_dis = g_dis;' ]) % this is the propagation constant gamma
eval([jobid '_data.a_dis = a_dis;' ]) % this is the propagation constant gamma
eval([jobid '_data.vel_dis = vel_dis;' ]) % this is the propagation constant gamma
eval([jobid '_data.Ti_dis = Ti_dis;' ])
eval([jobid '_data.Z_dis = Z_dis;' ])
eval([jobid '_data.Y_dis = Y_dis;' ])
eval([jobid '_data.sigma_g_total = sigma_g_total;' ])
eval([jobid '_data.e_g_total = e_g_total;' ])

if (ZYsave)
    fname = [jobid '.mat'];
    save(fname,[jobid '_data'])
    
    mkdir(currPath,[jobid '_plots'])
    FolderName = [currPath [jobid '_plots\']];   % Your destination folder
    FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
    for iFig = 1:length(FigList)
        FigHandle = FigList(iFig);
        FigName   = get(FigHandle, 'Name');
        savefig(FigHandle, [FolderName FigName '.fig']);
    end

end


function [length,Ncon,soil,h,d,Geom]=LineData_fun_(soil_rho,soil_eps)
% Line Geometry
%
% 1 column -- number of conductor
% 2 column -- x position of each conduntor in meters
% 3 column -- y position of each coductor in meters
% 4 column -- internal radii of each conductor
% 5 column -- external radii of each conductor
% 6 column -- resistivity of the aluminum
% 7 column -- permeability of the conductor
% 8 column -- external radii of insulation
% 9 column -- relative permeability of insulation
% 10 column -- relative permittivity of insulation
% 11 column -- line length in m


% Geom = [1   0.0     20   0.00463  0.01257  7.1221e-8   1     nan    nan   nan   1
%         2   10.0     20   0.00463  0.01257  7.1221e-8   1     nan    nan   nan   1];
    
Geom = [1  -6.6     13.5   0.00463  0.01257  7.1221e-8   1     nan    nan   nan   1
        2   0.0     13.5   0.00463  0.01257  7.1221e-8   1     nan    nan   nan   1
        3   6.6     13.5   0.00463  0.01257  7.1221e-8   1     nan    nan   nan   1
        4  10.0     01.0   0.12450  0.12700  2.8444e-7   250   0.227    1     3   1       % P46
        5  -4.65    17.6   0.00000  0.004765 2.46925E-7   1     nan    nan   nan  1
        6   4.65    17.6   0.00000  0.004765 2.46925E-7   1     nan    nan   nan   1];     % P66       
%        4  10.0     01.0   0.12450  0.12700  2.8444e-7   250   nan    nan   nan   1];    % P44       
%        4  10.0     01.0   0.12450  0.12700  2.8444e-7   1   nan    nan   nan   1];      % P43       
%        4  10.0     01.0   0.00463  0.01257  7.1221e-8   1   nan    nan   nan   1];      % P42       
%        4  10.0     13.5   0.00463  0.01257  7.1221e-8   1   nan    nan   nan   1];      % P41           
length  = Geom(1,11);                                     % Line length
Ncon    = Geom(max(Geom(:,1)),1);                        % Number of conductors

% Variables
%e0=8.854187817e-12;  % Farads/meters
m0=4*pi*1e-7;        % Henry's/meters


%Height of Line Calculation
[h]=height_fun(Ncon,Geom);

%Distance between conductor calculation
[d]=distance_fun(Ncon,Geom);

% Earth Electric Parameters
soil.erg=soil_eps; %relative permittivity of earth
mrg=1;          %relative permeability of earth
soil.m_g=m0*mrg;
soil.sigma_g=1/soil_rho; %conductivity of earth
end
