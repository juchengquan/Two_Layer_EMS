function [c,ceq] = snd_nonlinearconstraints(mpcModel , u, varargin)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


    
    x = zeros(mpcModel.horizon+1, length(mpcModel.xmeasure));
    x = snd_computeOpenloopSolution(mpcModel , u);
    c = [];
    ceq = [];
    for k=1:mpcModel.horizon
        [cnew, ceqnew] = mpcModel.nl_constraints(k,x(k,:),u(:,k), mpcModel.battery);
        c = [c, cnew];
        ceq = [ceq, ceqnew];
    end
    [cnew, ceqnew] = mpcModel.nl_terminalconstraints((mpcModel.horizon+1),x(mpcModel.horizon+1,:), mpcModel.battery);
    c = [c cnew];
    ceq = [ceq ceqnew];
end
