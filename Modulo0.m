clear all; close all; clc

Pun_F1=input('Ingrese los puntos finales de cada tramo \n'); 
       t_1c=length(Pun_F1); 
       Pun_F2=Pun_F1'; 
       Pun_I1=zeros(t_1c,1); 
       for k_0=1:t_1c-1 
           Pun_I1(k_0+1,1)=Pun_F2(k_0,1); 
       end 
       Puntos=[Pun_I1';Pun_F2']'; 
       
filas=t_1c; 
Puntos_Iniciales=Puntos(:,1); 
Puntos_Finales=Puntos(:,2); 
Inercia=input('Ingrese los Momentos de Inercia \n');  
Inercia=Inercia'; 
Young=input('Ingrese los Modulos de Young \n');  
Young=Young'; 
Producto=Inercia.*Young; 
Cortantes_0=input('Ingrese las ecuaciones del Esfuerzo Cortante \n');  
Cortantes_0=Cortantes_0';
Cortantes_0=str2sym(Cortantes_0);
Momentos_0=input('Ingrese los Momentos \n'); 
Momentos_0=Momentos_0';
Punt_i=Puntos_Iniciales; 
Punt_f=Puntos_Finales;
Mostrar={Pun_I1;Pun_F1';Inercia;Young;Cortantes_0;Momentos_0};
celldisp(Mostrar);

disp('¿ Que clase de Viga va a resolver ?')
BeamCase=input('Es una viga ''Determinada'' o una viga ''Indeterminada'' \n','s')
switch BeamCase
    case 'Determinada'
disp('Defina el tipo de caso determinado')
t_0=input('Es una Viga ''Simplemente_Apoyada'' , ''Apoyada_Voladizo'' o ''Empotrada_Voladizo'' \n','s');
switch t_0
    
    case 'Simplemente_Apoyada'
        
Puntos_Apoyo=[1,filas+1]; 

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1; 
Integral_2=int(Ecuaciones_1,'x'); 
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2; 

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
  
Sistema_3(1,1)=Ecuaciones_1b(1);
Sistema_3(2,1)=Ecuaciones_2b(filas);

Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):2*filas)=Sistema_3;


%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F); 
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2)

%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 

%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(Ecuaciones_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(Ecuaciones_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 

    case 'Apoyada_Voladizo'
        
Puntos_Apoyo=input('Ingrese los puntos de apoyo'); 

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1; 

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1; 
Integral_2=int(Ecuaciones_1,'x'); 
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2; 

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
cum13=0;
for p=Puntos_Apoyo 
   Ecuaciones_3a=Ecuaciones_1b(p);
   cum13=cum13+1;
   Sistema_3(cum13,1)=Ecuaciones_3a;
end 
Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):2*filas)=Sistema_3;


%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F); 
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2)

%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 

%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(Ecuaciones_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(Ecuaciones_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 

    case 'Empotrada_Voladizo'
       
Puntos_Apoyo=[1];

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1; 

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1; 
Integral_2=int(Ecuaciones_1,'x'); 
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2; 

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
Sistema_3(1,1)=Ecuaciones_1a(Puntos_Apoyo);
Sistema_3(2,1)=Ecuaciones_1b(Puntos_Apoyo);

Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):2*filas)=Sistema_3;


%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F); 
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2)

%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 

%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(Ecuaciones_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(Ecuaciones_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(Ecuaciones_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 
 
    otherwise
        disp('AEA mongolx3')
end

case 'Indeterminada'
disp('Defina el tipo de caso indeterminado')
t_0=input('Es una Viga ''Apoyada_Apoyada'' , ''Empotrada_Apoyada'' o ''Empotrada_Empotrada'' ','s');
switch t_0
    case 'Apoyada_Apoyada'
        
Puntos_Apoyo=input('Ingrese la posicion de los puntos de apoyo'); 
Tam_Puntoyo=length(Puntos_Apoyo);
Sum_Fuerzas=input('Ingrese la Ecuacion de Sumatoria de Fuerzas');
Sum_Fuerzas=str2sym(Sum_Fuerzas);
Sum_Momentos=input('Ingrese la Ecuacion de Sumatoria de Momentos');
Sum_Momentos=str2sym(Sum_Momentos);

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4),const4(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4),const5(k4+1)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1;

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1;
Integral_2=int(Ecuaciones_1,'x');
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2;

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
cum13=0;

for p=Puntos_Apoyo 
   Ecuaciones_3a=Ecuaciones_1b(p);
   cum13=cum13+1;
   Sistema_3(cum13,1)=Ecuaciones_3a;
end 

answer=input('Presenta Apoyo Final','s'); 
if double(answer)==[115 105]
   Ecua_Adicional=Ecuaciones_2b(filas);
   Sistema_3(cum13+1,1)=Ecua_Adicional;
   Tam_Puntoyo=Tam_Puntoyo+1;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
elseif double(answer)==[110 111] 
   Sistema_3=Sistema_3;
   Tam_Puntoyo=Tam_Puntoyo;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
else
    disp('es ''si'' o ''no'' mongolaso')
end

Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):(2*filas-1)+(Tam_Puntoyo-1))=Sistema_3;
Sistema_F(1,length(Sistema_F)+1)=Sum_Fuerzas;
Sistema_F(1,length(Sistema_F)+1)=Sum_Momentos;
    
