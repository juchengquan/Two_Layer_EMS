function [u, V, exitflag, output] = snd_solveOptimalControlProblem (snd,  varargin)
%UNTITLED2 Summary of this function goes here
%   solves the optimal control problem of the

    % Set control and linear bounds
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [];
    ub = [];
    for k=1:snd.horizon %Aggregation
        [Anew, bnew, Aeqnew, beqnew, lbnew, ubnew] = ...
               snd.l_constraints( k, snd.net_load, snd.battery, snd.u0_ref);
        A = blkdiag(A,Anew);
        b = [b, bnew];
        Aeq = blkdiag(Aeq,Aeqnew);
        beq = [beq, beqnew];
        lb = [lb, lbnew];
        ub = [ub, ubnew];
    end
    
    % Solve optimization problem
    [u, V, exitflag, output] = fmincon( @(u) snd.costfunction( snd, u ), ...
        snd.u0, A, b, Aeq, beq, lb, ub, ...
        @(u) snd.nonlinearconstraints(snd, u ), snd.option);
end

