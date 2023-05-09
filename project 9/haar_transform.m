%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
function [base,high,highlow,lowhigh]=haar_transform(image)
    [x,y]=size(image);
    
    mask=[1 1];
    
    
    
    for(i=1:2:x)        
        for(j=1:y)
          mask(1)=image(i,j);
          mask(2)=image(i+1,j);
            
          add=(mask(1)+mask(2))/2;
          sub=(mask(1)-mask(2))/2;
          
          left(ceil(i/2),j)=add;
          right(ceil(i/2),j)=sub;
        end
    end
    
    for(i=1:x/2)        
        for(j=1:2:y)
          mask(1)=left(i,j);
          mask(2)=left(i,j+1);
            
          add=(mask(1)+mask(2))/2;
          sub=(mask(1)-mask(2))/2;
          
          base(i,ceil(j/2))=add;
          highlow(i,ceil(j/2))=sub;
        end
    end
    
    for(i=1:x/2)        
        for(j=1:2:y)
          mask(1)=right(i,j);
          mask(2)=right(i,j+1);
            
          add=(mask(1)+mask(2))/2;
          sub=(mask(1)-mask(2))/2;
          
          lowhigh(i,ceil(j/2))=add;
          high(i,ceil(j/2))=sub;
        end
    end
          
        
        
    
  
end