clear all;
clc;

%extracting data from out .dat file
numFiles = 10000;
startRow = 1;
endRow = inf;
myData = cell(1,numFiles);
for fileNum = 1:numFiles
    fileName = sprintf('out%1d.dat',fileNum);
    myData{fileNum} = importfile(fileName,startRow,endRow);   
end

%PDF for particular timestep 
k=[];
tm=350; %time step or row number
%till 369 th timestep can't predict
for l=1:numFiles
    o=table2array(myData{l});
    k=[k;o(tm,:)];

end
nmu=mean(k);
nsigma=cov(k);
npdf=mvnpdf(k,nmu,nsigma);

k1=[];
tm1=370;
%till 369 th timestep can't predict
for l=1:numFiles
    o1=table2array(myData{l});
    k1=[k1;o1(tm1,:)];

end
nmu1=mean(k1);
nsigma1=cov(k1);
npdf1=mvnpdf(k1,nmu1,nsigma1);

k2=[];
tm2=400;
%till 369 th timestep can't predict
for l=1:numFiles
    o2=table2array(myData{l});
    k2=[k2;o2(tm2,:)];

end
nmu2=mean(k2);
nsigma2=cov(k2);
npdf2=mvnpdf(k2,nmu2,nsigma2);

k3=[];
tm3=500;
%till 369 th timestep can't predict
for l=1:numFiles
    o3=table2array(myData{l});
    k3=[k3;o3(tm3,:)];

end
nmu3=mean(k3);
nsigma3=cov(k3);
npdf3=mvnpdf(k3,nmu3,nsigma3);

k4=[];
tm4=600;
%till 369 th timestep can't predict
for l=1:numFiles
    o4=table2array(myData{l});
    k4=[k4;o4(tm4,:)];

end
nmu4=mean(k4);
nsigma4=cov(k4);
npdf4=mvnpdf(k4,nmu4,nsigma4);

k5=[];
tm5=900;
%till 369 th timestep can't predict
for l=1:numFiles
    o5=table2array(myData{l});
    k5=[k5;o5(tm5,:)];

end
nmu5=mean(k5);
nsigma5=cov(k5);
npdf5=mvnpdf(k5,nmu5,nsigma5);

figure (1)
plot(npdf,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.35 s');
print('-dpng','-r500','035s.png');
figure (2)
plot(npdf1,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.37 s');
print('-dpng','-r500','037s.png');
figure (3)
plot(npdf2,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.4 s');
print('-dpng','-r500','040s.png');
figure (4)
plot(npdf3,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.5 s');
print('-dpng','-r500','050s.png');
figure (5)
plot(npdf4,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.6 s');
print('-dpng','-r500','060s.png');
figure (6)
plot(npdf5,'LineWidth',1.2);
set(gca,'FontSize',14);
title('PDF at time 0.9 s');
print('-dpng','-r500','090s.png');

