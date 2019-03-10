function priceOut = fcnCalCostwithDegradation(mpcModel, mpcdata, varargin) %this shows the objective funciton
%UPDATE Degradation Cost
    m   = mpcModel.mpciter;
    u = mpcModel.u;
    x = mpcModel.x;
    price = mpcdata.price(1:m,1);
    priceOut = zeros(m,1);
    
    A = mpcModel.battery.lifeParam(1,1);
    b = mpcModel.battery.lifeParam(1,2);

    coeff = mpcModel.battery.totalprice /(2*A*( mpcModel.battery.capacity ^b)); 

for i = 1:1:m
    if  u(i,1)>=0  
        if u(i,2)*x(i,1)>=0   % x(1) is the cumulative kWh
            cost =  price(i)*u(i,1)  + coeff*( abs(x(i,1)+u(i,2))^b - abs(x(i,1)^b ) );
        else %0.0001*(1/u(2))^2 +
            cost =  price(i)*u(i,1)  + coeff*( abs(u(i,2))^b );
        end
    else
        if u(i,2)*x(i,1)>=0   % x(1) is the cumulative kWh
            cost =  0.8*price(i)*u(i,1)  + coeff*( abs(x(i,1)+u(i,2))^b - abs(x(i,1)^b ) );
        else %0.0001*(1/u(2))^2 +
            cost =  0.8*price(i)*u(i,1)  + coeff*( abs(u(i,2))^b );
        end
    end  
    priceOut(i,1) = cost;
end

end
