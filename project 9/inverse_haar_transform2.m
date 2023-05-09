%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [image]=inverse_haar_transform(base,high,highlow,lowhigh)
    [x,y]=size(base);
    
    mask=[1 1];
    
    
    
    
    %left
    for(i=1:x)        
        for(j=1:2:2*y)
          mask(1)=base(i,ceil(j/2));
          mask(2)=highlow(i,ceil(j/2));
            
          up=(mask(1)+mask(2));
          down=(mask(1)-mask(2));
          
          left(i,j)=up;
          left(i,j+1)=down;
        end
    end
    
    %right
    for(i=1:x)        
        for(j=1:2:2*y)
          mask(1)=lowhigh(i,ceil(j/2));
          mask(2)=high(i,ceil(j/2));
            
          up=(mask(1)+mask(2));
          down=(mask(1)-mask(2));
          
          right(i,j)=up;
          right(i,j+1)=down;
        end
    end
    
    
    
    
    
    for(i=1:2:2*x)        
        for(j=1:2*y)
          mask(1)=left(ceil(i/2),j);
          mask(2)=right(ceil(i/2),j);
            
          l=(mask(1)+mask(2));
          r=(mask(1)-mask(2));
          
          image(i,j)=l;
          image(i+1,j)=r;
        end
    end
    
    
          
        
        
    
  
end