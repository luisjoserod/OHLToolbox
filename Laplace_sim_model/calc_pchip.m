function [Ybranch]=calc_pchip(ord,freq,f,Ybranch_dis_tot)
    
for o=1:1:(2*ord)^2
   Ybranch_real_fit(:,o)=pchip(freq,real(Ybranch_dis_tot(:,o))); % Pchip ��� ���������� ����� ���� ������ ��� ������ Ybranch_dis_tot - ��� �������� ��������, ����� ����� struct
   Ybranch_imag_fit(:,o)=pchip(freq,imag(Ybranch_dis_tot(:,o))); % Pchip ��� ���������� ����� ���� ������ ��� ������ Ybranch_dis_tot - ��� �������� ��������, ����� ����� struct 
end

Ybranch=zeros(max(size(f)),(2*ord)^2); % (max(size(f)) x (2*ord)^2)
for o=1:1:(2*ord)^2
    Ybranch(:,o)=ppval(Ybranch_real_fit(:,o),f)+1j*ppval(Ybranch_imag_fit(:,o),f); % Ppval ���� Spline ��� �� ����� � ���������� ���������� �� ��� �� ����� ���������� - (max(size(f)) x (2*ord)^2)
end