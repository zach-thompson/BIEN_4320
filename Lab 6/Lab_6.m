%% Lab 6 - Absporbtion Spectroscopy

a = readtable("Ref_A.csv");
a = a{:,:};
b = readtable("Ref_B.csv");
b = b{:,:};
c = readtable("Ref_C.csv");
c = c{:,:};
ts_1 = readtable("TS_1.csv");
ts_1 = ts_1{:,:};
ts_2 = readtable("TS_2.csv");
ts_2 = ts_2{:,:};
ts_3 = readtable("TS_3.csv");
ts_3 = ts_3{:,:};

file_a = fopen('Ref_A.txt', 'wt');
file_b = fopen('Ref_B.txt', 'wt');
file_c = fopen('Ref_C.txt', 'wt');
file_ts1 = fopen('TS_1.txt', 'wt');
file_ts2 = fopen('TS_2.txt', 'wt');
file_ts3 = fopen('TS_3.txt', 'wt');
for i=1:561
    fprintf(file_a, '%f %f\r\n', a(i,1), a(i,2));
    fprintf(file_b, '%f %f\r\n', b(i,1), b(i,2));
    fprintf(file_c, '%f %f\r\n', c(i,1), c(i,2));
    fprintf(file_ts1, '%f %f\r\n', ts_1(i,1), ts_1(i,2));
    fprintf(file_ts2, '%f %f\r\n', ts_2(i,1), ts_2(i,2));
    fprintf(file_ts3, '%f %f\r\n', ts_3(i,1), ts_3(i,2));
end 
fclose(file_a);