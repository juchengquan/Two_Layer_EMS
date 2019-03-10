function mpcData = fcnImportData(filename1,filename2)

    data_all = xlsread(filename1);
    price_all = xlsread(filename2);
    [mpcData.xdem,mpcData.ydem] = size(data_all);


    mpcData.load = data_all(:,1);
    mpcData.PV = data_all(:,2);
    mpcData.wind = data_all(:,3);
    
    mpcData.price = price_all(:,1);

end