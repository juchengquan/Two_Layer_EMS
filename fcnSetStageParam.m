function mpcModel = fcnSetStageParam( imput )
	% iteration: Total hours to be considered;
	% horizon: prediction horizon;
	%snd_from_fst: data needed from the first layer;
%% Do not modify this part
tol_opt       = 1e-8;
opt_option    = 1; 
iprint        = 5;
[tol_opt, opt_option, iprint, printClosedloopDataFunc]...
    = fcnChooseAlgorithm(tol_opt, opt_option, iprint, @printClosedloopData);
%Do not modify this part END

	if strcmp( imput , 'fst')
        % MPC Parameters
        mpcModel.name = 'fst';
		mpcModel.iter = 24*2; %7days: 168
		mpcModel.horizon = 48; %48 as default
        % Variable Inicitialization
        mpcModel.u0      = repmat( [4.99999;0.00001], 1, mpcModel.horizon ); %2 initial control variables
        mpcModel.xmeasure    = [0.000, 50]; %2 initial state
        % Optimization Alrogithm
        mpcModel.option = fcnChooseOption(opt_option, tol_opt, mpcModel.u0);
        % Funcitions
        mpcModel.costfunction = @costfunction ;
        mpcModel.nonlinearconstraints = @nonlinearconstraints ;
        mpcModel.runningcosts = @runningcosts;
        mpcModel.terminalcosts = @terminalcosts;
        mpcModel.nl_constraints = @nl_constraints;
        mpcModel.nl_terminalconstraints = @nl_terminalconstraints;
        mpcModel.l_constraints = @l_constraints;
        mpcModel.system_model = @system_model;
        %System Models:
        mpcModel.battery = batteryModel();
        %Recording Parameters:
        mpcModel.u = [];
        mpcModel.x = [];
        mpcModel.f = [];
        % Print Settings
        mpcModel.iprint = iprint;
        mpcModel.printClosedloopData = printClosedloopDataFunc;
        
    elseif strcmp( imput , 'snd')
        % MPC Parameters
        mpcModel.name = 'snd';
		mpcModel.from_fst = 2; %2
		mpcModel.iter = 12; %12
		mpcModel.horizon = 12; %12
        % Funcitions
        mpcModel.costfunction = @snd_costfunction;
        mpcModel.nonlinearconstraints = @snd_nonlinearconstraints;
        mpcModel.runningcosts = @snd_runningcosts;
        mpcModel.terminalcosts = @snd_terminalcosts;
        mpcModel.nl_constraints = @snd_nl_constraints;
        mpcModel.nl_terminalconstraints = @snd_nl_terminalconstraints;
        mpcModel.l_constraints = @snd_l_constraints;
        mpcModel.system_model = @snd_system_model;
        % System Models
        mpcModel.battery = batteryModel();
        %Recording Parameters:
        mpcModel.x = [];
        mpcModel.u = [];
        
        % Print Settings
        mpcModel.iprint = iprint;
        mpcModel.printClosedloopData = printClosedloopDataFunc;
        
        mpcModel.flag = 0;  
    else
        error('Parameter setting is wrong. Please check your input');
	end
end