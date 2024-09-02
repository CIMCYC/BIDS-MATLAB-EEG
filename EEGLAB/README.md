# BIDS-MATLAB-EEG

## SCRIPT TO CONVERT EEG RAW DATA TO BIDS FORMAT USING A MATLAB TOOLBOX BIDS VIA EEGLAB (bids_export_eeglab.m)

This script is used to export eeg data from different extensions to BIDS format. (https://bids.neuroimaging.io/).

Loadcurry plug-in for EEGLAB should be installed in order to load Neuroscan Curry raw data files.
In addition, it is necessary to change the script 'bids_export.m' on that toolbox for the 'bids_export.m' of this repository, because it has an update.

First, you have to add bids-matlab-tools to the path (https://github.com/sccn/bids-matlab-tools/tree/master).
The presented script has been made using several of the scripts presented in the toolboox.

It is necessary to initialise EEGLAB before running the script.

The presented file is generic for any experiment, so it should be adapted according to the needs of your experiment.
This is indicated where it appears ('replace with your own').

## SCRIPT TO CONVERT PREPROCESSED EEG DATA TO BIDS FORMAT (rename_eegpreprocessingdata_bidsformat.m)
 
This script simply sorts and renames the files obtained from the data preprocessing (done by eeglab) to the proper BIDS format structure.
The script makes use of the configuration file (config.m) of the eeg preprocessing repository (https://github.com/CIMCYC/EEG/tree/main/MATLAB/PREPROCESSING/EEGLAB/L%C3%93PEZ%2C%20D),
where the names of the files to be renamed are indicated in order to export later to BIDS format with this code. So, it is necessary to include it in the same path as this script.


María Ruiz Romero and María del Pilar Sánchez Pedrajas (mariaruizromero@ugr.es, pilarsanpe@ugr.es)

If you have any questions or inquiries, please feel free to send us an email.
