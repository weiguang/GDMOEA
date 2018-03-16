% Developer: Weiguang Chen
% Contact Info: chen2621978@gmail.com
%

%% include paths
% 添加当前路径下的所有子目录
%addpath(genpath(pwd));

addpath(pwd);
addpath(genpath([pwd '\problem']));
addpath([pwd '\gdmoea']);
addpath([pwd '\indicator']);
addpath([pwd '\pf']);
addpath([pwd '\plot']);

%% clean all
clc;
clear;
close all;

%% problem
% main_dtlz
% main_DLTZ2_2D
% main_DLTZ2_8D
% main_Fonseca_2D
% main_Kursawe_2D
% main_ZDT_2D