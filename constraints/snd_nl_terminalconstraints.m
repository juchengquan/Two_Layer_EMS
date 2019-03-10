function [c,ceq] = snd_nl_terminalconstraints(t, x, varargin)
    if nargin >=3
        battery = cell2mat(varargin(1));
    else 
    end

    c(1) = x(2)-battery.range(2);
    c(2) = battery.range(1)-x(2);
    c(3) = -x(3);
    c(4) = x(3)-100;
    ceq = [];
end
