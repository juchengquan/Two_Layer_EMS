function [t, x, u] = fst_mpc(fst, output_data, varargin)            
    warning off all;
%%    
    fst.net_load = fst.load *2 - fst.PV/3 - fst.wind; %Power Balance

    %   Solve the optimal control problem
    t_Start = tic;
    [fst.u0, V_current, exitflag, output] = solveOptimalControlProblem( fst );
    t_Elapsed = toc( t_Start );

    if ( fst.iprint >= 1 )
        printSolution(fst.printClosedloopData, fst.mpciter, fst.xmeasure, fst.u0, fst.iprint, exitflag, t_Elapsed,output_data);
    end
    
    % Step (3):
    %Save current information:
    t = output;
    x = computeOpenloopSolution(fst,fst.u0);
    u = fst.u0;    
  
end