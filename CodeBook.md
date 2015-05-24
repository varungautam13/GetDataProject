# Getting and Cleaning Data - Course Project

## Files
The script run_analysis.R peforms transformation usinf the following files:
* X_train - training dataset containing different variables for all trainign observations
* y_train - training activity type datset listing all activities performed by subjects (1:6)
* subject_train - training subject datset listing subject (1:30)
* X_test - test dataset containing different variables for all trainign observation
* y_test - test activity type datset listing all activities performed by subjects (1:6)
* subject_test - test subject datset listing subject (1:30)
* activity_labels - activity label datset lisitng names for each activity type
* features - feature names datset listing names for all observations

The transformed data file generated after the operations is called 
* TidyDataSet - it contains average of all observations grouped by each subject and each activity type

## Variables and Operations
* X_train,y_train and subject_train text files are combined together (column wise) to form a train datset- TrainData (dataframe). The subject_train and y_train columns are named as Subject and Activity respectivley.
* X_test,y_test,subject_test text files are combined 9column wise) to form a test dataset - TestData (dataframe). The subject_test and y_test columns are named as Subject and Activity respectivley.
* Train and Test are then combined (row wise) to form a complete datset - CompleteData (dataframe)
* Using features dataset, the combined dataset columns are named (all the observations get an associated name)
* Only columns with mean and std in then are then filtered out to form a dataframe SubsetMeanStdData. This is done by using dplyr package (select function).
* Activity Labels are also merged in the combined dataset (using inner_join - dplyr package) so that each row can be associted with a label indicating the activity type.The name of column is Type. Activity column with numeric values in it is removed.
* Average is calculated for all variables of dataset obtained in previous step - SubsetData - for each subject and each activity type using dplyr package group_by and summarise functions.
* SubsetData is then saved as a text file named - TidyDataSet
* The dataset - SubsetData - formed in previous is then saved as TidyDataSet
