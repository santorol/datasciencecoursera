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

#Activities lookup table
Act_List<-read.delim("C:\\Users\\leonard.santoro\\Documents\\UCI HAR Dataset\\activity_labels.txt",sep="",header=FALSE)

#Appropriately labels the data set with descriptive variable names.  
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
#Colnames(TrainSet)<-c(paste("Sample",1:128))
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
colnames(TrainActivities)<-"id"
colnames(TestActivities)<-"id"
colnames(TrainSubjects)<-"Subject"
colnames(TestSubjects)<-"Subject"
colnames(Features)<-c("id","Feature")
colnames(TrainSet)<-Features$Feature
colnames(TestSet)<-Features$Feature
colnames(Act_List)<-c("id","Activity")



#First add a column to describe the data so when it is combined it will make sense
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
Body_Acc_testResults_y<-mutate(Body_Acc_testResults_y,Axis="y",Type="test",Signal="Body_Acc")
Body_Acc_testResults_x<-mutate(Body_Acc_testResults_x,Axis="x",Type="test",Signal="Body_Acc")


#Uses descriptive activity names to name the activities in the data set
#show the activity data in the data set, removing the ID numbers
trainActLst<-merge(TrainActivities,Act_List,by.x = "id",by.y="id")
trainActLst<-mutate(trainActLst,id=NULL)

testActLst<-merge(TestActivities,Act_List,by.x = "id",by.y="id")
testActLst<-mutate(testActLst,id=NULL)

#Add the Subject and Activity Columns
#Test
TestGyroReadings_z<-cbind(Gyro_testResults_z,TestSubjects,testActLst)
TestTotalInertialReadings_z<-cbind(Total_Acc_testResults_z,TestSubjects,testActLst)
TestAccReadings_z<-cbind(Body_Acc_testResults_z,TestSubjects,testActLst)

TestGyroReadings_y<-cbind(Gyro_testResults_y,TestSubjects,testActLst)
TestTotalInertialReadings_y<-cbind(Total_Acc_testResults_x,TestSubjects,testActLst)
TestAccReadings_y<-cbind(Body_Acc_testResults_y,TestSubjects,testActLst)

TestGyroReadings_x<-cbind(Gyro_testResults_x,TestSubjects,testActLst)
TestTotalInertialReadings_x<-cbind(Total_Acc_testResults_x,TestSubjects,testActLst)
TestAccReadings_x<-cbind(Body_Acc_testResults_x,TestSubjects,testActLst)

TrainGyroReadings_z<-cbind(Gyro_trainResults_z,TrainSubjects,trainActLst)
TrainTotalInertialReadings_z<-cbind(Total_Acc_trainResults_z,TrainSubjects,trainActLst)
TrainAccReadings_z<-cbind(Body_Acc_trainResults_z,TrainSubjects,trainActLst)

TrainGyroReadings_y<-cbind(Gyro_trainResults_z,TrainSubjects,trainActLst)
TrainTotalInertialReadings_y<-cbind(Total_Acc_trainResults_y,TrainSubjects,trainActLst)
TrainAccReadings_y<-cbind(Body_Acc_trainResults_y,TrainSubjects,trainActLst)

TrainGyroReadings_x<-cbind(Gyro_trainResults_x,TrainSubjects,trainActLst)
TrainTotalInertialReadings_x<-cbind(Total_Acc_trainResults_x,TrainSubjects,trainActLst)
TrainAccReadings_x<-cbind(Body_Acc_trainResults_x,TrainSubjects,trainActLst)


#Uses descriptive activity names to name the activities in the data set
#Test

#Merges the testing and the test sets to create one data set.
#Merge Inertial test and Test Data
inertialData<-rbind(TestGyroReadings_z,TestTotalInertialReadings_z,TestAccReadings_z,TestGyroReadings_y,TestTotalInertialReadings_y,
                    TestAccReadings_y,TestGyroReadings_x,TestTotalInertialReadings_x,TestAccReadings_x,TrainGyroReadings_z,
                    TrainTotalInertialReadings_z,TrainAccReadings_z,TrainGyroReadings_y,TrainTotalInertialReadings_y,
                    TrainAccReadings_y,TrainGyroReadings_x,TrainTotalInertialReadings_x,TrainAccReadings_x)


