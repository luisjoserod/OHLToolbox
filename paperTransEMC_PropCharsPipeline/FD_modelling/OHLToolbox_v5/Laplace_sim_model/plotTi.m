% figure(1)
% subplot(3,2,1);semilogx(freq,real(T(:,1)),freq,real(T(:,7)),freq,real(T(:,13)),freq,real(T(:,19)),freq,real(T(:,25)),freq,real(T(:,31)))
% subplot(3,2,2);semilogx(freq,real(T(:,2)),freq,real(T(:,8)),freq,real(T(:,14)),freq,real(T(:,20)),freq,real(T(:,26)),freq,real(T(:,32)))
% subplot(3,2,3);semilogx(freq,real(T(:,3)),freq,real(T(:,9)),freq,real(T(:,15)),freq,real(T(:,21)),freq,real(T(:,27)),freq,real(T(:,33)))
% subplot(3,2,4);semilogx(freq,real(T(:,4)),freq,real(T(:,10)),freq,real(T(:,16)),freq,real(T(:,22)),freq,real(T(:,28)),freq,real(T(:,34)))
% subplot(3,2,5);semilogx(freq,real(T(:,5)),freq,real(T(:,11)),freq,real(T(:,17)),freq,real(T(:,23)),freq,real(T(:,29)),freq,real(T(:,35)))
% subplot(3,2,6);semilogx(freq,real(T(:,6)),freq,real(T(:,12)),freq,real(T(:,18)),freq,real(T(:,24)),freq,real(T(:,30)),freq,real(T(:,36)))
% 
% figure(2)
% subplot(3,2,1);semilogx(freq,imag(T(:,1)),freq,imag(T(:,7)),freq,imag(T(:,13)),freq,imag(T(:,19)),freq,imag(T(:,25)),freq,imag(T(:,31)))
% subplot(3,2,2);semilogx(freq,imag(T(:,2)),freq,imag(T(:,8)),freq,imag(T(:,14)),freq,imag(T(:,20)),freq,imag(T(:,26)),freq,imag(T(:,32)))
% subplot(3,2,3);semilogx(freq,imag(T(:,3)),freq,imag(T(:,9)),freq,imag(T(:,15)),freq,imag(T(:,21)),freq,imag(T(:,27)),freq,imag(T(:,33)))
% subplot(3,2,4);semilogx(freq,imag(T(:,4)),freq,imag(T(:,10)),freq,imag(T(:,16)),freq,imag(T(:,22)),freq,imag(T(:,28)),freq,imag(T(:,34)))
% subplot(3,2,5);semilogx(freq,imag(T(:,5)),freq,imag(T(:,11)),freq,imag(T(:,17)),freq,imag(T(:,23)),freq,imag(T(:,29)),freq,imag(T(:,35)))
% subplot(3,2,6);semilogx(freq,imag(T(:,6)),freq,imag(T(:,12)),freq,imag(T(:,18)),freq,imag(T(:,24)),freq,imag(T(:,30)),freq,imag(T(:,36)))

% figure(1)
% semilogx(freq,real(T(:,1)),freq,real(T(:,2)),freq,real(T(:,3)),freq,real(T(:,4)),freq,real(T(:,5)),freq,real(T(:,6)),freq,real(T(:,7)),freq,real(T(:,8)),freq,real(T(:,9)),freq,real(T(:,10)),freq,real(T(:,11)),freq,real(T(:,12)),freq,real(T(:,13)),freq,real(T(:,14)),freq,real(T(:,15)),freq,real(T(:,16)),freq,real(T(:,17)),freq,real(T(:,18)),freq,real(T(:,19)),freq,real(T(:,20)),freq,real(T(:,21)),freq,real(T(:,22)),freq,real(T(:,23)),freq,real(T(:,24)),freq,real(T(:,25)),freq,real(T(:,26)),freq,real(T(:,27)),freq,real(T(:,28)),freq,real(T(:,29)),freq,real(T(:,30)),freq,real(T(:,31)),freq,real(T(:,32)),freq,real(T(:,33)),freq,real(T(:,34)),freq,real(T(:,35)),freq,real(T(:,36)))
% figure(2)
% semilogx(freq,imag(T(:,1)),freq,imag(T(:,2)),freq,imag(T(:,3)),freq,imag(T(:,4)),freq,imag(T(:,5)),freq,imag(T(:,6)),freq,imag(T(:,7)),freq,imag(T(:,8)),freq,imag(T(:,9)),freq,imag(T(:,10)),freq,imag(T(:,11)),freq,imag(T(:,12)),freq,imag(T(:,13)),freq,imag(T(:,14)),freq,imag(T(:,15)),freq,imag(T(:,16)),freq,imag(T(:,17)),freq,imag(T(:,18)),freq,imag(T(:,19)),freq,imag(T(:,20)),freq,imag(T(:,21)),freq,imag(T(:,22)),freq,imag(T(:,23)),freq,imag(T(:,24)),freq,imag(T(:,25)),freq,imag(T(:,26)),freq,imag(T(:,27)),freq,imag(T(:,28)),freq,imag(T(:,29)),freq,imag(T(:,30)),freq,imag(T(:,31)),freq,imag(T(:,32)),freq,imag(T(:,33)),freq,imag(T(:,34)),freq,imag(T(:,35)),freq,imag(T(:,36)))
% %figure(1)
% % semilogx(freq,real(T(:,11)),freq,real(T(:,35)))
% % figure(2)
% % semilogx(freq,imag(T(:,11)),freq,imag(T(:,35)))

% figure(1)
% subplot(3,2,1);semilogx(freq,real(Ti(:,1)),freq,real(Ti(:,2)),freq,real(Ti(:,3)))
% subplot(3,2,3);semilogx(freq,real(Ti(:,4)),freq,real(Ti(:,5)),freq,real(Ti(:,6)))
% subplot(3,2,5);semilogx(freq,real(Ti(:,7)),freq,real(Ti(:,8)),freq,real(Ti(:,9)))
% 
% subplot(3,2,2);semilogx(freq,imag(Ti(:,1)),freq,imag(Ti(:,2)),freq,imag(Ti(:,3)))
% subplot(3,2,4);semilogx(freq,imag(Ti(:,4)),freq,imag(Ti(:,5)),freq,imag(Ti(:,6)))
% subplot(3,2,6);semilogx(freq,imag(Ti(:,7)),freq,imag(Ti(:,8)),freq,imag(Ti(:,9)))

figure(1)
subplot(2,2,1);semilogx(freq,real(Ti(:,1)),freq,real(Ti(:,2)))
subplot(2,2,3);semilogx(freq,real(Ti(:,3)),freq,real(Ti(:,4)))

subplot(2,2,2);semilogx(freq,imag(Ti(:,1)),freq,imag(Ti(:,2)))
subplot(2,2,4);semilogx(freq,imag(Ti(:,3)),freq,imag(Ti(:,4)))