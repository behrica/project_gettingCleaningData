library(plyr)
makeDataset <- function(trainOrTest) {
  
  data <- read.delim(sprintf("UCI HAR Dataset//%s//X_%s.txt",trainOrTest,trainOrTest),sep="",header=F)
  activities <- read.table(sprintf("UCI HAR Dataset//%s/y_%s.txt",trainOrTest,trainOrTest))[[1]]
  activities.factor <- factor(activities,labels=activities.labels)
  subjects <- read.table(sprintf("UCI HAR Dataset//%s//subject_%s.txt",trainOrTest,trainOrTest))[[1]]
  subjects.factor <- factor(subjects)
  #name measurement columns
  colnames(data) <- features
  
  #add activity column as factor
  data <- cbind(activity = activities.factor,data)
  #add subject column as factor
  data <- cbind(subject = subjects.factor,data)
  data
}

features <- read.delim("UCI HAR Dataset//features.txt",sep="",header=F)[[2]]
features <- make.names(features)
features <- gsub("...",".",features,fixed=T)
features <- gsub("..",".",features,fixed=T)
features <- gsub("\\.$","",features)

activities.labels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#merge training and test
data.train <- makeDataset("train")
data.test <- makeDataset("test")
data.all <- rbind(data.train,data.test)

#retain "std" and "mean" columns
features.to.retain <- grep("mean\\.|mean$|std\\.|std$",features,value=T)
data <- data.all[,c("subject","activity",features.to.retain)]

#make seperate data frame of averages per subject and actvity
data.averages <- ddply(data,.(subject,activity),numcolwise(mean))

#reorder levels for subject
data.averages$subject <- factor(data.averages$subject,levels = 1:100)

#reorder dataset by subject and activity
data.tidy <- arrange(data.averages,subject,activity)

write.csv(data.tidy,file='tidyData.txt')