#Combine Results-Summary by columns - No key field so use cbind instead of merge
train_combined<-cbind(TrainSet,trainActLst,TrainSubjects)
test_combined<-cbind(TestSet,testActLst,TestSubjects)
Test_Train_Combined<-rbind(train_combined,test_combined)




#Extracts only the measurements on the mean and standard deviation for each measurement.
#find the names in the data that have the word mean or in them
mn_std<-Features[str_detect(Features$Feature,"mean|std"),]
Train_Mean_Std<-train_combined[which(names(train_combined) %in% mn_std$Feature)]
colnames(Train_Mean_Std)<-gsub("[[:punct:]]","",names(Train_Mean_Std))
Train_Mean_Std<-cbind(Train_Mean_Std,train_combined[c("Activity","Subject")])
Test_Mean_Std<-test_combined[which(names(test_combined) %in% mn_std$Feature)]
colnames(Test_Mean_Std)<-gsub("[[:punct:]]","",names(Test_Mean_Std))
Test_Mean_Std<-cbind(Test_Mean_Std,test_combined[c("Activity","Subject")])
TT_Mean_Std<-rbind(Train_Mean_Std,Test_Mean_Std)

#Housekeeping - Remove unneeded objects
rm(Act_List,"Body_Acc_testResults_x","Body_Acc_testResults_y","Body_Acc_testResults_z",
   "Body_Acc_trainResults_x","Body_Acc_trainResults_y","Body_Acc_trainResults_z","Features",                
   "Gyro_testResults_x","Gyro_testResults_y","Gyro_testResults_z","Gyro_trainResults_x",       
   "Gyro_trainResults_y","Gyro_trainResults_z" ,                              
   "test_combined",                "Test_Mean_Std",                "Test_Train_Combined",          "TestAccReadings_x",           
   "TestAccReadings_y" ,           "TestAccReadings_z"   ,         "TestActivities"    ,           "testActLst"   ,               
   "TestGyroReadings_x" ,          "TestGyroReadings_y" ,          "TestGyroReadings_z"  ,         "TestSet" ,                    
   "TestSubjects",                 "TestTotalInertialReadings_x" , "TestTotalInertialReadings_y",  "TestTotalInertialReadings_z" ,
   "Total_Acc_testResults_x" ,     "Total_Acc_testResults_y",      "Total_Acc_testResults_z" ,     "Total_Acc_trainResults_x" ,   
   "Total_Acc_trainResults_y"  ,   "Total_Acc_trainResults_z"  ,   "train_combined",  "Train_Mean_Std",              
   "TrainAccReadings_x"     ,      "TrainAccReadings_y"  ,         "TrainAccReadings_z",           "TrainActivities"  ,           
   "trainActLst" ,                 "TrainGyroReadings_x" ,         "TrainGyroReadings_y" ,         "TrainGyroReadings_z"   ,      
   "TrainSet" ,                    "TrainSubjects",                "TrainTotalInertialReadings_x", "TrainTotalInertialReadings_y",
   "TrainTotalInertialReadings_z")

mn_std$Feature<-gsub("[[:punct:]]","",mn_std$Feature)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Get the Average for each variable by activity by subject
cnt<-0
for (s in unique(TT_Mean_Std$Subject)){
  for (a in unique(TT_Mean_Std$Activity))
  {
    AvgTT_temp<-as.data.frame(lapply(select(filter(TT_Mean_Std,Subject==s , Activity==a),-(80:81)),mean))
    if (complete.cases(AvgTT_temp)){
      AvgTT_temp<-cbind(AvgTT_temp,"Subject"=s,"Activity"=a)
      if (cnt==0)
        AvgTT<-AvgTT_temp
      else AvgTT<-rbind(AvgTT,AvgTT_temp) 
      cnt=cnt+1 
    }
    cnt=cnt+1
  }
  cnt=cnt+1
}

#Find the 
#Write it to a file
AvgTT<- arrange(AvgTT,Subject,Activity)
write.table(AvgTT,"Avg_TT",row.name=FALSE)


  
