function y = snd_system_model( x, u, varargin ) %This function is to define the price model
% x(1): cumulative power;
% x(2): current SOC;
% x(3): supercap SOC;
% u(1): generation power;
% u(2): batt power;
% u(3): supercap power;

    battery = batteryModel();

    y(1) = x(1)+u(2)/12;  % cumulative DOD
    y(2) = x(2)-u(2)/12*(100/battery.capacity) ;
    y(3) = x(3)-u(3)/12*(100/1); %change supercap SOC: The capacity of the supercap now is 1 kWh
    
    

end 