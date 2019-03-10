function cost = costfunction(mpcModel, u, varargin)
%fst.runningcosts, fst.terminalcosts, fst, fst.horizon, fst.xmeasure, u, fst.price, fst.battery
%UNTITLED3 Summary of this function goes here
%	SOME WORD

    cost = 0;
    % x = zeros(fst.horizon+1, length(fst.xmeasure));
    x = computeOpenloopSolution(mpcModel , u );

    for k=1:mpcModel.horizon
        cost = cost+mpcModel.runningcosts(k, x(k,:), u(:,k), mpcModel); %, varargin
    end
        cost = cost+mpcModel.terminalcosts( mpcModel.horizon+1, x(mpcModel.horizon+1,:), mpcModel );
end

