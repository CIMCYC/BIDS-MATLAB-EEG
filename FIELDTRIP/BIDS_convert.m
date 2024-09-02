%% BIDS CONVERSION WITH FIELDTRIP
% -------------------------------------------------------------------------
% María Ruiz Romero and María del Pilar Sánchez Pedrajas
% mariaruizromero@ugr.es, pilarsanpe@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
% Copyright (C) 2018-2023, Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.fieldtriptoolbox.org
% for the documentation and details.
% -------------------------------------------------------------------------
% This is a general example to export FIELDTRIP dataset.
% First, you have to add this repository to path (https://github.com/fieldtrip/fieldtrip).
% Modify this script for your own purpose.
% -------------------------------------------------------------------------

clc;
clear all;

%% Paths and raw data files (replace with your own)
% Path of fieldtrip version
addpath(genpath('C:\Users\Usuario\Documents\GitHub\fieldtrip')); % Path of the fieldtrip toolbox from where it takes the funtion to convert to BIDS format (do not add to Matlab path).
datapathBIDS = dir('D:\DOCUMENTOS\MATLAB\EEG\PAULA\pruebafieldtrip\BIDS');
datapathraw = 'D:\DOCUMENTOS\MATLAB\EEG\PAULA\pruebafieldtrip'; % In this folder shoud be participants folders.

sub = {'001'}; %, '002', '003', '004', '005', '006', '007', '008', '009', '010'}; % Introduce all subjects that you want to convert in BIDS format.
age = [25]; %96 nan 77  82  87  18 40  26  80]; % Introduce the age of your participants respectively.
sex = {'f'}; %'f' 'f' 'f' 'm' 'm' 'm' 'm' 'm'}; % Introduce the sex of your participants respectively.
%   ses = {'1', '2'}; % Change indicating your sessions. If you only have one session, you can omit this.
%   run = []; If you do not have runs, you can omit this.

cfg.method    = 'convert'; % copy to copy data, convert to convert.
cfg.datatype  = 'eeg';
cfg.dataextension = '.vhdr'; % .set, .bdf, .eeg...

%% Conversion with the data (replace with your own)
for subindx = 1: numel(sub)
%     for sesindx=1:numel(ses)
%         for runindx=1:numel(run)
            % specify the input file name, here we are using the same file for every subject:
            if subindx < 9
                cfg.dataset   = [datapathraw filesep 'sub-00' int2str(subindx) filesep cfg.datatype filesep 'sub-00' int2str(subindx) cfg.dataextension];
                cfg.outputfile   = datapathBIDS; % optional filename for the output data (path) (default is automatic)
            else
                cfg.dataset   = [datapathraw filesep 'sub-0' int2str(subindx) filesep cfg.datatype filesep 'sub-0' int2str(subindx) cfg.dataextension];
                cfg.outputfile   = datapathBIDS; % optional filename for the output data (path) (default is automatic)
            end

            %% Paths and data
            % Specify the output directory
            cfg.bidsroot  = 'BIDS';
            cfg.sub       = sub{subindx};
        
            %% Participant information for participants.tsv file
            % this is optional, you can also pass other pieces of info
            cfg.participants.age = age(subindx);
            cfg.participants.sex = sex{subindx};
        
            %% Event column description for xxx-events.json file (only one such file)
            % You do not need to define both trial type and value in this simple
            % example, but it is good to know that both exist.
            %   cfg.presentationfile        = string, optional filename for the presentation log file
            %   cfg.trigger.eventtype       = string (default = [])
            %   cfg.trigger.eventvalue      = string or number
            %   cfg.trigger.skip            = 'last'/'first'/'none'
            %   cfg.presentation.eventtype  = string (default = [])
            %   cfg.presentation.eventvalue = string or number
            %   cfg.presentation.skip       = 'last'/'first'/'none'
        
            %% Task information for xxxx-eeg.json file
            % General BIDS options that apply to all data types are
            cfg.InstitutionName             = 'CIMCYC';
            cfg.InstitutionalDepartmentName = 'Neurociencia cognitiva';
            cfg.InstitutionAddress          = 'Campus Cartuja, Granada';
            %   cfg.Manufacturer                = string
            %   cfg.ManufacturersModelName      = string
            %   cfg.DeviceSerialNumber          = string
            %   cfg.SoftwareVersions            = string
        
            %% General information for dataset_description.json file
            % If you specify cfg.bidsroot, this function will also write the dataset_description.json file. You can specify the following fields.
            %   cfg.dataset_description.writesidecar        = string
            %   cfg.dataset_description.Name                = string
            %   cfg.dataset_description.BIDSVersion         = string
            %   cfg.dataset_description.License             = string
            %   cfg.dataset_description.Authors             = string or cell-array of strings
            %   cfg.dataset_description.Acknowledgements    = string
            %   cfg.dataset_description.HowToAcknowledge    = string
            %   cfg.dataset_description.Funding             = string or cell-array of strings
            %   cfg.dataset_description.ReferencesAndLinks  = string or cell-array of strings
            %   cfg.dataset_description.DatasetDOI          = string
        
            % Provide the mnemonic and long description of the task
            cfg.TaskName        = 'unknown'; % replace with your own
            cfg.TaskDescription = ''; % replace with your own
        
            % These are EEG specific
            cfg.eeg.PowerLineFrequency = 60;   % since recorded in the USA
            cfg.eeg.EEGReference       = ''; % actually I do not know, but let's assume it was left mastoid
        
            data2bids(cfg);

%         end
%     end
end

