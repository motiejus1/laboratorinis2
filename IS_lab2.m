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
b_1_4 = randn(1);

%apsirasome pradinius duomenis
eklaida = 1

%reikia ciklo
%skaiciuojame kol klaidos tikimybe 4%
while abs(eklaida) > 0.04
    %kadangi x reiksmiu vektorius reikia atlikti perskaiciavimus su visais
    %x
    for iterator = 1:1:length(x)
            %pirmo niaurono apmokymas

        %Pirmas niauronas
        v_1_1 = x(iterator)*w_11_1+b_1_1
        v_2_1 = x(iterator)*w_21_1+b_2_1
        y_1_1 = 1/(1+exp(-v_1_1))
        y_2_1 = 1/(1+exp(-v_2_1))
    end
    
end





