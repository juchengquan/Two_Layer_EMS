function [A, b, Aeq, beq, lb, ub] = snd_l_constraints(k, net_load_data, varargin)

    u0_ref = cell2mat(varargin(2));
    f = 1.2;
    g = 0.8;
    p = 1.4;
    A   = []; %A*u<=b
    b   = [];
    Aeq = [1 1 1]; %A*u = b
    beq = net_load_data(k);
    
    if k ~= 12
        if u0_ref(1,k) * u0_ref(1,k+1) <= 0
            if u0_ref(1,k)>0
                ub = [u0_ref(1,k)*f];
                lb = [u0_ref(1,k+1)*f];
            else
                ub = [u0_ref(1,k+1)*f];
                lb = [u0_ref(1,k)*f];
            end
        elseif u0_ref(1,k)>0 && u0_ref(1,k+1)>0
            if u0_ref(1,k)>u0_ref(1,k+1)
                ub = [u0_ref(1,k)*f];
                lb = [u0_ref(1,k+1)*g];
            else
                ub = [u0_ref(1,k+1)*f];
                lb = [u0_ref(1,k)*g];
            end
        elseif u0_ref(1,k)<0 && u0_ref(1,k+1)<0
            if u0_ref(1,k)>u0_ref(1,k+1)
                ub = [u0_ref(1,k)*g];
                lb = [u0_ref(1,k+1)*f];
            else
                ub = [u0_ref(1,k+1)*g];
                lb = [u0_ref(1,k)*f];
            end
        end
    else
        if u0_ref(1,k) >=0
            ub = [u0_ref(1,k)*f];
            lb = [u0_ref(1,k)*g];
        else
            ub = [u0_ref(1,k)*g];
            lb = [u0_ref(1,k)*f];
        end
        
    end

    if u0_ref(2,k)>0 %
        ub  = [ub, u0_ref(2,k)*p,  10]; 
        lb  = [lb, 0, -10];         
    else
        ub  = [ub, 0,  10]; 
        lb  = [lb, u0_ref(2,k)*p, -10];
    end


end