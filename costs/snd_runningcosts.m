function cost = snd_runningcosts(k, x, u, varargin) %this shows the objective funciton
    u0_ref  = cell2mat(varargin(1));

    if nargin >= 5
        battery = cell2mat(varargin(2));
    end
        %@@UPDATE tou price
        A = battery.lifeParam(1,1);
        b = battery.lifeParam(1,2);
        capacity = battery.capacity;
        totalprice = battery.totalprice;
        coeff = totalprice/(2*A*(capacity^b)); 
    cost = ( (u(1)-u0_ref(1,k))^2 + (u(2)-u0_ref(2,k))^2 ) ;
    
    if u(2)*x(1)>=0   % x(1) is the cumulative kWh
        cost = cost + coeff*( abs(x(1)+u(2))^b - abs(x(1)^b ) );
    else %0.0001*(1/u(2))^2 +
        cost = cost + coeff*( abs(u(2))^b );
    end
end