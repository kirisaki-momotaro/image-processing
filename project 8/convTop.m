function [convolution] = convTop(image,kernel)
    
    [xi,yi]=size(image);
    [xk,yk]=size(kernel);
    
    %size of output
    x=xi+xk-1;
    y=yi+yk-1;
    
        
    padKernel1 = padarray(kernel,[x-xk,0],'pre');
    padKernel = padarray(padKernel1,[0,y-yk],'post')
    
    [x,y]=size(padKernel);
    
    zero=zeros(1,x)
    
        
    for i=1:x
        h{i}=padKernel(i,:);
        %a=h{i};
        %a=a.';
        %h{i}=a
        toep{i}=toeplitz(h{i},zero)
        
    end
    toeplitz([toep{1} toep{2} toep{3}]);
    
%     Finaltoep=zeros(1,x+1)
%     for i=1:x-1
%         Finaltoep=vertcat(Finaltoep,h{i});
%         
%     end
%     Finaltoep
%     
    
    
    
end