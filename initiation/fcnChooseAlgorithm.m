function [tol_opt_out, opt_option_out, iprint_out, printClosedloopData_out] ...
    = fcnChooseAlgorithm(tol_opt, opt_option, iprint, printClosedloopData)
 
    if (nargin>=1)
        tol_opt_out = tol_opt;
    else
        tol_opt_out = 1e-8;
    end;
    if (nargin>=2)
        opt_option_out = opt_option;
        % 0: active-set
        % 1: interior-point
        % 2: trust-region-reflective
    else
        opt_option_out = 1;
    end;
    if (nargin>=3)
        iprint_out = iprint;
    else
        iprint_out = 0;
    end;
    if (nargin>=4)
        printClosedloopData_out = printClosedloopData;
    else
        printClosedloopData_out = @printBlack;
    end;
    
end