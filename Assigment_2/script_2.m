clear all
clc
close all

f=@(x) x^2;
a=0;
b=2;
eps=1e-5;
method=1;
Adaptive_integration(f,a,b,eps,method);
