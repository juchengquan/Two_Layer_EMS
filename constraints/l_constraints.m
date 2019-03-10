function [A, b, Aeq, beq, lb, ub] = l_constraints(mpcModel, k, varargin)

        A   = []; %A*u<=b
        b   = [];
        Aeq = [1 1];
        beq = mpcModel.net_load(k);

        ub  = [10, mpcModel.battery.power(1,1)]; 
        lb  = [-5, mpcModel.battery.power(1,2)];

end
