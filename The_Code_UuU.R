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

y_Test  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
y_Train <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

SubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

x_Test  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
x_Train <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

