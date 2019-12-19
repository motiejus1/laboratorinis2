clear;
clc;

%4 neuronu daugiasluoksnis perceptronas 1 pirmame sluoksnyje, 2 pasleptame, 1 treciame
%keiciam

%funkcijos x
x = 1/20:1/20:1;
%originali funkcijos reiksme
d =(1 + 0.6*sin((2*pi*x)/0.7)+0.3*sin(2*pi*x))/2;
%Zingsinis
et = 0.2;
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
%apsirasome pradinius duomenis
eklaida = 1;
%naudojama cikle klaidos perkaiciavimui. klaidos skaiciavima keiciam i
%masyva, tiek kiek yra x, keiciam zymejima
e = zeros(1,length(x));

%perceptrono isvesties masyvas
y = zeros(1,length(x));

i = 0;
    while eklaida > 0.00002
        %kadangi x reiksmiu vektorius reikia atlikti perskaiciavimus su visais
        %x
        for iterator = 1:1:length(x)
            i = i+1;
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
        
        %isvedimas klaidos. Naudojama paskutine x reiksmes klaida
        fprintf('e1 = %2.10f   \n',eklaida);
          %skaiciuojamas kvadratinis vidurkis klaidu  
%err1 = ekopija;
        %  err = rms(isejimoklaidumasyvas);
          
         % if (abs(err-ekopija) < 0.00000001)
            
         %   w_11_1 = randn(1);
         %   w_21_1 = randn(1);
         %   b_1_1 = randn(1);
        %    b_2_1 = randn(1);

       %    w_11_2 = randn(1);
       %    w_21_2 = randn(1);
        %    w_12_2 = randn(1);
        %    w_22_2 = randn(1);
       %     b_1_2 = randn(1);
        %    b_2_2 = randn(1);

        %    w_11_3 = randn(1);
        %    w_12_3 = randn(1);
        %    b_1_3 = randn(1);

        %    w_11_4 = randn(1);
          %  b_1_4 = randn(1);
         
     %   end
        
      %  if(abs(err-ekopija) < 0.000000001)  
       %      w_11_1=w_11_1+rand(1)/8;
       %     w_21_1=w_21_1+rand(1)/8;
        %    b_1_1=b_1_1+rand(1)/8;
        %    b_2_1=b_2_1+rand(1)/8;
         %   w_11_2=w_11_2+rand(1)/8;
        %    w_21_2=w_21_2+rand(1)/8;
          %  w_12_2=w_12_2+rand(1)/8;
         %   w_22_2=w_22_2+rand(1)/8;
         %   b_1_2=b_1_2+rand(1)/8;
         %   b_2_2=b_2_2+rand(1)/8;
        %    w_11_3=w_11_3+rand(1)/8;
         %   w_12_3=w_12_3+rand(1)/8;
         %   b_1_3=b_1_3+rand(1)/8;
         %   w_11_4=w_11_4+rand(1)/8;
         %   b_1_4=b_1_4+rand(1)/8;
      %  end  
      
      %  ekopija = err;
      %  errbraizymui(i) = err; 
       %      figure(1);
         %    plot(errbraizymui)
          
      %plot(aproksx,aproksy)
      
      

    end
    %pasibaigus ciklui kai pasiekiams norimas tikslumas.nubraizomas
    plot(y);
    hold on
    plot(d);
    legend('aproksimuota kreive', 'originali kreive');
    %apskaiciuojama vidutine kvadratine paklaida
    immse(y,d)






