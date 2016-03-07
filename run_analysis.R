
pathWD <- "C:\\Users\\Arash\\OneDrive\\EDU\\Coursera\\3.GettingandCleaningData"
setwd(pathWD) # setting the working directory
# making a project folder
if(!file.exists("./assignment4ProjectData")){dir.create("./assignment4ProjectData")}
# downloading the zip file
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./assignment4ProjectData/data.zip", method = "libcurl")
# extracting the downloaded zip file in the project folder
unzip("./assignment4ProjectData/data.zip", exdir = "./assignment4ProjectData")

# reading feature(variable) names
features = read.table("./assignment4ProjectData/UCI HAR Dataset/features.txt")

varNames = as.character(features[ , 2]) # converting factor class to char class

# reading activity types (1 through 6) with the associated descriptions
activity_labels = read.table("./assignment4ProjectData/UCI HAR Dataset/activity_labels.txt")

# reading subject IDs for the test data set
subject_test = read.table("./assignment4ProjectData/UCI HAR Dataset/test/subject_test.txt")

names(subject_test) <- "subjectID" # labelling the variable with a descriptive name.

# reading features (variables) of the test data set
X_test = read.table("./assignment4ProjectData/UCI HAR Dataset/test/X_test.txt") 

names(X_test) <- varNames # labelling the variables with descriptive names.

# reading labels of the test data set
y_test = read.table("./assignment4ProjectData/UCI HAR Dataset/test/y_test.txt") 

names(y_test) <- "label" # labelling the variable with a descriptive name.

# reading subject IDs for the train data set
subject_train = read.table("./assignment4ProjectData/UCI HAR Dataset/train/subject_train.txt")

names(subject_train) <- "subjectID" # labelling the variable with a descriptive name.

# reading features (variables) of the train data set
X_train = read.table("./assignment4ProjectData/UCI HAR Dataset/train/X_train.txt")

names(X_train) <- varNames # labelling the variables with descriptive names.

# reading labels of the train data set
y_train = read.table("./assignment4ProjectData/UCI HAR Dataset/train/y_train.txt")  

names(y_train) <- "label" # labelling the variable with a descriptive name.

# combining the label, subject ID, and the features of the test data set
data_test = cbind(y_test, subject_test, X_test)

# combining the label, subject ID, and the features of the train data set
data_train = cbind(y_train, subject_train, X_train)

# combining the test and train data sets
data_total = rbind(data_test, data_train)

# finding column indices where mean was measured (searching the key word mean in variable names)
colIndxMean = grep("[Mm][Ee][Aa][nN]", names(data_total))

# finding column indices where std was measured (searching the key word std in variable names)
colIndxStd = grep("[Ss][Tt][Dd]", names(data_total)) 

colIndxMeanStd = union(colIndxMean, colIndxStd) # column indeces where mean or std was measured
data_extract = data_total[ , c(1, 2, colIndxMeanStd)] # extracting the required data, 
                                                      # keeping columns 1 (label) and 2 (subject ID)

table(data_extract$label) # making sure there are only 6 activity types

# creating a categorical variable to present descriptive activity names
labelCat = factor(data_extract$label, levels = c(1, 2, 3, 4, 5, 6), labels = 
                          as.character(activity_labels[1:6, 2]))

# adding the categorical variable created in the previous step to the extracted data 
# to have the final data set
data_final <- cbind(labelFactor = labelCat, data_extract)

# converting the integer class of the sunjectID variable into factor class
data_final$subjectID <- factor(data_final$subjectID)

# splitting the data based on two categorical factors: 
# labelFactor (different activities) and subjectID (different subjects)
s <- split(data_final, list(data_final$labelFactor, data_final$subjectID))

# using lapply to find the mean of each variable. the first three variables (columns) are excluded 
# from mean calculation because they are not sensor measurements, these three variables are:
# 1) labelFactor {STANDING, LAYING, ...}
# 2) label {1, 2, ..., 5}
# 3) subjectID {1, 2, ..., 30}
data_result <- lapply(s, function(x) cbind(x[1 , 1:3], t(colMeans(x[ , 4:length(data_final)]))))

# using rbind_all to combine all data frames stored in a list into one single dataframe
library(dplyr)
data_result_dataframe <- rbind_all(data_result)

# writing the two new tidy data sets in the desired folder 
write.table(data_final, "./Assignment4Submit/dataset1.txt", row.names = FALSE, col.names = FALSE)
write.table(data_result_dataframe, "./Assignment4Submit/dataset2.txt", row.names = FALSE, col.names = FALSE)


