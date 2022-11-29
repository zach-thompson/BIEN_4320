function [Conc fit]= inversion(samplespectra, A,B)

%SAMPLE SPECTRA*
SAMPLE_SPECTRA=samplespectra;

%initialization default 3 absorbers
alp=rand(1);beta=1-alp;gam=1-(alp+beta);
lb=[0 0 ];
ub=[ 100 100];
initialGuess=[alp; beta; gam];

Absorbers(1,:)=A;
Absorbers(2,:)=B;
%fitting
OPTIONS = optimoptions('lsqcurvefit','TolX',1e-10); 
[Conc Resnorm res]= lsqcurvefit((@ComponentFormula),initialGuess(1:2),Absorbers((1:2),:),SAMPLE_SPECTRA,[0 0],[100 100],OPTIONS);% fits measurement spec to model and gets error

fit = (Conc(1)*A)+(Conc(2)*B);

end