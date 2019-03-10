function x = computeOpenloopSolution(mpcModel,u, varargin)

%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    x(1,:) = mpcModel.xmeasure;
    
    for k=1:mpcModel.horizon
        x(k+1,:) = dynamic(mpcModel.system_model, x(k,:), u(:,k));
    end
end

