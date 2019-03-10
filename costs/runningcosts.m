function cost = runningcosts(k, x, u, mpcModel, varargin) % the objective funciton

        %UPDATE Degradation Cost
        A = mpcModel.battery.lifeParam(1,1);
        b = mpcModel.battery.lifeParam(1,2);

        coeff = mpcModel.battery.totalprice /(2*A*( mpcModel.battery.capacity ^b)); 

    if  u(1)>=0  
        if u(2)*x(1)>=0   % x(1) is the cumulative kWh
            cost =  mpcModel.price(k)*u(1)  + coeff*( abs(x(1)+u(2))^b - abs(x(1)^b ) );
        else %0.0001*(1/u(2))^2 +
            cost =  mpcModel.price(k)*u(1)  + coeff*( abs(u(2))^b );
        end
    else
        if u(2)*x(1)>=0   % x(1) is the cumulative kWh
            cost =  0.8*mpcModel.price(k)*u(1)  + coeff*( abs(x(1)+u(2))^b - abs(x(1)^b ) );
        else %0.0001*(1/u(2))^2 +
            cost =  0.8*mpcModel.price(k)*u(1)  + coeff*( abs(u(2))^b );
        end
    end      

end
