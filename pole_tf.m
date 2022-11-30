function pole_value = pole_tf(num1, num2, denum1, denum2) %declaration of the function pole

  %Definition of constant values

  %Angular velocity of satellite
  w0 = 7.28*10^(-5);
  square_of_w0 = w0^(2);

  %Inertial momentum of the satellite
  I = 400;
  %Definition of each element of the circuit
  Td = tf([1, 0], [1, 0, square_of_w0])*10^(-4) ;  %This defines variable Td(s)
  K = tf([num1, num2], [denum1, denum2])  ;        %This defines controller K
  G = tf(1, [I, 0, 0])  ;                          %This defines variable G(s)

  transform_K_Td = K + Td; 
  forward_path = series(transform_K_Td, G); 
  transfer_function = feedback(forward_path, 1); 
 
  %Calculation of the poles
  pole_value = pole(transfer_function);

  end
