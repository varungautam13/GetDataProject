# Getting and Cleaning Data - Course Project

## Files
The script run_analysis.R peforms transformation usinf the following files:
* X_train - training dataset
* y_train - training activity type datset
* subject_train - training subject datset
* X_test - test dataset
* y_test - test activity type datset
* subject_test - test subject datset
* activity_labels - activity label datset
* features - feature names datset

The transformed data file generated after the operations is called 
* TidyDataSet - it contains average of all observations grouped by each subject and each activity type

## Variables and Operations
* X_train,y_train and subject_train text files are combined together to form a train datset- TrainData
* X_test,y_test,subject_test files are combined to form a test dataset - TestData
* Train and Test are then combined to form a complete datset - CompleteData
* Using features datset, the combined dataset columns are named
* Only columns with mean and std in then are then filtered out to form SubsetMeanStdData
* Average is calculated for all columns obtained in previous step for each subject and each activity type using dplyr package group_by and summarise functions
* The dataset - SubsetData - formed in previous is then saved as TidyDataSet