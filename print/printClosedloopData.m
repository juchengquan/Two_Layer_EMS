function printClosedloopData(mpciter, u, x, t_Elapsed,output_data)
    global fst_output_data ;
    global snd_output_data ;
    if size(x,2)==2
        fprintf(' %3d  |%+11.4f %+11.4f         %+11.4f  %+11.4f %+8.3f', ...
            mpciter, u(1), u(2), x(1), x(2), t_Elapsed);
        fst_output_data = [output_data; [mpciter, u(1), u(2), x(1), x(2), t_Elapsed]];
    else
        fprintf(' %3d  |%+11.4f %+11.4f %+11.4f %+11.4f  %+11.4f  %+11.4f', ...
            mpciter, u(1), u(2), u(3), x(1), x(2), x(3));
        snd_output_data = [output_data; [mpciter, u(1), u(2), u(3), x(1), x(2), x(3)]];
    end

end