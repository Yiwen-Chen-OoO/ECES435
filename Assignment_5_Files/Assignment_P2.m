%% Assignment 5 
%% Yiwen Chen | Yumeng Yang | Wanyi Ying

% Part II
close all; clear all; clc;
format compact;
% initializing and set parameters
PATH = {'resamp1.tif','resamp2.tif','resamp3.tif','resamp4.tif'};
lamda = 1;
tau = 2;
sigma = 1;
%get p map and freq p map for each img. 

for i = 1: length(PATH)
    p_map = Kirchner(PATH{i},lamda,tau,sigma);
    
end
