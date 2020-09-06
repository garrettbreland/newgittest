%% ME509HW3
% Garrett Breland
%% Variable Definitions

q_gen = 100000; % W/m^3
Ta = 10; % C
Tb = 20; % C
L = .1; % m
k = 20; % W/m-K

x_start = 0;
x_step = 0.01;
x_stop = L;

%% Equations
% Non-dimensionalized equations 

% a) T1_tilde = 1 - x_tilde
% b) T2_tilde = x_tilde
% c) T3_tilde = x_tilde(1-x_tilde)

%% Running Functions

T1 = X11B10 ([x_start:x_step:x_stop], L, Ta);
T2 = X11B01 ([x_start:x_step:x_stop], L, Tb);
T3 = X11B00G1 ([x_start:x_step:x_stop], L, k, q_gen);
T_total = T1 + T2 + T3;

%% Plotting

set(gcf,'units','inches','position',[2,0.5,8,5])

y_lim = 50;

subplot(2,2,1)
plot([x_start:x_step:x_stop],T1,'r')
title('X11B10')
ylim([0 y_lim])
legend('T1','location','best')
xticklabels({'0',' ',' ',' ',' ','L'})
yticklabels({'0','Ta'})
text(.01,12,'Ta = 10 C')

subplot(2,2,2)
plot([x_start:x_step:x_stop],T2,'b')
title('X11B01')
ylim([0 y_lim])
legend('T2','location','best')
xticklabels({'0',' ',' ',' ',' ','L'})
yticklabels({'0',' ','Tb'})
text(.01,10,'Tb = 20 C')

subplot(2,2,3)
plot([x_start:x_step:x_stop],T3,'g')
title('X11B00G1')
ylim([0 y_lim])
legend('T3','location','best')
xticklabels({'0',' ',' ',' ',' ','L'})
yticklabels({'0',' ',' ',' ',' ','50'})

subplot(2,2,4)
hold on
plot([x_start:x_step:x_stop],T1,'-.r')
plot([x_start:x_step:x_stop],T2,'-.b')
plot([x_start:x_step:x_stop],T3,'-.g')
plot([x_start:x_step:x_stop],T_total,'c')
hold off
title('X11B11G1')
ylim([0 y_lim])
legend('T1','T2','T3','T(x)','location','best')
xticklabels({'0',' ',' ',' ',' ','L'})
yticklabels({'0','Ta','Tb'})
box on

%% Functions

    function T1 = X11B10 (x, L, T)
        for i = 1:length(x)
            T1(i) = T*(1-(x(i)/L));
        end
        
    end
    
    
    function T2 = X11B01 (x, L, T)
        for i = 1:length(x)
            T2(i) = T*(x(i)/L);
        end
        
    end
    
        
    function T3 = X11B00G1 (x, L, k, q_gen)
        for i = 1:length(x)
            T3(i) = (q_gen/(2*k))*((L*x(i))-(x(i)^2));
        end
        
    end
        