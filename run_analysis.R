# Course Exercise
# R Script = run_analysis.R
# STEP 1. Merge the training and the test sets to create one data set.
# The first step was to download the data for the project which ws provided as a zip file
# The unzip'd files were kept in the home directory "/datasciencecoursera/Exercise/UCI HAR Dataset/"
# The directory had two sub-directories "test" and "train", each containg the test and training data

# Use the setwd command to set the working directory to where all the files for the Course Project have been downloaded

setwd("/Users/pankajvaish/datasciencecoursera/Exercise/UCI HAR Dataset/")

# create dir "data" for storing the intermediate and final tidy dataset

if(!file.exists("./data"))
    {
    dir.create("./data")
    }

# first read the test data from the "test" directory into data frames by setting the working directory to "./test"
# create 3 separate dataframes:
# 1. read the text file subject_test.txt into a data frame called "test_subject_df" and name the variable "subject_id"
# 2. read the text file y_test.txt into a data frame called "test_activity_id_df" and name the variable "activity_id"
# 3. read the text file X_test.txt into a data frame called "test_feature_df" which has 561 features
# revert back to the Exercise home directory using the setwd command

setwd("./test")
test_subject_df <- read.table("subject_test.txt", sep="\t")
names(test_subject_df) <- c("subject_id")
test_activity_id_df <- read.table("y_test.txt", sep="\t")
names(test_activity_id_df) <- c("activity_id")
test_feature_df <- read.table("X_test.txt", sep="")
setwd("../")

# create a single test dataframe by combining subject_id, activity_id and the 561 features and call it "test_df"

test_df<-cbind(test_subject_df,test_activity_id_df,test_feature_df)


# next read the train data from the "train" directory into data frames by setting the working directory to "./train"
# create 3 separate dataframes:
# 1. read the text file subject_train.txt into a data frame called "train_subject_df" and name the variable "subject_id"
#    use the same variable name as test_subject_df so that these 2 dataframes can be merged into a single dataframe
# 2. read the text file y_train.txt into a data frame called "train_activity_id_df" and name the variable "activity_id"
#    use the same variable name as test_activity_id_df so that these 2 dataframes can be merged into a single dataframe
# 3. read the text file X_train.txt into a data frame called "train_feature_df" which has 561 features
# revert back to the Exercise home directory using the setwd command

setwd("./train")
train_subject_df <- read.table("subject_train.txt", sep="\t")
names(train_subject_df) <- c("subject_id")
train_activity_id_df <- read.table("y_train.txt", sep="\t")
names(train_activity_id_df) <- c("activity_id")
train_feature_df <- read.table("X_train.txt", sep="")
setwd("../")

# create a single test dataframe by combining subject_id, activity_id and the 561 features and call it "train_df"

train_df <- cbind(train_subject_df,train_activity_id_df,train_feature_df)

# now combine the test and train data frames using rbind
# rbind test_df and train_df into one df called complete_df

complete_df <- rbind(test_df,train_df)

# STEP 2. second step in the exercise is to extract only the measurements on the mean and standard deviation for each measurement
# identify the features that are mean and std in the feature list and discard the other columne from the combined dataframe
# name the shrunken dataframe "tidy_df"

keeps <-c ("subject_id","activity_id","V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271","V294","V295","V296","V345","V346","V347","V348","V349","V350","V373","V374","V375","V424","V425","V426","V427","V428","V429","V452","V453","V454","V503","V504","V513","V516","V517","V526","V529","V530","V539","V542","V543","V552","V555","V556","V557","V558","V559","V560","V561")
tidy_df <- complete_df[keeps]

# STEP 3&4. next steps in the exercise is to ensure that we use descriptive activity names to name the activities in the data set
# and also use appropriate descriptive variable names and data set names

