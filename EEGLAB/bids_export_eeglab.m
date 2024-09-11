%% Matlab script to export to BIDS.
% This is a general example to export EEGLAB dataset. The data will be
% output with the extension .set.
% First, you have to add bids-matlab-tools to path (https://github.com/sccn/bids-matlab-tools/tree/master).
% It is necessary inicializate EEGLAB before running the script.
% Modify this script for your own purpose.
% 
% Copyright: Arnaud Delorme - Oct 2021
% -------------------------------------------------------------------------
% Some changes made by: María Ruiz and María del Pilar Sánchez
% (mariaruizromero@ugr.es, pilarsanpe@ugr.es)
% -------------------------------------------------------------------------

clc;
clear all;

%% Paths and data

dataPath   = 'C:\Users\Usuario\Documents\EEG\sourcedata\';  % Subjects folders datasetpath,  replace with your own.
codePath   = 'C:\Users\Usuario\Documents\EEG\code\'; % Code path, replace with your own.
targetPath = 'C:\Users\Usuario\Documents\EEG\BIDS\'; % Subjects folders BIDS,  replace with your own.
nSubject   = 10; % Number of subjects (replace with your own)
taskName = ''; % Change according with your experiment task-name.

%% Raw data files (replace with your own)
% Please note that you have to add the extension of your data to eeglab.

data(1).file = {fullfile(dataPath, 'sub-001', 'eeg', 'sub-001.vhdr')};  % Subfolders datasetpath and datasetname .set/.eeg/.dap/.vhdr ... If you have more runs in order to indicate files you have to include 'fullfile(dataPath, 'sub-001', 'eeg', 'sub-001.vhdr')' as many times as runs you have.
data(1).session = [1]; % Number of sessions, replace with your own. Although you have one session, if you have more runs you will have to write [1 1 1].
data(1).run     = [1]; % Number of runs, replace with your own. If you have more runs [1 2 3].

% data(2).file = {fullfile(dataPath, 'sub-002', 'eeg', 'sub-002.vhdr')};
% data(2).session = [1];
% data(2).run     = [1];
% 
% data(3).file = {fullfile(dataPath, 'sub-003', 'eeg', 'sub-003.vhdr')};
% data(3).session = [1];
% data(3).run     = [1];           
%             
% data(4).file = {fullfile(dataPath, 'sub-004', 'eeg', 'sub-004.vhdr')};
% data(4).session = [1];
% data(4).run     = [1];            
% 
% data(5).file = {fullfile(dataPath, 'sub-005', 'eeg', 'sub-005.vhdr')};
% data(5).session = [1];
% data(5).run     = [1];
% 
% data(6).file = {fullfile(dataPath, 'sub-006', 'eeg', 'sub-006.vhdr')};
% data(6).session = [1];
% data(6).run     = [1];
% 
% data(7).file = {fullfile(dataPath, 'sub-007', 'eeg', 'sub-007.vhdr')};
% data(7).session = [1];
% data(7).run     = [1];
% 
% data(8).file = {fullfile(dataPath, 'sub-008', 'eeg', 'sub-008.vhdr')};
% data(8).session = [1];
% data(8).run     = [1];
% 
% data(9).file = {fullfile(dataPath, 'sub-009', 'eeg', 'sub-009.vhdr')};
% data(9).session = [1];
% data(9).run     = [1];
% 
% data(10).file = {fullfile(dataPath, 'sub-010', 'eeg', 'sub-010.vhdr')};
% data(10).session = [1];
% data(10).run     = [1];
% 

%% Participant information for participants.tsv file

pInfo = { 'gender'   'age' 'agegroup' ; % Sex, age, group, ethnicity... (replace with your own). It is necessary to indicate the participant information for all 'nSubject', even if you only do one subject individually at that time. If you do not have participant's data, write ''.
'F' '18' 'young';
'F' '21' 'young';
'F' '18' 'young';
'F' '18' 'young';
'F' '22' 'young';
'F' '66' 'old';
'F' '59' 'old';
'' '' '' '';
'' '' '' '';
'F' '19' 'young';
};

%% Select subset of subject to export

pInfo(nSubject+2:end,:) = [];
data(nSubject+1:end) = [];

%% Code Files used to preprocess and import to BIDS

code = {fullfile(codePath)}; %{ fullfile(dataPath, mfilename) };

%% General information for dataset_description.json file

generalInfo.Name = 'General Info: Title';  % (replace with your own)
generalInfo.ReferencesAndLinks = { 'References and Links pages' }; % (replace with your own)
generalInfo.BIDSVersion = 'v1.2.1';
generalInfo.License = 'CC0';
generalInfo.Authors = { 'Autor 1' 'Autor 2' }; % (replace with your own)
%generalInfo.DatasetDOI = { 'doi:10.18112/openneuro.ds003061.v1.1.2' }; % (replace with your own)

%% Participant column description for participants.json file
% You can add more pInfoDesc if you need it.

pInfoDesc.participant_id.LongName    = 'Participant identifier'; % (replace with your own)
pInfoDesc.participant_id.Description = 'Unique participant identifier'; % (replace with your own)
pInfoDesc.gender.Description = 'Sex of the participant';
pInfoDesc.gender.Levels.M    = 'male';
pInfoDesc.gender.Levels.F    = 'female';
pInfoDesc.age.Description = 'age of the participant';
pInfoDesc.age.Units       = 'years';
pInfoDesc.agegroup.Description = 'Age condition';
pInfoDesc.agegroup.Levels.young = 'young';
pInfoDesc.agegroup.Levels.old = 'old';

%% Event column description for xxx-events.json file (only one such file)

eInfo = {'onset'         'latency';
         'sample'        'latency';
         'value'         'type' }; % ADD HED HERE
eInfoDesc.onset.Description = 'Event onset';
eInfoDesc.onset.Units = 'second';
eInfoDesc.response_time.Description = 'Latency of button press after auditory stimulus';
eInfoDesc.response_time.Levels.Units = 'millisecond';

% You do not need to define both trial type and value in this simple
% example, but it is good to know that both exist. There is no definite
% rule regarding the difference between these two fields. As their name
% indicate, "trial_type" contains the type of trial and "value" contains 
% more information about a trial of given type. % You can add more
% eInfoDesc if you need it.

eInfoDesc.trial_type.Description = 'Type of event'; % (replace with your own)
eInfoDesc.trial_type.Levels.stimulus = 'Visual stimulus'; % (replace with your own)
eInfoDesc.trial_type.Levels.response = 'Response of participant'; % (replace with your own)
eInfoDesc.value.Description = 'Value of event'; % (replace with your own)
eInfoDesc.value.Levels.square   = 'Square visual stimulus'; % (replace with your own)
eInfoDesc.value.Levels.rt       = 'Behavioral response'; % (replace with your own)

% This allow to define trial types based on EEGLAB type - it is optional
trialTypes = { 'rt'     'response'; % (replace with your own)
               'square' 'stimulus' };
renameTypes = { 'rt'     'response'; % (replace with your own)
               'square' 'stimulus' };

%% Content for README file

README = [  10 ...  %(replace with your own)
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' 10 ...
'' ];

%% Content for CHANGES file

CHANGES = sprintf([ 'Version 1.0 - 4 Aug 2020\n' ... % (replace with your own)
                    ' - Initial release\n' ]);

%% List of stimuli to be copied to the stimuli folder
% You can choose between create stimuli folder or copy.
stimuli = { ...  % (replace with your own)
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '')
    fullfile( dataPath, 'stimuli', '') };

