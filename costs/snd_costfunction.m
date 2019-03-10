function cost = snd_costfunction(mpcModel, u, varargin)

%%
% costfunction(mpcModel, u, varargin)
%UNTITLED3 Summary of this function goes here
%	evaluates the cost function of the
%   optimal control problem over the horizon
%   N with sampling time T for the current
%   data of the optimization method t0, snd.xmeasure
%  	and u.
% 	The function return the computed cost
%	function value.

    
    cost = 0;
    x = zeros(mpcModel.horizon+1, length(mpcModel.xmeasure));
    x = snd_computeOpenloopSolution(mpcModel, u );
    
    for k=1:mpcModel.horizon
        cost = cost+mpcModel.runningcosts(k, x(k,:), u(:,k), mpcModel.u0_ref, mpcModel.battery); %, varargin
    end
    cost = cost+ 0.5*mpcModel.terminalcosts((mpcModel.horizon+1), x(mpcModel.horizon+1,:));
     %, varargin
end

