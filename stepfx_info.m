function f = stepfx_info(num1, num2, denum1, denum2)

%definition of variables
w0= 7.28*10^(-5);%In this paragraph, constants are defined.
square_of_w0= w0^(2);
I=400;

%transfer function
K= tf([num1, num2],[denum1, denum2]);
Td= 10^(-4)*tf([1, 0],[1, 0, square_of_w0]); %individual blocks are defined.
G=tf(1,[I,0,0]);

transform_K_Td = K + Td; 
forward_path = series(transform_K_Td, G); 
transfer_function = feedback(forward_path, 1); 

f = transfer_function;

end