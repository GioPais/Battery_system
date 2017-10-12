%GRAFICOS CORRIENTE Y VOLTAGE L_ARM
filename = 'D:\Gio\Bender\proyecto_baterias_2017\Datos_11-10\l_arm_11_10_test3.txt';
delimiter = ';';

formatSpec = '%*s%f%*s%*s%*s%[^\n\r]';
fileID = fopen(filename,'r');

dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);

i = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;
%------------------------------------------------------------------------
filename = 'D:\Gio\Bender\proyecto_baterias_2017\Datos_11-10\voltage_data.txt';
delimiter = ' ';

formatSpec = '%f%*s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
v = dataArray{:, 1};
clearvars filename delimiter formatSpec fileID dataArray ans;
%------------------------------------------------------------------------
%GRAFICOS CORRIENTE Y VOLTAGE L_ARM
offset=1000 %Ajuste en 1000
ajusteY=0; %Usar 14 para comparar
v=v-ajusteY;
t=[0:33/133398:33];
t2=[0:33/(31263-offset):33];

v2=1:1:31263-offset;
%Ajuste Voltage
for j=1:(31264-offset)
v2(j)=v(j+offset);
end
%-------------Down-Sampling--------------------------------------------
%----------------------------------------------------------------------
clf;
hold on
plot(t,i,'b')
plot(t2,v2,'r')
