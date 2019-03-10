function [c,ceq] = nl_terminalconstraints(t, x, mpcModel , varargin)

    c(1) = x(2)-mpcModel.battery.range(2);
    c(2) = mpcModel.battery.range(1)-x(2);
    
    ceq = [];
end
