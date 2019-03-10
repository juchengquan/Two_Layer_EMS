function [u_new, V, exitflag, output] = solveOptimalControlProblem (fst, varargin)

% fst.horizon, fst.xmeasure, fst.u0, fst.opt_option, fst.price, fst.net_load, battery
%SOLVEOPTIMALCONTROLPROBLEM Summary of this function goes here
%   solves the optimal control problem of the

    %x = computeOpenloopSolution(fst); %For linear constraints

    % Set control and linear bounds
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [];
    ub = [];
    for k=1:fst.horizon  %Aggregation
        [Anew, bnew, Aeqnew, beqnew, lbnew, ubnew] = fst.l_constraints( fst, k );
        
        A = blkdiag(A,Anew);
        b = [b, bnew];
        Aeq = blkdiag(Aeq,Aeqnew);
        beq = [beq, beqnew];
        lb = [lb, lbnew];
        ub = [ub, ubnew];
    end
    
    % Solve optimization problem
    [u_new, V, exitflag, output] = fmincon( @(u) fst.costfunction( fst, u ), fst.u0 , ...    % Objective
         A, b, Aeq, beq, lb, ub, ...                                            % Linear Constarints
        @(u) fst.nonlinearconstraints(fst, u ), fst.option);                    % Nonlinear Constraints
end

