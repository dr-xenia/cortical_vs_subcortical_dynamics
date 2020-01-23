%% CATCH22 HACKATON 2020 CORTICAL SUBCORTICAL MR Benelux script

% Carl H. Lubba, Sarab S. Sethi, Philip Knaute, Simon R. Schultz, Ben D.
% Fucher, Nick S. Jones (2019) - catch22: CAnonical Time-series CHaracteristics
% selected through highly comparative time-series analysis -
% arXiv:1901.10200.

% Original script downloaded from: https://github.com/chlubba/catch22

% Comparing cortical and subcortical maps.

% For each time-series, 22 different metrics from the hctsa toolbox (Ben D.
% Fulcher & Nick S. Jones (2017) - https://github.com/benfulcher/hctsa) are
% computed. 

%% set C compiler

cd '/Users/nbertelsen/Documents/MATLAB/catch22/wrap_Matlab'
mex -setup c
mexAll

%% SET FIXED PARAMETERS
clear,clc

% set up paths for data and code
root_dir = '/Users/nbertelsen/Dropbox/projects/hackaton2020Benelux';
code_dir = fullfile(root_dir, 'code'); addpath(code_dir)
group = 'NDG';

% retrieve subject list and choose task folders
subj_dir = fullfile(root_dir, group); cd(subj_dir)
sub_ds = dir(subj_dir);
sub_ds = {sub_ds.name}';
sub_list = sub_ds(startsWith(sub_ds, 'NDAR') == 1);

tasks = {'RestingState','Video1', 'Video2', 'Video3', 'Video4'}';

%% CALCULATE ALL 22 FEATURES ON EACH CHANNEL FOR EACH SUBJECT FOR EACH TASK

% The script is set up so that it calls on one function for Resting State
% data and another for Video data. This is because Resting State data has
% been previously cut into distinct parts for its eyes-open and eyes-closed
% segments.

for n = 1 : length(sub_list) % for subject
    id = char(sub_list(n));
    disp(id)
    
    for n2 = 1 : length(tasks) % for task
        task = char(tasks(n2));
        disp(task)
        
        clearvars -except subj_dir code_dir sub_list id tasks n idn n2 task
        
        if strcmp(task, 'RestingState')
            
            data_dir = fullfile(subj_dir, id, 'preprocessed', task, 'processed/clean');
            out_dir = fullfile(subj_dir, id, 'metrics', task);
            
            % call restingstate specific function
            catch22fMRIrestingstate(data_dir, out_dir)
            
        elseif ~strcmp (task, 'RestingState')
            
            data_dir = fullfile(subj_dir, id, 'preprocessed', task, 'processed');
            
            % call video specific function
            catch22video(data_dir, subj_dir, id)
            
        end     
    end
end
