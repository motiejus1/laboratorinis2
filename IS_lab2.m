clear;
clc;

%4 neuronu daugiasluoksnis perceptronas 1 pirmame sluoksnyje, 2 pasleptame, 1 treciame


%funkcijos x
x = 1/20:1/20:1;
%originali funkcijos reiksme
d =(1 + 0.6*sin((2*pi*x)/0.7)+0.3*sin(2*pi*x))/2;
%Zingsinis
et = 0.3;
%neuronu svoriai ir b kintamieji. visi parenkami random iki 1. Pakoreguotas
%numeravimas pagal paskaitos uzrasus, nes blogai skaiciavo koeficientus

w_11 = randn(1);
w_12 = randn(1);
w_13 = randn(1);
w_14 = randn(1);

b_11 = randn(1);
b_12 = randn(1);
b_13 = randn(1);
b_14 = randn(1);

w_21 = randn(1);
w_22 = randn(1);
w_23 = randn(1);
w_24 = randn(1);

b_21 = randn(1);

%isirasom koeficientus i masyva jei geri duomenys
A = [w_11 w_12 w_13 w_14 b_11 b_12 b_13 b_14 w_21 w_22 w_23 w_24 b_21 ]

%apsirasome pradinius duomenis
eklaida = 1;

preklaida = 0;
%naudojama cikle klaidos perkaiciavimui. klaidos skaiciavima keiciam i
%masyva, tiek kiek yra x, keiciam zymejima
e = zeros(1,length(x));

%perceptrono isvesties masyvas
y = zeros(1,length(x));
%iteraciju skaitiklis
i = 0;
    %toks skaicius nes ties 0.0000002135 pasiekiamas arciausias rezultatas,
    %%0.0000014858 kitas skaicius
    %vidutine grafiko kvadratine paklaida 0.0032049894  
    while eklaida > 0.0000002145                 %0.0000014859
                    
        %kadangi x reiksmiu vektorius reikia atlikti perskaiciavimus su visais
        i = i+1;
        for iterator = 1:1:length(x)
            %keiciame skaiciavimo logika pagal paskaitos uzrasus, blogi
            %koeficientai. Neuronu isvestys
            y1 = 1/exp(-x(iterator)*w_11-b_11);
            y2 = 1/exp(-x(iterator)*w_12-b_12);
            y3 = 1/exp(-x(iterator)*w_13-b_13);
            y4 = 1/exp(-x(iterator)*w_14-b_14);
            
            %isvest
            y(iterator) = y1*w_21 + y2*w_22+y3 *w_23 + y4 * w_24 + b_21;
            %pildome klaidu masyva
            e(iterator) = d(iterator) - y(iterator);
            
            %svoriu atnaujinimas
            
            w_21 = w_21 + et * e(iterator)* y1;
            w_22 = w_22 + et * e(iterator)* y2;
            w_23 = w_23 + et * e(iterator)* y3;
            w_24 = w_24 + et * e(iterator)* y4;
            
            b_21 = b_21 + et * e(iterator);
            
            %delta skaiciavimas ir pasleptojo sluoksnio svoriu skaiciavimas
            delta1 = y1 * (1 - y1)*e(iterator)*w_21;
            w_11 = w_11 + et * delta1 * x(iterator);
            
            delta2 = y2 * (1 - y2)*e(iterator)*w_22;
            w_12 = w_12 + et * delta2 * x(iterator);
            
            delta3 = y3 * (1 - y3)*e(iterator)*w_23;
            w_13 = w_13 + et * delta3 * x(iterator);

            delta4 = y4 * (1 - y4)*e(iterator)*w_24;
            w_14 = w_14 + et * delta4 * x(iterator);
            
            %koeficientu atnaujinimas
            
            b_11 = b_11 + et * delta1;
            b_12 = b_12 + et * delta2;
            b_13 = b_13 + et * delta3;
            b_14 = b_14 + et * delta4;
            
            %pasiimame paskutinio x klaida. Neskaiciuojame kvadratinio
            %vidurkio nes pailgeja skaiciavimas ir aproksimavimas
            eklaida = abs(e(iterator));
            
        end
        preklaida = eklaida;
        %jei per n iteraciju nepasiekiamas norimas tikslumas,
        %atnaujinami svorio koeficientai
        if(i==50000)
            w_11 = randn(1);
            w_12 = randn(1);
            w_13 = randn(1);
            w_14 = randn(1);

            b_11 = randn(1);
            b_12 = randn(1);
            b_13 = randn(1);
            b_14 = randn(1);

            w_21 = randn(1);
            w_22 = randn(1);
            w_23 = randn(1);
            w_24 = randn(1);

            b_21 = randn(1);
            i=0;
        end    
        %isvedimas klaidos. Naudojama paskutine x reiksmes klaida.
        %isvedamas iteraciju skaicius
        fprintf('e1 = %2.10f iteracija = %2f   \n',eklaida, i);
        
      
      

    end


    %pasibaigus ciklui kai pasiekiams norimas tikslumas.nubraizomas
    plot(y);
    hold on
    plot(d);
    legend('aproksimuota kreive', 'originali kreive');
    %apskaiciuojama vidutine kvadratine paklaida
    fprintf('vidutine kvadratine paklaida = %2.10f   \n',immse(y,d));






