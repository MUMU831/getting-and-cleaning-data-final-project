#set your directory to store the downloaded and processed data
setwd("~/Desktop/coursera")

#Download and extrat the raw data
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile=paste("~/Desktop/coursera","UCI-HAR-Dataset.zip",sep = "/")
download.file(url,zipfile,method = "curl")
unzip(zipfile)

#install.packages("dplyr")
library(dplyr)

#Merges the training and the test sets to create one data set.
read.dataset<-function(xfilename,yfilename,subjectfilename) {
    df=read.table(xfilename)
    dfy=read.table(yfilename)
    dfs=read.table(subjectfilename)
    df=mutate(df,subject=as.integer(dfs$V1))
    df=mutate(df,activity=as.factor(dfy$V1))
}

trainset=read.dataset("./UCI HAR Dataset/train/X_train.txt","./UCI HAR Dataset/train/y_train.txt","./UCI HAR Dataset/train/subject_train.txt")
testset=read.dataset("./UCI HAR Dataset/test/X_test.txt", "./UCI HAR Dataset/test/y_test.txt","./UCI HAR Dataset/test/subject_test.txt")

data=rbind(testset,trainset)
summary(data)

#Extracts only the measurements on the mean and standard deviation for each measurement.
#read the feature labels
feature.labels=read.table("./UCI HAR Dataset/features.txt")
feature.labels=mutate(feature.labels,varname=paste0("V",V1))
#select only feature labels that contrain mean or std (case insensitive) AND not angle measurements
filtered.feature.labels=filter(feature.labels,grepl('(mean|std)',V2, ignore.case = T)&!grepl('^angle\\(',V2))
vars=c(filtered.feature.labels$varname,c("subject","activity"))
data2=select(data,one_of(vars))
names(data2)
summary(data2)

#Uses descriptive activity names to name the activities in the data set
#read the activity labels
activity.labels=read.table("./UCI HAR Dataset/activity_labels.txt")
#transform the activity column into a factor
activityf=factor(data2$activity,levels = activity.labels$V1, labels=activity.labels$V2)
data3=mutate(data2,activity=activityf)
summary(data3)

#Appropriately labels the data set with descriptive variable names.
library(data.table)
oldnames=filtered.feature.labels$varname
newnames=as.character(filtered.feature.labels$V2)
setnames(data3,oldnames,newnames)
names(data3)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
#group by subject and activity
data.melt=melt(data3,id=c("subject","activity"),measure.vars=1:79)
mean.data=dcast(data.melt,subject+activity~variable,mean)
#transform names
oldnames=names(mean.data)[3:length(names(mean.data))]
newnames=as.character(sapply(oldnames, function(n) paste0("subject-activity-mean",n)))
setnames(mean.data,oldnames,newnames)
head(mean.data,n=3)
