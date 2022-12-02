clc;
clear;
close all;

if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end

port = 'COM3'; 
Baud_Rate = 9600;
Data_Bits = 8;
Stop_Bits = 1;
%serial object
s = serial('COM3', 'BaudRate', Baud_Rate,...
'DataBits',Data_Bits,'StopBits', Stop_Bits);
fopen(s); %open serial port 

%creating array
y = [];
t =[]; 

for i = 1:350
    data=str2double(fscanf(s)); 
    if data > 400 
        data=400;
    end
    y = [y data];
    t = [t i];

    %plotting original signal
    subplot (2,1,1)
    plot(t,y)
    ylim([20,30])
    xlim([0,350])
    yticks(20:2:30)
    ylabel('Distance (cm)')
    xlabel('Time (s)')
    title('Original signal')
   
    %moving average filter designing part
    windowsize = 15; 
    t2 = ones(1,windowsize); 
    num = (1/windowsize)*t2; %numerator of transfer function
    den = [1]; %denominator of transfer function
    Y = filter(num,den,y);
    
    %plotting filtered signal
    subplot (2,1,2)
    plot(Y,'r')
    title('filtered signal')
    ylim([20,30])
    xlim([0,350])
    ylabel('Distance (cm)')
    xlabel('Time (s)')
    yticks(20:2:30)
    pause(0.01) 
end