%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F);
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2);

remplazo1=const6
remplazo2=rptas_3(2*filas+1:2*filas+Tam_Puntoyo)


%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 
cum14=0;
for q1=1:filas 
   for q2=1:length(remplazo2) 
   Ec_3=subs(Ecuaflex1(q1),{remplazo1(q2)},{remplazo2(q2)});
   Ecuaflex1(q1)=Ec_3;
   end
   cum14=cum14+1; 
   Ecuaflex1(cum14,1)=Ecuaflex1(q1);
end 
Ecuaflex1;
%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

EcuaMom_0=diff(EcuaPen_0);
cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(EcuaMom_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(EcuaMom_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 

    case 'Empotrada_Apoyada'
        
Puntos_Apoyo=input('Ingrese la posicion de los puntos de apoyo'); 
Tam_Puntoyo=length(Puntos_Apoyo);
Sum_Fuerzas=input('Ingrese la Ecuacion de Sumatoria de Fuerzas');
Sum_Fuerzas=str2sym(Sum_Fuerzas);
Sum_Momentos=input('Ingrese la Ecuacion de Sumatoria de Momentos');
Sum_Momentos=str2sym(Sum_Momentos);

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4),const4(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4),const5(k4+1)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1;

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1;
Integral_2=int(Ecuaciones_1,'x');
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2;

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
cum13=0;

for p=Puntos_Apoyo 
   Ecuaciones_3a=Ecuaciones_1b(p);
   cum13=cum13+1;
   Sistema_3(cum13,1)=Ecuaciones_3a;
end 

answer=input('Presenta Apoyo Final','s'); 
if double(answer)==[115 105]
   Ecua_Adicional=Ecuaciones_2b(filas);
   Sistema_3(cum13+1,1)=Ecua_Adicional;
   Tam_Puntoyo=Tam_Puntoyo+1;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
elseif double(answer)==[110 111] 
   Sistema_3=Sistema_3;
   Tam_Puntoyo=Tam_Puntoyo;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
else
    disp('es ''si'' o ''no'' mongolaso')
end

Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):(2*filas-1)+(Tam_Puntoyo-1))=Sistema_3;
Sistema_F(1,length(Sistema_F)+1)=Sum_Fuerzas;
Sistema_F(1,length(Sistema_F)+1)=Sum_Momentos;
    
%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F);
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2)

remplazo1=const6
remplazo2=rptas_3(2*filas+1:2*filas+Tam_Puntoyo)


%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 
cum14=0;
for q1=1:filas 
   for q2=1:length(remplazo2) 
   Ec_3=subs(Ecuaflex1(q1),{remplazo1(q2)},{remplazo2(q2)});
   Ecuaflex1(q1)=Ec_3;
   end
   cum14=cum14+1 
   Ecuaflex1(cum14,1)=Ecuaflex1(q1)
end 
Ecuaflex1;
%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