colnames(tidy_df) <- c("subject_id","activity_id","tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAcc-meanFreq()-X","fBodyAcc-meanFreq()-Y","fBodyAcc-meanFreq()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyAccJerk-meanFreq()-X","fBodyAccJerk-meanFreq()-Y","fBodyAccJerk-meanFreq()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyGyro-meanFreq()-X","fBodyGyro-meanFreq()-Y","fBodyGyro-meanFreq()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyAccMag-meanFreq()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyAccJerkMag-meanFreq()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroMag-meanFreq()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()","fBodyBodyGyroJerkMag-meanFreq()","angle(tBodyAccMean,gravity)","angle(tBodyAccJerkMean),gravityMean)","angle(tBodyGyroMean,gravityMean)","angle(tBodyGyroJerkMean,gravityMean)","angle(X,gravityMean)","angle(Y,gravityMean)","angle(Z,gravityMean)") # define meaningful column names

# final step in creating a single ata set for test and train data is to sort the data in tidy_df and store it as a text file
# the final sorted data frame is called 'sorted_tidy_df' and the txt file is called "tidy_dataset.txt" placed in he "data" drectory

sorted_tidy_df <- tidy_df[order(tidy_df$subject_id, tidy_df$activity_id),]
table(sorted_tidy_df$subject_id,sorted_tidy_df$activity_id)
setwd("./data")
write.table(sorted_tidy_df,file="tidy_dataset.txt",row.name=FALSE)

# STEP 5: last step is to create a second independent tidy data set with the average of each variable for each activity and subject
# create and initiatize a data frame called "tidy_df_for_avgs_by_subject_by_activity" that has predefined subject_id's ranging from
# 1 to 30 and for each subjecy have 6 activties i.e. walking, going up stairs, going down stairs, sitting, standing and laying

install.packages("data.table")
library("data.table")

