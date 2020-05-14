library(plyr)

# reading training data
x_train<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/train/subject_train.txt")

# reading test data
x_test<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/test/subject_test.txt")


# reading feature vector
features<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/features.txt")

# reading activity label
activitylabel<-read.table("C:/Users/manu/Desktop/Data/UCI HAR Dataset/activity_labels.txt")


# Assiging variable names
colnames(x_train)<-features[,2]
colnames(y_train)<-"activityID"
colnames(subject_train)<-"subjectId"


colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectId"

colnames(activitylabel) <- c("activityID", "activityType")

# Merging all datasets into one
all_train<-cbind(y_train,subject_train,x_train)
all_test<-cbind(y_test,subject_test,x_test)

finaldata<-rbind(all_train,all_test)


# Extracting  only measurmene of the mean and sd for each meaurment
colNames<-colnames(finaldata)

mean_and_std<-(grepl("activityID",colNames)|
                 grepl("subjectId",colNames)|
                 grepl("mean...",colNames)|
                 grepl("sd...",colNames)
)
setforMeanandStd <- finaldata[ , mean_and_std == TRUE]


# descriptive Anaylsis
setWithActivityNames <- merge(setforMeanandStd,activitylabel,
                              by = "activityID",
                              all.x = TRUE)

# label data set with descriptive varibale Names
# already Done



# 5. Creating a second,  independent tidy data set with the avg of each variable for each activity and subject
tidySet <- aggregate(. ~subjectId + activityID, setWithActivityNames, mean)
tidySet <- tidySet[order(tidySet$subjectId, tidySet$activityID), ]
write.table(tidySet, "tidySet.txt", row.names = FALSE)
