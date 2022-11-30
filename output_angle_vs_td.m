function tf_to_deg = output_angle_vs_td(num1,num2,denum1,denum2)

figure
w0= 7.28*10^(-5);
I=400;

time_variable= 0:50:180000;

K= tf([num1, num2],[denum1, denum2]);
G=tf(1,[I,0,0]);

Td_inverse = 10^(-4)*cos(w0*time_variable);

transfer_function_in_td = feedback(G ,K); %The system is defined
tf_in_td_simul= lsim(transfer_function_in_td, Td_inverse, time_variable);
tf_to_deg=(tf_in_td_simul*180)/pi;

plot(time_variable,tf_to_deg);
xlabel('Time');
ylabel('Angle of Output');
title('Output Angle for Response of Td vs Time');

end