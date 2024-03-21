# BIDS-MATLAB-EEG
SCRIPT TO CONVERT EEG RAW DATA TO BIDS FORMAT USING A MATLAB TOOLBOX BIDS VIA EEGLAB (bids_export_eeglab.m)

This script is used to export eeg data from different extensions to BIDS format. (https://bids.neuroimaging.io/).

Loadcurry plug-in for EEGLAB should be installed in order to load Neuroscan Curry raw data files.
In addition, it is necessary to change the script 'bids_export.m' on that toolbox for the 'bids_export.m' of this repository, because it has an update.

First, you have to add bids-matlab-tools to the path (https://github.com/sccn/bids-matlab-tools/tree/master).
The presented script has been made using several of the scripts presented in the toolboox.

It is necessary to initialise EEGLAB before running the script.

The presented file is generic for any experiment, so it should be adapted according to the needs of your experiment.
This is indicated where it appears ('replace with your own').
