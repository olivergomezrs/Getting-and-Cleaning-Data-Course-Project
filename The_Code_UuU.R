# code to the coursera cleaning data course in R :)

#1 install reshape2
library(reshape2)


#2 getting data because if we gonna clean data, first, we need data to clean :0
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

#3 Read data

y_test  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
y_train <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

SubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

x_test  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
x_train <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#4 Mix the data (Merge)

Subject <- rbind(SubjectTrain, SubjectTest)
Activity<- rbind(y_train, y_test)
Features<- rbind(x_train, x_test)

names(Subject)<-c("subject")
names(Activity)<- c("activity")
FeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(Features)<- dataFeaturesNames$V2

Combine <- cbind(Subject, Activity)
Data <- cbind(Features, Combine)

#Extract mean and standard deviation

subdataFeaturesNames<-FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

str(Data)



