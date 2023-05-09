%Ioannidis Christos 2018030006
%Stathopoulou Stella 2018030208
clear ;
close all;

%Haar Wavelet Transform-7

%1.Analysis
%Part a
%Define matrix to apply Haar transformation to
A=[88 88 89 90 92 94 96 97];

%Part b
%Grouping the coeffiicients in groups of 2
ns=2;
ng=numel(A)/ns;
Ag = reshape(A,ns,ng)

%Part c
%calculating average value for each group
Agav = mean(Ag)

%Part d
%calculating deviation from the average value
for i=1:numel(Agav)
    diff1(i)=Agav(i)-Ag(1,i);
end

%Part e
%Combine average values and deviation values in one Matrix
Ahaar=[Agav diff1]

%2.Synthesis
%Part a
givAhaar=Ahaar
num=numel(givAhaar)

%Part b
%divide the average values and the deviation values into to sepatate lists
for(i=1:num/2)
    AVG(i)=givAhaar(i);
end
for(j=(num/2)+1:num)
    dif(j-(num/2))=givAhaar(j);
end


%AVG: The average values
%dif: The deviation values
AVG
dif



%Upsample Average Values
NREP=2;
Aup=kron(AVG,ones(1,NREP))

%Part C
%Reconstruct the initial matrix
difCounter=1;
for i=1:2:numel(Aup)
    Aup(i)=Aup(i)-dif(difCounter);
    Aup(i+1)=Aup(i+1)+dif(difCounter);
    difCounter=difCounter+1;
end
Aup
%display message in case of success
if(Aup==A)
    disp('success')
end

    
    



