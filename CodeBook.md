# Getting and Cleaning Data - Course Project

## Files
The script run_analysis.R peforms transformation usinf the following files:
* X_train - training dataset 
* y_train - training activity type datset listing all activities performed by subjects (1:6)
* subject_train - training subject datset listing subject (1:30)
* X_test - test dataset
* y_test - test activity type datset listing all activities performed by subjects (1:6)
* subject_test - test subject datset listing subject (1:30)
* activity_labels - activity label datset lisitng names for each activity type
* features - feature names datset listing names for all observations

The transformed data file generated after the operations is called 
* TidyDataSet - it contains average of all observations grouped by each subject and each activity type

## Variables and Operations
* X_train,y_train and subject_train text files are combined together to form a train datset- TrainData (dataframe)
* X_test,y_test,subject_test text files are combined to form a test dataset - TestData (dataframe)
* Train and Test are then combined to form a complete datset - CompleteData (dataframe)
* Using features dataset, the combined dataset columns are named (all the observations get an associated name)
* Only columns with mean and std in then are then filtered out to form a dataframe SubsetMeanStdData. This is done by using dplyr package.
* Activity Labels are also merged in the combined dataset so that each row can be associted with a label indicating the activity type with Type Column name
* Average is calculated for all columns obtained in previous step - SubsetData - for each subject and each activity type using dplyr package group_by and summarise functions
* SubsetData is then saved as a text file named - TidyDataSet
* The dataset - SubsetData - formed in previous is then saved as TidyDataSet
