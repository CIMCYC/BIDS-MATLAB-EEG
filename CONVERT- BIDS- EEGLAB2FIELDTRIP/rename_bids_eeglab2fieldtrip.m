%%  CONVERT BIDS FROM EEGLAB TO FIELDTRIP
% -------------------------------------------------------------------------
% María Ruiz Romero and María del Pilar Sánchez Pedrajas
% mariaruizromero@ugr.es, pilarsanpe@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------

addpath(genpath('C:\eeglab2021'))

datapath = 'C:\Users\Usuario\Documents\BIDS'; % Path to your BIDS folder
taskname = 'name'; % replace with your own
extension = '.set'; % replace with your own 
datatype = '_eeg';

subjects = {
     'sub-001';
     'sub-002';
     'sub-003';
     'sub-004';
     'sub-005';
     'sub-006';
    };

% nrun = 5; % replace with your own
% nsesions = 2; % replace with your own

for subindx = 1 : length(subjects)
%    for runindx=1 : nrun 
%         for sesindx=1:nsesions

            % Set it to your data
            file = dir([datapath filesep subjects{subindx} filesep 'eeg' filesep ...
                subjects{subindx} '_task-' taskname '_' datatype extension]);
            
%             file = dir([datapath filesep subjects{subindx} filesep 'eeg' filesep ...
%                 subjects{subindx} '_ses-0' int2str(sesindx) '_task-' taskname '_run-' int2str(runindx) datatype extension]); % If you have more than one session and run.
%             file = dir([datapath filesep subjects{subindx} filesep 'eeg' filesep ...
%                 subjects{subindx} '_task-' taskname '_run-' int2str(runindx) datatype extension]); % If you have more than one run.
             
            cd(file.folder)
        
            EEG = pop_loadset(file.name);

            data = strcat('data', int2str(runindx)) ;
        
            data = eeglab2fieldtrip(EEG, 'preprocessing', 'none'); % 'preprocessing' for eeglab plugin / 'raw' fpr fieldtrip plugin
            
            % Choose one depending on your data
            name = [subjects{sub} '_task-' taskname datatype '.mat'];
%             name = [subjects{sub} '_ses-0' int2str(sesindx) '_task-' taskname '_run-' int2str(runindx) datatype '.mat']; % If you have more than one session and run.
%             name = [subjects{sub} '_task-' taskname '_run-' int2str(runindx) datatype '.mat']; % If you have more than one run.
            
            save(name, 'data');
        
%        end 
%    end
end

