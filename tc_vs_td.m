function tf_simul = tc_vs_td(num1, num2, denum1, denum2)

figure
I=400;
w0= 7.28*10^(-5);%In this paragraph, constants are defined.

time_variable= 0:50:180000;

K = tf([num1, num2],[denum1, denum2]); 
G=tf(1,[I,0,0]);
Td_inverse = 10^(-4)*cos(w0*time_variable);


forward_path= series(G,-K);
transfer_function = feedback(forward_path,1,1);
tf_simul= lsim(transfer_function, Td_inverse, time_variable);

plot(time_variable,tf_simul);
xlabel('Time');
ylabel('Tc(t)');
title('Tc in Response of Td vs Time');

end