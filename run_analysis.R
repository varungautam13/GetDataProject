library(dplyr)

## obtaining list of Train and Test files available in their respective folders

Trainpath <- "train"
Testpath <- "test"
TrainingFiles <- list.files(Trainpath)
TestFiles <- list.files(Testpath)

## Reading all of the Training Data files and binding them columnwise to obtain
## a combined Training Data set
TrainList <- lapply(file.path(Trainpath,TrainingFiles),read.table,header=F,sep="")
TrainData<- do.call("cbind",TrainList)

## Reading all of the Test Data files and binding them columnwise to obtain
## a combined Test Data set
TestList <- lapply(file.path(Testpath,TestFiles),read.table,header=F,sep="")
TestData<- do.call("cbind",TestList)

## Merging Train and Test Data set to obtain a complete data set
CompleteData <- rbind(TrainData,TestData)

## Reading activity labels and Features file
ActivityLabel <- read.table("activity_labels.txt",header=F,sep="")
names(ActivityLabel) <- c("Activity","Type")
Features <- read.table("features.txt",header=F,sep="")

## Naming the columns of complete data set based on features
names(CompleteData) <- c("Subject",paste(Features[,1],Features[,2]),"Activity")

## Subsetting the completed data set to obtain Mean and Standard Deviation data for each observation
SubsetMeanStdData <- CompleteData %>% select(contains("mean"),contains("std"),Subject,Activity)

## Adding activity type to the subset data and removing the activity ID
SubsetMeanStdData<-inner_join(SubsetMeanStdData,ActivityLabel,by="Activity")
SubsetMeanStdData <- SubsetMeanStdData %>% select(-Activity)

## Creating a subset calcualting average of each variable for each activity for each subject
SubsetData <- SubsetMeanStdData %>% group_by(Subject,Type) %>% summarise_each(funs(mean))

## writing subset to a text file
write.table(SubsetData,file="TidyDataSet.txt",row.names=F)