clc;

trainingData = train();

try
    load db;
  %  trainingData = db;
    db = [db ; trainingData];
    %save db.mat db
catch
    db = trainingData;
    save db.mat db
end
%disp(db);

%path2 = 'C:\Users\Mohamed Ashraf\Desktop\9.jpg';
%number = test(path2,trainingData);
%disp(number);

path ='F:\college\third year\second term\Pattern recognition\Data Set (0-9)\3_4.bmp';

number = test(path,db);

disp(number);


