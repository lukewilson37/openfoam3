%% COE 347 OPENFOAM 3 PARALLEL ANALYSIS
%%
% Data comes from terminal comands:
%    "grep 'ExecutionTime =' log.rhoCentralFoam | wc -l" and
%    "tail log.rhoCentralFoam"
clc 
clear all

N = [1 2 4 8 16 32 64];
steps = [248 199 188 696 654 536 696];
time = [1401 539 257 496 249 118 96];
T = time./steps;
SpU = T(1)*T.^-1;
PE =SpU.*N.^-1;
N = N';steps=steps';T=T';SpU=SpU';PE=PE';

table(N,T,SpU,PE)

figure(1)
plot(N,SpU)
xlabel('number of processors')
ylabel('speed up')
