#library required

libray(plyr)

# read of columnames and activity names

colnombres <- read.table("./UCI HAR Dataset/features.txt")
actividades <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(actividades) <- c("ID", "ACTIVIDAD")

#Remove special characters

colnombres[,2] <- gsub("[-(),.]", " ", colnombres[,2])

#trim

colnombres[,2] <- gsub("^\\s+|\\s+$", "", colnombres[,2])

# building train set

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

#colum names of train

names(subject_train)<-"sujeto"
names(X_train) <- t(colnombres[2])
names(Y_train) <- "ID_ACTIVIDAD"

#create TRAIN

TRAIN <- cbind(subject_train, Y_train, X_train)

#building test set

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

#colum names of test

names(subject_test)<-"sujeto"
names(X_test) <- t(colnombres[2])
names(Y_test) <- "ID_ACTIVIDAD"

#create TEST

TEST <- cbind(subject_test, Y_test, X_test)

#build DATA with test and train

DATA <- rbind(TRAIN, TEST) 

#Convert Activity labels in y_train.txt and y_test.txt to meaningful names like

DATA <- merge(DATA,actividades,by.x = "ID_ACTIVIDAD",by.y="ID")

#Extracts data with mean and std in the variable names

FINAL_DATA<- cbind(DATA$sujeto,DATA$ACTIVIDAD,DATA[,grep("mean|std",names(DATA))])
names(FINAL_DATA)[1:2]<-c("sujeto","ACTIVIDAD")

#Computes col averages and groups by Subject and Activity

FICHERO <- ddply(FINAL_DATA, .(sujeto, ACTIVIDAD), colwise(mean))

#Writes a text file

write.csv(FICHERO, file="FICHERO.csv", row.names=FALSE)

