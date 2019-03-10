function [c,ceq] = nonlinearconstraints(mpcModel, u, varargin)


%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    
    % x = zeros(mpcModel.horizon+1, length(fst.xmeasure));
    x = computeOpenloopSolution( mpcModel, u );
    c = [];
    ceq = [];
    for k=1:mpcModel.horizon
        [cnew, ceqnew] = mpcModel.nl_constraints(k,x(k,:),u(:,k), mpcModel);
        c = [c, cnew];
        ceq = [ceq, ceqnew];
    end
    [cnew, ceqnew] = mpcModel.nl_terminalconstraints((mpcModel.horizon+1),x(mpcModel.horizon+1,:), mpcModel);
    c = [c, cnew];
    ceq = [ceq, ceqnew];
end
