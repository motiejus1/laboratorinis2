clear;
clc;

%4 neuronu daugiasluoksnis perceptronas 1 pirmame sluoksnyje, 2 pasleptame, 1 treciame

%funkcijos x
x = 1/20:1/20:1;
%Zingsinis
et = 0.02;

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

%laikini kintamieji svoriu perskaiciavimui

%apsirasome pradinius duomenis
eklaida = 1;
%naudojama cikle klaidos perkaiciavimui
ekopija = eklaida;
figure

aproksx = [];
aproksy = [];
%reikia ciklo
%skaiciuojame kol klaidos tikimybe 4%
i = 0;
    while abs(eklaida) > 0.04
        %kadangi x reiksmiu vektorius reikia atlikti perskaiciavimus su visais
        %x
        for iterator = 1:1:length(x)
            i = i+1;
            %1 neur.
            v_1_1 = x(iterator)*w_11_1+b_1_1;
            v_2_1 = x(iterator)*w_21_1+b_2_1;
            y_1_1 = 1/(1+exp(-v_1_1));
            y_2_1 = 1/(1+exp(-v_2_1));

            %2 neur.
            v_1_2 = y_1_1*w_11_2+y_1_1*w_12_2+b_1_2;
            v_2_2 = y_2_1*w_21_2+y_2_1*w_22_2+b_1_2;
            y_1_2 = 1/(1+exp(-v_1_2));
            y_2_2 = 1/(1+exp(-v_2_2));

            %3 neur.
            v_1_3 = y_1_2*w_11_3+y_2_2*w_12_3+b_1_3;
            y_1_3 = 1/(1+exp(-(v_1_3)));



            %4 neur.
            v_1_4 = y_1_3*w_11_4;
            y_1_4 = v_1_4; %isvestis
            
            %klaidos skaiciavimas kiekvienai y reiksmei
            dalinefunkcija = (1 + 0.6*sin(2*pi*x(iterator)/0.7)+0.3*sin(2*pi*x(iterator)))/2;
            eklaida = dalinefunkcija - y_1_4;
            
            %atnaujiname svorius
            %naudojame laikinuosius kintamuosius, nes skaiciavimams
            %reikalingos praeitos reiksmes
            %d - lokalioji klaida
            d_1_4 = eklaida;
            d_1_3 = y_1_3*(1-y_1_3)*d_1_4*w_11_4;
            d_1_2 = y_1_2*(1-y_1_2)*(d_1_3*w_11_3);
            d_2_2 = y_2_2*(1-y_2_2)*(d_1_3*w_12_3); 
            d_1_1 = y_1_1*(1-y_1_1)*(d_1_2*w_11_2 + d_2_2*w_21_2);
            d_2_1 = y_1_1*(1-y_1_1)*(d_1_2*w_12_2 + d_2_2*w_22_2);
            
            %perskaiciuoti koeficientai
            laik_w_11_4 = w_11_4 + et*d_1_4*y_1_3;
            laik_b_1_4 = b_1_4 + et*d_1_4;

            laik_w_11_3 = w_11_3 + et*d_1_3*y_1_2;
            laik_w_12_3 = w_12_3 + et*d_1_3*y_2_2;
            laik_b_1_3 = b_1_3 + et*d_1_3;

            laik_w_11_2 = w_11_2 + et*d_1_2*y_1_1;
            laik_w_12_2 = w_12_2 + et*d_1_2*y_2_1;
            laik_b_1_2 = b_1_2 + et*d_1_2;
            laik_b_2_2 = b_2_2 + et*d_1_2; 
 
            laik_w_21_2 = w_21_2 + et*d_2_2*y_1_1;
            laik_w_22_2 = w_22_2 + et*d_2_2*y_2_1;
            laik_b_1_1 = b_1_1 + et*d_2_2;
            laik_b_2_1 = b_2_1 + et*d_2_2;

            laik_w_11_1 = w_11_1 + et*d_1_1*x(iterator);

            laik_w_21_1 = w_21_1 + et*d_2_1*x(iterator);
          
            %laikinosios reiksmes priskiriamos tikrosioms
            w_11_1=laik_w_11_1;
            w_21_1=laik_w_21_1;
            b_1_1=laik_b_1_1;
            b_2_1=laik_b_2_1;
            w_11_2=laik_w_11_2;
            w_21_2=laik_w_21_2;
            w_12_2=laik_w_12_2;
            w_22_2=laik_w_22_2;
            b_1_2=laik_b_1_2;
            b_2_2=laik_b_2_2;
            w_11_3=laik_w_11_3;
            w_12_3=laik_w_12_3;
            b_1_3=laik_b_1_3;
            w_11_4=laik_w_11_4;
            b_1_4=laik_b_1_4;
            
            aproksx(iterator) = iterator;
            aproksy(iterator) = y_1_4;
            realy(iterator) = dalinefunkcija;
            isejimoklaidumasyvas(iterator) = eklaida;
            
        end
           
          %skaiciuojamas vidurkis klaidu  
err1 = ekopija;
          err = rms(isejimoklaidumasyvas);
          
          if (abs(err-ekopija) < 0.0000001)
            
          %  w_11_1 = randn(1);
          %  w_21_1 = randn(1);
          %  b_1_1 = randn(1);
          %  b_2_1 = randn(1);

         %   w_11_2 = randn(1);
         %   w_21_2 = randn(1);
         %   w_12_2 = randn(1);
         %   w_22_2 = randn(1);
         %   b_1_2 = randn(1);
         %   b_2_2 = randn(1);

         %   w_11_3 = randn(1);
         %   w_12_3 = randn(1);
          %  b_1_3 = randn(1);

         %   w_11_4 = randn(1);
          %  b_1_4 = randn(1);
           w_11_1=w_11_1+rand(1)/12;
            w_21_1=w_21_1+rand(1)/12;
            b_1_1=b_1_1+rand(1)/12;
            b_2_1=b_2_1+rand(1)/12;
            w_11_2=w_11_2+rand(1)/12;
            w_21_2=w_21_2+rand(1)/12;
            w_12_2=w_12_2+rand(1)/12;
            w_22_2=w_22_2+rand(1)/12;
            b_1_2=b_1_2+rand(1)/12;
            b_2_2=b_2_2+rand(1)/12;
            w_11_3=w_11_3+rand(1)/12;
            w_12_3=w_12_3+rand(1)/12;
            b_1_3=b_1_3+rand(1)/12;
            w_11_4=w_11_4+rand(1)/12;
            b_1_4=b_1_4+rand(1)/12;
           
        end
        
        if(abs(err-ekopija) < 0.000000001)  
             w_11_1=w_11_1+rand(1)/8;
            w_21_1=w_21_1+rand(1)/8;
            b_1_1=b_1_1+rand(1)/8;
            b_2_1=b_2_1+rand(1)/8;
            w_11_2=w_11_2+rand(1)/8;
            w_21_2=w_21_2+rand(1)/8;
            w_12_2=w_12_2+rand(1)/8;
            w_22_2=w_22_2+rand(1)/8;
            b_1_2=b_1_2+rand(1)/8;
            b_2_2=b_2_2+rand(1)/8;
            w_11_3=w_11_3+rand(1)/8;
            w_12_3=w_12_3+rand(1)/8;
            b_1_3=b_1_3+rand(1)/8;
            w_11_4=w_11_4+rand(1)/8;
            b_1_4=b_1_4+rand(1)/8;
        end  
      
        ekopija = err;
        errbraizymui(i) = err; 
             figure(1);
             %plot(errbraizymui)
             fprintf('err = %2.10f   \n',err);
      %plot(aproksx,aproksy)
      
      

    end






