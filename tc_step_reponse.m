function output_tc_tf = tc_step_reponse(num1, num2, denum1, denum2)

figure
%constant variable declaration 
I=400;

%time variable for graphing
time_variable = 0:0.5:500;

%transfer function
K = tf([num1, num2],[denum1, denum2]); 
G=tf(1,[I,0,0]);

step_reference_input_theta = ((5*pi)/180);
transfer_function_out_tc = feedback(K,G); 

%recursive function of tf
output_tc_tf= ((step_reference_input_theta*step(transfer_function_out_tc,time_variable))*180)/pi;

%plotting of Tc(t) vs Time
plot(time_variable,output_tc_tf);
xlabel('Time');
ylabel('Value of Tc(t)');
title('Output of Tc(t) vs Time');

end
