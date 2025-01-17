function [] = plotZ_fun_ct(f,ord,Ztot_Carson,Ztot_Noda,Ztot_Deri,Ztot_AlDe,Ztot_Sunde,Ztot_Pettersson,Ztot_Semlyen,Ztot_Wise,Ztot_under,Ztot_over_under,jobid)

%% Plot results
% Self impedance (Z11)
set_plot_params()
figure('Name', ['SelfImpZ11_' jobid])
o=1;
subplot(2,1,1)
if ~all(Ztot_Carson==0)
    loglog(f,squeeze(abs(Ztot_Carson(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Carson';
    o=o+1;
end

if ~all(Ztot_Noda==0)
    loglog(f,squeeze(abs(Ztot_Noda(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Noda';
    o=o+1;
end

if ~all(Ztot_Deri==0)
    loglog(f,squeeze(abs(Ztot_Deri(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Deri';
    o=o+1;
end

if ~all(Ztot_AlDe==0)
    loglog(f,squeeze(abs(Ztot_AlDe(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Alvarado-Betancourt';
    o=o+1;
end

if ~all(Ztot_Sunde==0)
    loglog(f,squeeze(abs(Ztot_Sunde(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Sunde';
    o=o+1;
end

if ~all(Ztot_Pettersson==0)
    loglog(f,squeeze(abs(Ztot_Pettersson(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Pettersson';
    o=o+1;
end

if ~all(Ztot_Semlyen==0)
    loglog(f,squeeze(abs(Ztot_Semlyen(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Semlyen';
    o=o+1;
end

if ~all(Ztot_Wise==0)
    loglog(f,squeeze(abs(Ztot_Wise(1,1,:))),'LineWidth',2);hold all
    lgd{o} = 'Wise';
    o=o+1;
end

if ~all(Ztot_under==0)
    loglog(f,squeeze(abs(Ztot_under(1,1,:))),'LineWidth',2);hold all
    lgd{o} = ['Papadopoulos' char(10) '(underground)'];
    o=o+1;
end

if ~all(Ztot_over_under==0)
    loglog(f,squeeze(abs(Ztot_over_under(1,1,:))),'LineWidth',2);hold all
    lgd{o} = ['New formulas (mixed' char(10) 'overhead-underground)'];
end

%loglog(f,squeeze(abs(Ztot_Carson(1,1,:))), ...
%    f,squeeze(abs(Ztot_Noda(1,1,:))), ...
%    f,squeeze(abs(Ztot_Deri(1,1,:))), ...
%    f,squeeze(abs(Ztot_AlDe(1,1,:))), ...
%    f,squeeze(abs(Ztot_Sunde(1,1,:))), ...
%    f,squeeze(abs(Ztot_Pettersson(1,1,:))), ...
%    f,squeeze(abs(Ztot_Semlyen(1,1,:))), ...
%    f,squeeze(abs(Ztot_Wise(1,1,:))), ...
%    f,squeeze(abs(Ztot_under(1,1,:))), ...
%    f,squeeze(abs(Ztot_over_under(1,1,:))),'LineWidth',2)
xlabel('Frequency [Hz]')
ylabel('Magnitude [\Omega/m]')
% legend('Carson','Noda','Deri','Alvarado-Betancourt','Sunde','Pettersson','Semlyen','Wise','Underground','Overhead-underground')
legend(lgd);
grid on
title('Self impedance - Z11')

o=1;
subplot(2,1,2)
if ~all(Ztot_Carson==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Carson(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Carson';
    o=o+1;
end

if ~all(Ztot_Noda==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Noda(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Noda';
    o=o+1;
end

if ~all(Ztot_Deri==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Deri(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Deri';
    o=o+1;
end

if ~all(Ztot_AlDe==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_AlDe(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Alvarado-Betancourt';
    o=o+1;
end

if ~all(Ztot_Sunde==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Sunde(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Sunde';
    o=o+1;
end

if ~all(Ztot_Pettersson==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Pettersson(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Pettersson';
    o=o+1;
end

if ~all(Ztot_Semlyen==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Semlyen(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Semlyen';
    o=o+1;
end

if ~all(Ztot_Wise==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Carson(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = 'Wise';
    o=o+1;
end

if ~all(Ztot_under==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_under(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = ['Papadopoulos' char(10) '(underground)'];
    o=o+1;
end

if ~all(Ztot_over_under==0)
    loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_over_under(1,1,:))))),'LineWidth',2);hold all
    lgd{o} = ['New formulas (mixed' char(10) 'overhead-underground)'];
end

%loglog(f,rad2deg(squeeze(angle(Ztot_Carson(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Noda(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Deri(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_AlDe(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Sunde(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Pettersson(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Semlyen(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_Wise(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_under(1,1,:)))), ...
%    f,rad2deg(squeeze(angle(Ztot_over_under(1,1,:)))),'LineWidth',2)
xlabel('Frequency [Hz]')
ylabel('Angle [deg]')
% legend('Carson','Noda','Deri','Alvarado-Betancourt','Sunde','Pettersson','Semlyen','Wise','Underground','Overhead-underground')
legend(lgd);
grid on

% Mutual impedance (Z12)

number=ord;

counter=2;
set_plot_params()
figure('Name', ['MutualImpZ12_' jobid])


% Zm_pet=squeeze(abs(Ztot_Pettersson(1,number,:)));

while (number-1>0)

    o=1;
    subplot(2,1,1)
    if ~all(Ztot_Carson==0)
        loglog(f,squeeze(abs(Ztot_Carson(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Carson';
        o=o+1;
    end

    if ~all(Ztot_Noda==0)
        loglog(f,squeeze(abs(Ztot_Noda(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Noda';
        o=o+1;
    end

    if ~all(Ztot_Deri==0)
        loglog(f,squeeze(abs(Ztot_Deri(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Deri';
        o=o+1;
    end

    if ~all(Ztot_AlDe==0)
        loglog(f,squeeze(abs(Ztot_AlDe(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Alvarado-Betancourt';
        o=o+1;
    end

    if ~all(Ztot_Sunde==0)
        loglog(f,squeeze(abs(Ztot_Sunde(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Sunde';
        o=o+1;
    end

    if ~all(Ztot_Pettersson==0)
        loglog(f,squeeze(abs(Ztot_Pettersson(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Pettersson';
        o=o+1;
    end

    if ~all(Ztot_Semlyen==0)
        loglog(f,squeeze(abs(Ztot_Semlyen(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Semlyen';
        o=o+1;
    end

    if ~all(Ztot_Wise==0)
        loglog(f,squeeze(abs(Ztot_Wise(1,number,:))),'LineWidth',2);hold all
        lgd{o} = 'Wise';
        o=o+1;
    end

    if ~all(Ztot_under==0)
        loglog(f,squeeze(abs(Ztot_under(1,number,:))),'LineWidth',2);hold all
        lgd{o} = ['Papadopoulos' char(10) '(underground)'];
        o=o+1;
    end

    if ~all(Ztot_over_under==0)
        loglog(f,squeeze(abs(Ztot_over_under(1,number,:))),'LineWidth',2);hold all
        lgd{o} = ['New formulas (mixed' char(10) 'overhead-underground)'];
    end

    xlabel('Frequency [Hz]')
    ylabel('Magnitude [\Omega/m]')
    legend(lgd);
    grid on
    title(['Mutual impedance - Z1',num2str(number)])

    o=1;
    subplot(2,1,2)

    if ~all(Ztot_Carson==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Carson(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Carson';
        o=o+1;
    end

    if ~all(Ztot_Noda==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Noda(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Noda';
        o=o+1;
    end

    if ~all(Ztot_Deri==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Deri(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Deri';
        o=o+1;
    end

    if ~all(Ztot_AlDe==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_AlDe(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Alvarado-Betancourt';
        o=o+1;
    end

    if ~all(Ztot_Sunde==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Sunde(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Sunde';
        o=o+1;
    end

    if ~all(Ztot_Pettersson==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Pettersson(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Pettersson';
        o=o+1;
    end

    if ~all(Ztot_Semlyen==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Semlyen(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Semlyen';
        o=o+1;
    end

    if ~all(Ztot_Wise==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_Carson(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = 'Wise';
        o=o+1;
    end

    if ~all(Ztot_under==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_under(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = ['Papadopoulos' char(10) '(underground)'];
        o=o+1;
    end

    if ~all(Ztot_over_under==0)
        loglog(f,rad2deg(unwrap(squeeze(angle(Ztot_over_under(1,number,:))))),'LineWidth',2);hold all
        lgd{o} = ['New formulas (mixed' char(10) 'overhead-underground)'];
    end

    xlabel('Frequency [Hz]')
    ylabel('Angle [deg]')
    legend(lgd);
    grid on
    number=number-1;
    counter=counter+1;
    if counter<=ord
        figure('Name', ['MutualImpZ1' num2str(number) '_' jobid])
    end

end
end