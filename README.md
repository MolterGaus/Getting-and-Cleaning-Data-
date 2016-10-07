##Getting and Cleaning Data

File run_analysis contains a script for analyse data of the accelerometers from the Samsung Galaxy S smartphone.

Requirements: The script requires: - a "UCI HAR Data" folder in the working directory, containing the original folder structure and datasets (as unzipped from source file) in the working directory. - dplyr package 

The script run_analusis do:

*Read all files
*Reads column labels from features.txt
*Remove special characters: -,(,) and comma from the variable names
*Convert Activity labels in y_train.txt and y_test.txt to meaningful names like WALKING, SITING, STANDING, etc
*Appends Activity labels and Subject numbers (columns) to train and test data
*Merges train and test data
*Extracts data with mean and std in the variable names
*Computes col averages and groups by Subject and Activity (dropping rows without data)
*Writes a text file (FICHERO.csv) 

In the Codebook file is a reference to all the variables containing "FICHERO.csv"

