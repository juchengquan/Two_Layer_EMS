function u0 = shiftHorizon(u)
%shiftHorizon Summary of this function goes here
%   applies the shift method to the open loop
%   control in order to ease the restart.
%   The function returns a new initial guess
%   u0 of the control.

    u0 = [u(:,2:size(u,2)) u(:,size(u,2))];

end

