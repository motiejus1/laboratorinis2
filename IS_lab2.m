clear;
clc;

%4 neuronu daugiasluoksnis perceptronas 1 pirmame sluoksnyje, 2 pasleptame, 1 treciame

%funkcijos x
x = 0.1:1/21:1;
%Zingsinis
et = 0.2;

%neuronu svoriai ir b kintamieji. visi parenkami random iki 1

w_11_1 = randn(1);
w_21_1 = randn(1);
b_1_1 = randn(1);
b_2_1 = randn(1);

w_11_2 = randn(1);
w_21_2 = randn(1);
w_12_2 = randn(1);
w_22_2 = randn(1);
b_1_2 = randn(1);
b_2_2 = randn(1);

w_11_3 = randn(1);
w_12_3 = randn(1);
b_1_3 = randn(1);

w_11_4 = randn(1);
b1_4 = randn(1);