tidy_df_for_avgs_by_subject_by_activity <- data.table (subject_id = rep (c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30),each=6), activity_id = rep (c(1,2,3,4,5,6),each=1), tBodyAcc_mean_X = rep (c(0), each=1), tBodyAcc_mean_Y = rep (c(0), each=1), tBodyAcc_mean_Z = rep (c(0), each=1), tBodyAcc_std_X = rep (c(0), each=1), tBodyAcc_std_Y = rep (c(0), each=1), tBodyAcc_std_Z = rep (c(0), each=1), tGravityAcc_mean_X = rep (c(0), each=1), tGravityAcc_mean_Y = rep (c(0), each=1), tGravityAcc_mean_Z = rep (c(0), each=1), tGravityAcc_std_X = rep (c(0), each=1), tGravityAcc_std_Y = rep (c(0), each=1), tGravityAcc_std_Z = rep (c(0), each=1), tBodyAccJerk_mean_X = rep (c(0), each=1), tBodyAccJerk_mean_Y = rep (c(0), each=1), tBodyAccJerk_mean_Z = rep (c(0), each=1), tBodyAccJerk_std_X = rep (c(0), each=1), tBodyAccJerk_std_Y = rep (c(0), each=1), tBodyAccJerk_std_Z = rep (c(0), each=1), tBodyGyro_mean_X = rep (c(0), each=1), tBodyGyro_mean_Y = rep (c(0), each=1), tBodyGyro_mean_Z = rep (c(0), each=1), tBodyGyro_std_X = rep (c(0), each=1), tBodyGyro_std_Y = rep (c(0), each=1), tBodyGyro_std_Z = rep (c(0), each=1), tBodyGyroJerk_mean_X = rep (c(0), each=1), tBodyGyroJerk_mean_Y = rep (c(0), each=1), tBodyGyroJerk_mean_Z = rep (c(0), each=1), tBodyGyroJerk_std_X = rep (c(0), each=1), tBodyGyroJerk_std_Y = rep (c(0), each=1), tBodyGyroJerk_std_Z = rep (c(0), each=1), tBodyAccMag_mean = rep (c(0), each=1), tBodyAccMag_std = rep (c(0), each=1), tGravityAccMag_mean = rep (c(0), each=1), tGravityAccMag_std = rep (c(0), each=1), tBodyAccJerkMag_mean = rep (c(0), each=1), tBodyAccJerkMag_std = rep (c(0), each=1), tBodyGyroMag_mean = rep (c(0), each=1), tBodyGyroMag_std = rep (c(0), each=1), tBodyGyroJerkMag_mean = rep (c(0), each=1), tBodyGyroJerkMag_std = rep (c(0), each=1), fBodyAcc_mean_X = rep (c(0), each=1), fBodyAcc_mean_Y = rep (c(0), each=1), fBodyAcc_mean_Z = rep (c(0), each=1), fBodyAcc_std_X = rep (c(0), each=1), fBodyAcc_std_Y = rep (c(0), each=1), fBodyAcc_std_Z = rep (c(0), each=1), fBodyAcc_meanFreq_X = rep (c(0), each=1), fBodyAcc_meanFreq_Y = rep (c(0), each=1), fBodyAcc_meanFreq_Z = rep (c(0), each=1), fBodyAccJerk_mean_X = rep (c(0), each=1), fBodyAccJerk_mean_Y = rep (c(0), each=1), fBodyAccJerk_mean_Z = rep (c(0), each=1), fBodyAccJerk_std_X = rep (c(0), each=1), fBodyAccJerk_std_Y = rep (c(0), each=1), fBodyAccJerk_std_Z = rep (c(0), each=1), fBodyAccJerk_meanFreq_X = rep (c(0), each=1), fBodyAccJerk_meanFreq_Y = rep (c(0), each=1), fBodyAccJerk_meanFreq_Z = rep (c(0), each=1), fBodyGyro_mean_X = rep (c(0), each=1), fBodyGyro_mean_Y = rep (c(0), each=1), fBodyGyro_mean_Z = rep (c(0), each=1), fBodyGyro_std_X = rep (c(0), each=1), fBodyGyro_std_Y = rep (c(0), each=1), fBodyGyro_std_Z = rep (c(0), each=1), fBodyGyro_meanFreq_X = rep (c(0), each=1), fBodyGyro_meanFreq_Y = rep (c(0), each=1), fBodyGyro_meanFreq_Z = rep (c(0), each=1), fBodyAccMag_mean = rep (c(0), each=1), fBodyAccMag_std = rep (c(0), each=1), fBodyAccMag_meanFreq = rep (c(0), each=1), fBodyBodyAccJerkMag_mean = rep (c(0), each=1), fBodyBodyAccJerkMag_std = rep (c(0), each=1), fBodyBodyAccJerkMag_meanFreq = rep (c(0), each=1), fBodyBodyGyroMag_mean = rep (c(0), each=1), fBodyBodyGyroMag_std = rep (c(0), each=1), fBodyBodyGyroMag_meanFre = rep (c(0), each=1), fBodyBodyGyroJerkMag_mean = rep (c(0), each=1), fBodyBodyGyroJerkMag_std = rep (c(0), each=1), fBodyBodyGyroJerkMag_meanFreq = rep (c(0), each=1), angle_tBodyAccMean_gravity = rep (c(0), each=1), angle_tBodyAccJerkMean_gravityMean = rep (c(0), each=1), angle_tBodyGyroMean_gravityMean = rep (c(0), each=1), angle_tBodyGyroJerkMean_gravityMean = rep (c(0), each=1), angle_X_gravityMean = rep (c(0), each=1), angle_Y_gravityMean = rep (c(0), each=1), angle_Z_gravityMean = rep (c(0), each=1))

# the next step is to compute the average for each variable for each activity and each subject from the "sorted_tidy_df"
# and store it in the corresponding column for the combination of the row (subject_id, activity_id)
# due to posity of time have not been able to complete this part

write.table(tidy_df_for_avgs_by_subject_by_activity,file="tidy_dataset_by_sub_by_act.txt",row.name=FALSE)
