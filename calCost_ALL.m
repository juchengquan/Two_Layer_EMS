clear;
load('.\exportData\S3\30T40_\ALL.mat');
cost_Batt = sum( fcnCalCostonlyDegradation(fst, mpcdata) ) / fst.iter;
cost24 = sum( fcnCalCostwithDegradation(fst, mpcdata) ) / fst.iter;