%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [us]=uni_scalar(sig,A,R)
    
    L=2.^(R+1);
    D=(2*A)./L;

  for i =1: length(sig)
  us(i)= D*sign(sig(i)).*floor(abs(sig(i))./D +1/2);
  end
  
end
