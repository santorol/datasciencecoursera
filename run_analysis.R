#This code will take the Samsung Smart Phone "Human Activity" data and adjust the data into a data set
#that is cleaned and tidy

#Read the data
#train Data
Gyro_trainResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt",sep="",header=FALSE)
Gyro_trainResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt",sep="",header=FALSE)
Gyro_trainResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_X_train.txt",sep="",header=FALSE)
Total_Acc_trainResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt",sep="",header=FALSE)
Total_Acc_trainResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt",sep="",header=FALSE)
Total_Acc_trainResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_X_train.txt",sep="",header=FALSE)
Body_Acc_trainResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt",sep="",header=FALSE)
Body_Acc_trainResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt",sep="",header=FALSE)
Body_Acc_trainResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_X_train.txt",sep="",header=FALSE)

#Test Data
Gyro_testResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt",sep="",header=FALSE)
Gyro_testResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt",sep="",header=FALSE)
Gyro_testResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_X_test.txt",sep="",header=FALSE)
Total_Acc_testResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt",sep="",header=FALSE)
Total_Acc_testResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt",sep="",header=FALSE)
Total_Acc_testResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_X_test.txt",sep="",header=FALSE)
Body_Acc_testResults_z<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt",sep="",header=FALSE)
Body_Acc_testResults_y<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt",sep="",header=FALSE)
Body_Acc_testResults_x<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_X_test.txt",sep="",header=FALSE)

#Feature Vectors -Train
TrainSet<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\X_train.txt",sep="",header=FALSE)
TrainSubjects<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\subject_train.txt",sep="",header=FALSE)
TrainActivities<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\train\\y_train.txt",sep="",header=FALSE)

#Feature Vectors -Test
TestSet<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\X_test.txt",sep="",header=FALSE)
TestSubjects<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\subject_test.txt",sep="",header=FALSE)
TestActivities<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\test\\y_test.txt",sep="",header=FALSE)

#Features
Features<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\features.txt",sep="",header=FALSE)

  
#Fix column names - Each column is a sensor reading- there are 128 sensor readings per row
#train
colnames(Gyro_trainResults_z)<-c(paste("Sample",1:128))
colnames(Gyro_trainResults_y)<-c(paste("Sample",1:128))
colnames(Gyro_trainResults_x)<-c(paste("Sample",1:128))
colnames(Total_Acc_trainResults_z)<-c(paste("Sample",1:128))
colnames(Total_Acc_trainResults_y)<-c(paste("Sample",1:128))
colnames(Total_Acc_trainResults_x)<-c(paste("Sample",1:128))
colnames(Body_Acc_trainResults_z)<-c(paste("Sample",1:128))
colnames(Body_Acc_trainResults_y)<-c(paste("Sample",1:128))
colnames(Body_Acc_trainResults_x)<-c(paste("Sample",1:128))
colnames(TrainSet)<-c(paste("Sample",1:128))
#Test
colnames(Gyro_testResults_z)<-c(paste("Sample",1:128))
colnames(Gyro_testResults_y)<-c(paste("Sample",1:128))
colnames(Gyro_testResults_x)<-c(paste("Sample",1:128))
colnames(Total_Acc_testResults_z)<-c(paste("Sample",1:128))
colnames(Total_Acc_testResults_y)<-c(paste("Sample",1:128))
colnames(Total_Acc_testResults_x)<-c(paste("Sample",1:128))
colnames(Body_Acc_testResults_z)<-c(paste("Sample",1:128))
colnames(Body_Acc_testResults_y)<-c(paste("Sample",1:128))
colnames(Body_Acc_testResults_x)<-c(paste("Sample",1:128))

#Features
colnames(TrainActivities)<-"Activity"
colnames(TestActivities)<-"Activity"
colnames(TrainSubjects)<-"Subject"
colnames(TestSubjects)<-"Subject"
colnames(TrainSet)<-Features$V2
colnames(TestSet)<-Features$V2

#Combined Inertial Sensor Readings- No key field so use cbind instead of merge
#Train
TestInertialReadings<-cbind(Gyro_testResults_z,Gyro_testResults_y,Gyro_testResults_x,TestSubjects,TestActivities)
trainInertialReadings<-cbind(Gyro_trainResults_z,Gyro_trainResults_y,Gyro_trainResults_x,TrainSubjects,TrainActivities)
#Test


#Combine Results-Summary by columns - No key field so use cbind instead of merge
test_combined<-cbind(TrainSet,TrainActivities,TrainSubjects)
train_combined<-cbind(TestSet,TestActivities,TestSubjects)

#Add columns so that the data can later be combined by rows
Gyro_trainResults_z<-mutate(Gyro_trainResults_z,Axis="z",Type="train",Signal="Gyro")
Gyro_trainResults_y<-mutate(Gyro_trainResults_y,Axis="y",Type="train",Signal="Gyro")
Gyro_trainResults_x<-mutate(Gyro_trainResults_x,Axis="x",Type="train",Signal="Gyro")
Gyro_testResults_z<-mutate(Gyro_testResults_z,Axis="z",Type="test",Signal="Gyro")
Gyro_testResults_y<-mutate(Gyro_testResults_y,Axis="y",Type="test",Signal="Gyro")
Gyro_testResults_x<-mutate(Gyro_testResults_x,Axis="x",Type="test",Signal="Gyro")

Total_Acc_trainResults_z<-mutate(Total_Acc_trainResults_z,Axis="z",Type="train",Signal="Total_Acc")
Total_Acc_trainResults_y<-mutate(Total_Acc_trainResults_y,Axis="y",Type="train",Signal="Total_Acc")
Total_Acc_trainResults_x<-mutate(Total_Acc_trainResults_x,Axis="x",Type="train",Signal="Total_Acc")
Total_Acc_testResults_z<-mutate(Total_Acc_testResults_z,Axis="z",Type="test",Signal="Total_Acc")
Total_Acc_testResults_y<-mutate(Total_Acc_testResults_y,Axis="y",Type="test",Signal="Total_Acc")
Total_Acc_testResults_x<-mutate(Total_Acc_testResults_x,Axis="x",Type="test",Signal="Total_Acc")

Body_Acc_trainResults_z<-mutate(Body_Acc_trainResults_z,Axis="z",Type="train",Signal="Body_Acc")
Body_Acc_trainResults_y<-mutate(Body_Acc_trainResults_y,Axis="y",Type="train",Signal="Body_Acc")
Body_Acc_trainResults_x<-mutate(Body_Acc_trainResults_x,Axis="x",Type="train",Signal="Body_Acc")
Body_Acc_testResults_z<-mutate(Body_Acc_testResults_z,Axis="z",Type="test",Signal="Body_Acc")
Body_Acc_testResultss_y<-mutate(Body_Acc_testResults_y,Axis="y",Type="test",Signal="Body_Acc")
Body_Acc_testResultss_x<-mutate(Body_Acc_testResults_x,Axis="x",Type="test",Signal="Body_Acc")


#Merges the testing and the test sets to create one data set.



#Merge Inertial test and Test Data


#First add a column to describe the data so when it is combined it will make sense



#Extracts only the measurements on the mean and standard deviation for each measurement.

#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names.


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

