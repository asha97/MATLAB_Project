function output_tf = output_angle(num1,num2,denum1,denum2)

figure

%definition of variables
w0= 7.28*10^(-5);%In this paragraph, constants are defined.
square_of_w0= w0^(2);
I=400;

time_variable= 0:0.5:500;

%transfer function
K= tf([num1, num2],[denum1, denum2]);
Td= 10^(-4)*tf([1, 0],[1, 0, square_of_w0]); %individual blocks are defined.
G=tf(1,[I,0,0]);

transform_K_Td = K + Td; 
forward_path = series(transform_K_Td, G); 
transfer_function = feedback(forward_path, 1); 

step_reference_input = ((5*pi)/180);
output_tf = ((step_reference_input*step(transfer_function,time_variable))*180)/pi;

%plotting of the tf of output angle 
plot(time_variable,output_tf);
xlabel('Time');
ylabel('Angle of pitch output');
title('Output Angle for 5deg Step Response vs Time');

end