EcuaMom_0=diff(EcuaPen_0);
cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(EcuaMom_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(EcuaMom_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 

    case 'Empotrada_Empotrada'
        

Puntos_Apoyo=input('Ingrese la posicion de los puntos de apoyo'); 
Tam_Puntoyo=length(Puntos_Apoyo);
Sum_Fuerzas=input('Ingrese la Ecuacion de Sumatoria de Fuerzas');
Sum_Fuerzas=str2sym(Sum_Fuerzas);
Sum_Momentos=input('Ingrese la Ecuacion de Sumatoria de Momentos');
Sum_Momentos=str2sym(Sum_Momentos);

%   GENERACION DE LAS ECUACIONES DE MOMENTO 
cum9=0; 
for k1=1:filas 
   vari4=['f',num2str(k1)]; 
   cons4=str2sym(vari4); 
   cum9=cum9+1; 
   const4(cum9,1)=cons4; 
end 
const4; 
cum10=0; 
for k2=1:filas+1 
   vari5=['b',num2str(k2)]; 
   cons5=str2sym(vari5); 
   cum10=cum10+1; 
   const5(cum10,1)=cons5; 
end 
const5(1)=0; 

Integral_0=int(Cortantes_0,'x'); 
cum11=0; 
for k3=1:filas 
   Cortantes_1i=subs(Integral_0(k3),'x',Punt_i(k3)); 
   Cortantes_1f=subs(Integral_0(k3),'x',Punt_f(k3)); 
   cum11=cum11+1; 
   Cortantes_2i(cum11,1)=Cortantes_1i; 
   Cortantes_2f(cum11,1)=Cortantes_1f; 
end 
cum12=0; 
for k4=1:filas 
Cortantes_3(k4,1)=Cortantes_2i(k4)+Momentos_0(k4)+const4(k4)+const5(k4); 
const4(k4)=solve(Cortantes_3(k4),const4(k4)); 
Cortantes_4(k4,1)=Cortantes_2f(k4)+const4(k4)+const5(k4+1); 
const5(k4+1)=solve(Cortantes_4(k4),const5(k4+1)); 
cum12=cum12+1; 
Constantes_1(cum12,1)=const4(k4); 
end 
Ecuaciones_0=Integral_0+Constantes_1;

%   GENERACION DE LAS PRIMERAS ECUACIONES 

Integral_1=int(Ecuaciones_0,'x'); 
cum1=0; 
for k=1:2:(filas*2)-1 
   vari1=['c',num2str(k)]; 
   cons1=str2sym(vari1); 
   cum1=cum1+1; 
   const1(cum1,1)=cons1; 
end 
const1; 
Ecuaciones_1=Integral_1+const1;
Integral_2=int(Ecuaciones_1,'x');
cum2=0; 
for n=2:2:(filas*2) 
   vari2=['c',num2str(n)]; 
   cons2=str2sym(vari2); 
   cum2=cum2+1; 
   const2(cum2,1)=cons2; 
end 
const2; 
Ecuaciones_2=Integral_2+const2;

%   EVALUACION DE LAS ECUACIONES EN LAS FRONTERAS 

for t=1:filas 
   res_1a=subs(Ecuaciones_1(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1a(t,1)=res_1a; 
   res_1b=subs(Ecuaciones_2(t),'x',Puntos_Iniciales(t)); 
   Ecuaciones_1b(t,1)=res_1b; 
   res_2a=subs(Ecuaciones_1(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2a(t,1)=res_2a; 
   res_2b=subs(Ecuaciones_2(t),'x',Puntos_Finales(t)); 
   Ecuaciones_2b(t,1)=res_2b; 
end 

%   DIVISION DE LAS ECUACIONES EVALUADAS CON EL PRODUCTO DE E.I. 

Ecuaciones_1a; 
Ecuaciodiv_1a=Ecuaciones_1a./Producto; 
Ecuaciones_1b; 
Ecuaciodiv_1b=Ecuaciones_1b./Producto; 
Ecuaciones_2a; 
Ecuaciodiv_2a=Ecuaciones_2a./Producto; 
Ecuaciones_2b; 
Ecuaciodiv_2b=Ecuaciones_2b./Producto; 

%   GENERACION DEL SISTEMA DE ECUACIONES(PENDIENTE,DEFORMACION Y PUNTOS DE  
%   APOYO) 

Sistema_1=Ecuaciodiv_1a(2:filas,1)-Ecuaciodiv_2a(1:filas-1,1);
Sistema_2=Ecuaciodiv_1b(2:filas,1)-Ecuaciodiv_2b(1:filas-1,1);
cum13=0;

for p=Puntos_Apoyo 
   Ecuaciones_3a=Ecuaciones_1b(p);
   cum13=cum13+1;
   Sistema_3(cum13,1)=Ecuaciones_3a;
end 

answer=input('Presenta Apoyo Final','s'); 
if double(answer)==[115 105]
   Ecua_Adicional=Ecuaciones_2b(filas);
   Sistema_3(cum13+1,1)=Ecua_Adicional;
   Tam_Puntoyo=Tam_Puntoyo+1;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
elseif double(answer)==[110 111] 
   Sistema_3=Sistema_3;
   Tam_Puntoyo=Tam_Puntoyo;
   cum13=0; 
for k5=2*filas+1:2*filas+Tam_Puntoyo 
   vari6=['c',num2str(k5)]; 
   cons6=str2sym(vari6); 
   cum13=cum13+1; 
   const6(cum13,1)=cons6; 
end
else
    disp('es ''si'' o ''no'' mongolaso')
end

Sistema_F(1,1:filas-1)=Sistema_1;
Sistema_F(1,filas:2*(filas-1))=Sistema_2;
Sistema_F(1,(2*filas-1):(2*filas-1)+(Tam_Puntoyo-1))=Sistema_3;
Sistema_F(1,length(Sistema_F)+1)=Sum_Fuerzas;
Sistema_F(1,length(Sistema_F)+1)=Sum_Momentos;
    
%   RESOLUCION DEL SISTEMA DE ECUACIONES 

rptas_0=solve(Sistema_F);
rptas_1=struct2cell(rptas_0); 
rptas_2=cell2sym(rptas_1); 
rptas_3=double(rptas_2)

remplazo1=const6
remplazo2=rptas_3(2*filas+1:2*filas+Tam_Puntoyo)


%   SE REEMPLAZAN EL VALOR DE LAS CONSTANTES EN SUS RESPECTIVAS ECUACIONES 
%   INICIALES DE DEFORMACION 

cum3=0; 
for z=1:(filas*2) 
   vari3=['c',num2str(z)]; 
   cons3=str2sym(vari3); 
   cum3=cum3+1; 
   const3(cum3,1)=cons3; 
end 
cum4=0; 
for q=1:filas 
   Ec_2=subs(Ecuaciones_2(q),{const3((q*2)-1),const3(q*2)},{rptas_3((q*2)-1),rptas_3(q*2)}); 
   cum4=cum4+1; 
   Ecuaflex1(cum4,1)=Ec_2; 
end 
cum14=0;
for q1=1:filas 
   for q2=1:length(remplazo2) 
   Ec_3=subs(Ecuaflex1(q1),{remplazo1(q2)},{remplazo2(q2)});
   Ecuaflex1(q1)=Ec_3;
   end
   cum14=cum14+1 
   Ecuaflex1(cum14,1)=Ecuaflex1(q1)
end 
Ecuaflex1;
%   DIVISION DE LAS PRIMERAS ECUACIONES DE DEFORMACION CON EL PRODUCTO E.I. 

EcuaFlex=Ecuaflex1./Producto

%   EVALUACION DE LAS ECUACIONES GENERADAS DE DEFORMACION EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum5=0; 
for u=1:filas 
   Eval_1=linspace(Punt_i(u),Punt_f(u),100); 
   EcuaEval_1a=subs(EcuaFlex(u),'x',Eval_1);
   EcuaEval_1a=double(EcuaEval_1a); 
   EcuaEval_1b=max(EcuaEval_1a); 
   EcuaEval_1c=min(EcuaEval_1a); 
   cum5=cum5+1; 
   MaxEval_1(cum5,1)=EcuaEval_1b; 
   MinEval_1(cum5,1)=EcuaEval_1c; 
end 
MaxY=max(MaxEval_1); 
MinY=min(MinEval_1); 

%   GENERACION DE LA GRAFICA DE DEFORMACION 

for c=1:filas 
   subplot(2,2,4),ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
grid on 

%   EXPORTACION DE LAS ECUACIONES DE  DEFORMACION A UNA TABLA 

%EcuaFlex1 = arrayfun(@char, EcuaFlex, 'uniform', 0); 
%set(handles.uitable11,'data',EcuaFlex1); 

%   GENERACION DE LAS ECUACIONES DE PENDIENTE 

EcuaPen_0=diff(EcuaFlex); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE PENDIENTE EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum6=0; 
for u1=1:filas 
   Eval_2=linspace(Punt_i(u1),Punt_f(u1),100); 
   EcuaEval_2a=subs(EcuaPen_0(u1),'x',Eval_2); 
   EcuaEval_2a=double(EcuaEval_2a); 
   EcuaEval_2b=max(EcuaEval_2a); 
   EcuaEval_2c=min(EcuaEval_2a); 
   cum6=cum6+1; 
   MaxEval_2(cum6,1)=EcuaEval_2b; 
   MinEval_2(cum6,1)=EcuaEval_2c; 
end 
MaxY1=max(MaxEval_2); 
MinY1=min(MinEval_2); 

%   GENERACION DE LA GRAFICA DE PENDIENTES 

for c1=1:filas 
   subplot(2,2,2),ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE PENDIENTE A UNA TABLA 

%EcuaPen_1 = arrayfun(@char, EcuaPen_0, 'uniform', 0); 
%set(handles.uitable10,'data',EcuaPen_1); 

%   ECUACIONES DE MOMENTO 

EcuaMom_0=diff(EcuaPen_0);
cum7=0; 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE MOMENTOS EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

for u2=1:filas 
   Eval_3=linspace(Punt_i(u2),Punt_f(u2),100); 
   EcuaEval_3a=subs(EcuaMom_0(u2),'x',Eval_3); 
   EcuaEval_3a=double(EcuaEval_3a); 
   EcuaEval_3b=max(EcuaEval_3a); 
   EcuaEval_3c=min(EcuaEval_3a); 
   cum7=cum7+1; 
   MaxEval_3(cum7,1)=EcuaEval_3b; 
   MinEval_3(cum7,1)=EcuaEval_3c; 
end 
MaxY2=max(MaxEval_3); 
MinY2=min(MinEval_3); 

%   GENERACION DE LA GRAFICA DE MOMENTOS 

for c2=1:filas 
   subplot(2,2,3),ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE MOMENTOS A UNA TABLA 

%Ecuaciones_0a = arrayfun(@char, Ecuaciones_0, 'uniform', 0); 
%set(handles.uitable9,'data',Ecuaciones_0a); 

%   GENERACION DE LAS ECUACIONES DE CORTANTES 

EcuaCor_0=diff(EcuaMom_0); 

%   EVALUACION DE LAS ECUACIONES GENERADAS DE CORTANTES EN CIEN PUNTOS DE  
%   CADA TRAMO,  PARA DETERMINAR LOS VALORES MAXIMOS Y MINIMOS 

cum8=0; 
for u3=1:filas 
   Eval_4=linspace(Punt_i(u3),Punt_f(u3),100); 
   EcuaEval_4a=subs(EcuaCor_0(u3),'x',Eval_4); 
   EcuaEval_4a=double(EcuaEval_4a); 
   EcuaEval_4b=max(EcuaEval_4a); 
   EcuaEval_4c=min(EcuaEval_4a); 
   cum8=cum8+1; 
   MaxEval_4(cum8,1)=EcuaEval_4b; 
   MinEval_4(cum8,1)=EcuaEval_4c; 
end 
MaxY3=max(MaxEval_4); 
MinY3=min(MinEval_4); 

%   GENERACION DE LA GRAFICA DE CORTANTES 

for c3=1:filas 
   subplot(2,2,1),ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
grid on 

%   EXPORTACION DE LAS ECUACIONES DE CORTANTES A UNA TABLA 

%EcuaCor_1 = arrayfun(@char, EcuaCor_0, 'uniform', 0); 
%set(handles.uitable8,'data',EcuaCor_1); 

figure('Name','Esfuerzos Cortantes','NumberTitle','off');
for c3=1:filas 
   ezplot(EcuaCor_0(c3),[Punt_i(c3),Punt_f(c3)]),title('Esfuerzos Cortantes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY3,MaxY3]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Momentos Flectores','NumberTitle','off');
for c2=1:filas 
   ezplot(EcuaMom_0(c2),[Punt_i(c2),Punt_f(c2)]),title('Momentos Flectores'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY2,MaxY2]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Pendientes','NumberTitle','off');
for c1=1:filas 
   ezplot(EcuaPen_0(c1),[Punt_i(c1),Punt_f(c1)]),title('Pendientes'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY1,MaxY1]);
set(gca,'Color','k','LineWidth',3)
grid on 
figure('Name','Deformaciones','NumberTitle','off');
for c=1:filas 
   ezplot(EcuaFlex(c),[Punt_i(c),Punt_f(c)]),title('Deformaciones'); 
   hold on 
end 
axis([Punt_i(1),Punt_f(filas),MinY,MaxY]); 
set(gca,'Color','k','LineWidth',3)
grid on 

    otherwise
        disp('AEA mongolx3')
end

otherwise
        disp('AEA mongolx3')
end

