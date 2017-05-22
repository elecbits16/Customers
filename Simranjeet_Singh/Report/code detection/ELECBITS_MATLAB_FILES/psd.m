a =  0 : 0.001 : 1;
t =  0 : 0.001 : 1;
x = 0 : 0.001 : 1;

k = (((a.*a).*t));

v = (((a.*a).*t)/4);

m  = (x.*t);
p  = (pi.*(x.*t));
s  = k.*(sinc(m).*sinc(m)) ; %Polar
u  = v.*(sinc(m).*sinc(m)) ; %Unipolar
g  = k.*(sinc(m/2).*sinc(m/2)).*(sinc(p/2).*sinc(p/2)); % Manchester
h  = k.*(sinc(m).*sinc(m)).*(sinc(p).*sinc(p)); %Bipolar

figure;
plot(m,s);

hold on;
plot(m,u,'r');
  
plot(m,g,'g'); 
plot(m,h,'b');
 
  hold off;

 
 
  
  
 
 
 
