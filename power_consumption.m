function power_cons = power_consumption(num1, num2, denum1, denum2)   %Declaration of function for energy consumption

  %Definition of constant values
  %Angular velocity of satellite
  w0 = 7.28*10^(-5);
  square_of_w0 = w0^(2);

  %Inertial momentum of the satellite
  I = 400;

  %Definition of each element of the circuit
  K = tf([num1, num2], [denum1, denum2]);        %This defines controller K
  Td = tf([1, 0], [1, 0, square_of_w0])*10^(-4);   %This defines variable Td(s)
  G = tf(1, [I, 0, 0]);                            %This defines variable G(s)

  %transfer function
  transform_K_Td = K + Td; 
  forward_path = series(transform_K_Td, G); 
  transfer_function = feedback(forward_path, 1); 
  
  time_variable = 0:50:10000;
  
  step_reference_input = ((5*pi)/180);
  output_tf = ((step_reference_input*step(transfer_function,time_variable))*180)/pi;
  output_tf_position=abs(output_tf);
  power_cons =(sum(output_tf_position))/2000;
  
end
