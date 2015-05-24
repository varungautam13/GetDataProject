# Getting and Cleaning Data - Course Project
The repository contains the following files for Getting and Cleaning Data - Course Project. This project is part of Data Science Specialization available in Coursera:
* run_analysis.R - R Code file - for carrying out data transformation
* CodeBook.md - Code book describing the variables and data used for transformation

The dataset being used is:Human Activity Recognition using SmartPhone

## R COde Details
run_analysis files does the following opeartions based on the assumption that text files are placed in the working directory:
* The working directory consists of two folders- Train and Test hosting required files. The code reads all the files from respective folders.
* All the train files are combined using cbind() and the same is done for test files.
* Train and Test files are then combined as a completed dataset using rbind()
* Activity Label and Feature files are then read into separate variables.
* Feature is used to name the columns of the combined dataset, out of which only columns with mean and standard deviation are selected
* Activity label is also included in the completed dataset 
* Mean is calculated for each observation for each of the subject for each activity.
* The dataset thus obtained is saved as a test file.