% % Copy stimuli folder
% % -------------------
%copyfile('../stimuli', fullfile(targetFolder, 'stimuli'), 'f');

%% Task information for xxxx-eeg.json file

tInfo.InstitutionAddress = 'Campus de Cartuja s/n - 18071 Granada, Spain'; % (replace with your own)
tInfo.InstitutionName = 'University of Granada'; % (replace with your own)
tInfo.InstitutionalDepartmentName = 'CIMCYC'; % (replace with your own)
tInfo.PowerLineFrequency = 60;
tInfo.ManufacturersModelName = 'BrainVision'; % (replace with your own)
tInfo.Reference = 'Delorme A, Westerfield M, Makeig S. Medial prefrontal theta bursts precede rapid motor responses during visual selective attention. J Neurosci. 2007 Oct 31;27(44):11949-59. doi: 10.1523/JNEUROSCI.3477-07.2007. PMID: 17978035; PMCID: PMC6673364.'; % (replace with your own)

%% Channel location file

chanlocs = []; %fullfile(dataPath, 'channel_loc_file.ced';

%% Call to the export function

bids_export(data, 'targetdir', targetPath, 'taskName', 'unnamed', 'trialtype', trialTypes, 'gInfo', generalInfo, 'pInfo', pInfo, 'pInfoDesc', pInfoDesc, 'eInfoDesc', eInfoDesc, 'README', README, 'CHANGES', CHANGES, 'stimuli', stimuli, 'codefiles', code, 'tInfo', tInfo, 'chanlocs', chanlocs);

disp('Done')


