function [c,ceq] = nl_constraints(t, x, u, mpcModel, varargin) %add battery SOC constraints
        
    c(1) = x(2)-mpcModel.battery.range(2);
    c(2) = mpcModel.battery.range(1)-x(2);
    
    ceq =  [];
    
end
