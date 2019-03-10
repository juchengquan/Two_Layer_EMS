clear;
wind_all = xlsread('wind_5m_data.xlsx');
pv_all =  xlsread('pv_5m_data.xlsx');

wind = [];  wind_out = [];  wind_param = [0.3, 0.4];
pv = [];    pv_out = [];    pv_param = [0.3, 0.4];

fprintf('1....');
import1 = tic;
for i=1:1:size(wind_all,1)
    wind = [wind, wind_all(i,:)];
    pv = [pv, pv_all(i,:)];
end
fprintf('Finish. Time: %4fs\n', import1);
clearvars import1 i;

fprintf('2....');
import2 = tic;
for i = 1:1:size(wind,2)
    wind_ranV = randn(1,24);
    wind_seq = wind(1,i:i+23);
    wind_sigma = linspace(wind_param(1),wind_param(2),24) .* wind_seq;
    wind_out = [wind_out; wind_seq+wind_ranV.*wind_sigma/2]; 
    
    pv_ranV = randn(1,24);
    pv_seq = pv(1,i:i+23);
    pv_sigma = linspace(pv_param(1),pv_param(2),24) .* pv_seq;
    pv_out = [pv_out; pv_seq+pv_ranV.*pv_sigma/2];
end
fprintf('Finish. Time: %4fs\n', import2);
clearvars import2;
pv_p = pv_out(1:105120,:);
wind_p = wind_out(1:105120,:);
fprintf('3....');
import3 = tic;
wind_p = [wind_out;zeros(200,24)];
wind_p = wind_p(1:105120,:);
xlswrite('wind_5m_30T40percent.xlsx',wind_p);
fprintf('Finish. Time: %4fs\n', import3);
clearvars import3;

fprintf('4....');
import4 = tic;
pv_p = [pv_out;zeros(200,24)];
pv_p = pv_p(1:105120,:);
xlswrite('pv_5m_30T40percent.xlsx',pv_p);
fprintf('Finish. Time: %4fs\n', import4);
clearvars import4;
