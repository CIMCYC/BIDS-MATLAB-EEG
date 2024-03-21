%% RENAME TO BIDS FORMAT
% This script is used to export eeg-preprocessing data to BIDS format.
% -------------------------------------------------------------------------
% María Ruiz and María del Pilar Sánchez
% mariaruizromero@ugr.es and pilarsanpe@ugr.es
% CIMCYC - University of granada
% -------------------------------------------------------------------------
%
clear; clc;
run config.m

%% Get the list of subjects to load:
subject_list = get_subject_list(cfg);

for sub = 1 : length(subject_list)

    load_dir = [cfg.datapathraw filesep 'derivatives' filesep subject_list.id]; 

    %% Resample
    resampleset = [load_dir filesep subject_list.id '_resampled' '.set'];
    resampleset2 = [load_dir filesep subject_list.id '_' cfg.resample.sdir '.set'];
    movefile(resampleset,resampleset2,"f");
    resamplefdt = [load_dir filesep subject_list.id '_resampled' '.fdt'];
    resamplefdt2 = [load_dir filesep subject_list.id '_' cfg.resample.sdir '.fdt'];
    movefile(resamplefdt,resamplefdt2);
    resamplemat = [load_dir filesep subject_list.id '_resampled' '.mat'];
    resamplemat2 = [load_dir filesep subject_list.id '_' cfg.resample.sdir '.mat'];
    movefile(resamplemat,resamplemat2);
 
    %% Filter
    filteredset = [load_dir filesep subject_list.id '_filtered' '.set'];
    filteredset2 = [load_dir filesep subject_list.id '_' cfg.filter.sdir '.set'];
    movefile(filteredset,filteredset2);
    filteredfdt = [load_dir filesep subject_list.id '_filtered' '.fdt'];
    filteredfdt2 = [load_dir filesep subject_list.id '_' cfg.filter.sdir '.fdt'];
    movefile(filteredfdt,filteredfdt2);
    filteredmat = [load_dir filesep subject_list.id '_filtered' '.mat'];
    filteredmat2 = [load_dir filesep subject_list.id '_' cfg.filter.sdir '.mat'];
    movefile(filteredmat,filteredmat2);

    %% Epochs
    epochedset = [load_dir filesep subject_list.id '_epoched' '.set'];
    epochedset2 = [load_dir filesep subject_list.id '_' cfg.epochs.sdir '.set'];
    movefile(epochedset,epochedset2);
    epochedfdt = [load_dir filesep subject_list.id '_epoched' '.fdt'];
    epochedfdt2 = [load_dir filesep subject_list.id '_' cfg.epochs.sdir '.fdt'];
    movefile(epochedfdt,epochedfdt2);
    epochedmat = [load_dir filesep subject_list.id '_epoched' '.mat'];
    epochedmat2 = [load_dir filesep subject_list.id '_' cfg.epochs.sdir '.mat'];
    movefile(epochedmat,epochedmat2);

    %% Interpole
    interpoledset = [load_dir filesep subject_list.id '_interpoled' '.set'];
    interpoledset2 = [load_dir filesep subject_list.id '_' cfg.interpole.sdir '.set'];
    movefile(interpoledset,interpoledset2);
    interpoledfdt = [load_dir filesep subject_list.id '_interpoled' '.fdt'];
    interpoledfdt2 = [load_dir filesep subject_list.id '_' cfg.interpole.sdir '.fdt'];
    movefile(interpoledfdt,interpoledfdt2);
    interpoledmat = [load_dir filesep subject_list.id '_interpoled' '.mat'];
    interpoledmat2 = [load_dir filesep subject_list.id '_' cfg.interpole.sdir '.mat'];
    movefile(interpoledmat,interpoledmat2);

    %% Icapruned
    icaprunedset = [load_dir filesep subject_list.id '_icapruned' '.set'];
    icaprunedset2 = [load_dir filesep subject_list.id '_' cfg.ica.badcomponents.sdir '.set'];
    movefile(icaprunedset,icaprunedset2);
    icaprunedfdt = [load_dir filesep subject_list.id '_icapruned' '.fdt'];
    icaprunedfdt2 = [load_dir filesep subject_list.id '_' cfg.ica.badcomponents.sdir '.fdt'];
    movefile(icaprunedfdt,icaprunedfdt2);
    icaprunedmat = [load_dir filesep subject_list.id '_icapruned' '.mat'];
    icaprunedmat2 = [load_dir filesep subject_list.id '_' cfg.ica.badcomponents.sdir '.mat'];
    movefile(icaprunedmat,icaprunedmat2);

    %% Icaweights
    icaweightsset = [load_dir filesep subject_list.id '_icaweights' '.set'];
    icaweightsset2 = [load_dir filesep subject_list.id '_' cfg.ica.sdir '.set'];
    movefile(icaweightsset,icaweightsset2);
    icaweightsfdt = [load_dir filesep subject_list.id '_icaweights' '.fdt'];
    icaweightsfdt2 = [load_dir filesep subject_list.id '_' cfg.ica.sdir '.fdt'];
    movefile(icaweightsfdt,icaweightsfdt2);
    icaweightsmat = [load_dir filesep subject_list.id '_icaweights' '.mat'];
    icaweightsmat2 = [load_dir filesep subject_list.id '_' cfg.ica.sdir '.mat'];
    movefile(icaweightsmat,icaweightsmat2);

    %% Trialpruned
    trialprunedset = [load_dir filesep subject_list.id '_trialpruned' '.set'];
    trialprunedset2 = [load_dir filesep subject_list.id '_' cfg.trialrej.sdir '.set'];
    movefile(trialprunedset,trialprunedset2);
    trialprunedfdt = [load_dir filesep subject_list.id '_trialpruned' '.fdt'];
    trialprunedfdt2 = [load_dir filesep subject_list.id '_' cfg.trialrej.sdir '.fdt'];
    movefile(trialprunedfdt,trialprunedfdt2);
    trialprunedmat = [load_dir filesep subject_list.id '_trialpruned' '.mat'];
    trialprunedmat2 = [load_dir filesep subject_list.id '_' cfg.trialrej.sdir '.mat'];
    movefile(trialprunedmat,trialprunedmat2);

    %% Re-referenced
    rereferencedset = [load_dir filesep subject_list.id '_rereferenced' '.set'];
    rereferencedset2 = [load_dir filesep subject_list.id '_' cfg.reref.sdir '.set'];
    movefile(rereferencedset,rereferencedset2);
    rereferencedfdt = [load_dir filesep subject_list.id '_rereferenced' '.fdt'];
    rereferencedfdt2 = [load_dir filesep subject_list.id '_' cfg.reref.sdir '.fdt'];
    movefile(rereferencedfdt,rereferencedfdt2);
    rereferencedmat = [load_dir filesep subject_list.id '_rereferenced' '.mat'];
    rereferencedmat2 = [load_dir filesep subject_list.id '_' cfg.reref.sdir '.mat'];
    movefile(rereferencedmat,rereferencedmat2);

end