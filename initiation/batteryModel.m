function battery = batteryModel

	battery.type = 'Li-ion';

	battery.capacity = 12 ;  % kwh

	battery.lifeParam = [5000, 2];  % [A,b];

	battery.power = [4 -4]; %[discharge, charge]

	battery.price = 600; % $/kwh
    	
    battery.range = [10 90]; % Operating range
    
    battery.totalprice = battery.capacity*battery.price;
    
    battery.degrated_capacity = []; %degradation on capacity

end