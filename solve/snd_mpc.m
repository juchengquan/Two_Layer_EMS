function [t, x, u] = snd_mpc(snd, output_data, varargin)     
    warning off all;
%%
    snd.net_load = snd.load *2 - snd.PV/3 - snd.wind; %Power Balance

    %   Solve the optimal control problem
    t_Start = tic;
    [snd.u0, V_current, exitflag, output] = snd_solveOptimalControlProblem( snd );
    t_Elapsed = toc( t_Start );
    %V_current
    
    if ( snd.iprint >= 1 )
        printSolution(snd.printClosedloopData, snd.mpciter, snd.xmeasure, snd.u0, snd.iprint, exitflag, t_Elapsed, output_data);
    end

    %Save current information:
    x_estimated = snd_computeOpenloopSolution( snd , snd.u0 );


    t = output;
    x = x_estimated;
    u = snd.u0;    

    
end