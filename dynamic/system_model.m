function y = system_model( x, u, varargin ) %This function is to define the price model
% x(1): cumulative power;
% x(2): current SOC;
% u(1): generation power;
% u(2): batt power;

    battery = batteryModel();

    if u(2)*x(1)>=0 %|| abs(u(2))<0.001
        y(1) = x(1)+u(2);  % cumulative DOD
        y(2) = x(2) - u(2)*(100/battery.capacity);
        
    else
        y(1) = u(2); % cumulative DOD
        y(2) = x(2) - u(2)*(100/battery.capacity);
    end
end 