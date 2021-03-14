
setwd("C:/Users/mauri/Desktop/Cursos/Getting and Cleaning Data/UCI HAR Dataset")

library(dplyr)

### Reading data

test_measure <- read.table(file = './test/X_test.txt')
test_act <- read.table(file = './test/y_test.txt')
test_subject <- read.table(file = './test/subject_test.txt')


train_measure <- read.table(file = './train/X_train.txt')
train_act<- read.table(file = './train/y_train.txt')
train_subject <- read.table(file = './train/subject_train.txt')


features <- read.table(file = './features.txt') %>%
     select(V2)

### Extracting and organizing features' name (variables)


#features2 <- strsplit(features$V2, "\\-") ## list of

fElement <- function(x){
     armazenados <- c()
     for (i in 1:dim(x)[1]) {
     armazenados[i] <- paste("variable",i, sep = "")
} 
     armazenados
} 


### STEP 1: Merging data sets

# Merging test data sets:

test <- cbind(test_subject, test_act, test_measure)

# Merging train data sets:

train <- cbind(train_subject, train_act, train_measure)


consolidated <- rbind(test, train)
# Note that the first 2947 obs. is related to "test" data set.
# The rest of them is from "train" data set.


### STEP 2: Extracting mean and standart deviation
# We have to remove the first two columns from the analysis, 
# because they're not measurements.

mean_columns <- sapply(consolidated[, -c(1,2)], mean)

# Alternative: for (i in 1:(length(consolidated)+2)) {mean_columns <<- mean(consolidated[,i])}

sd_columns <- sapply(consolidated[, -c(1,2)], sd)


### STEP 4: Rename the columns

names2 <- as.character(fElement(features)) ## Extract the first "argument" from "features" df

## variableX corresponds to the X-th line from the "features.txt" file


names(consolidated) <- c("subject","activity",names2)


### STEP 3: Naming the activities

ativities <- c("walking", "walking_upstairs", "walking_downstairs",
               "sitting", "standing", "laying")

consolidated$activity <- sapply(consolidated$activity, function(i){i <- ativities[i]})
## Substitute the number by the respective activity

### STEP 5: Creating independent data set

library(dplyr)


group_both <- group_by(consolidated, subject, activity)

final <- summarize(group_both, mean(.data[[names2[1]]]))
# Data set containing the inicial structure for the loop (next)
# Note that ".data[[names2[1]]]" was a trick in order to avoid NA's in the
# summarize() calculation of the mean.
# To see it, substitute ".data[[names2[1]]]" by "names2[1]"

for (i in 2:length(names2)) {
     result <- summarize(group_both, mean(.data[[names2[i]]]))
     final <- cbind(final, result[, 3])
}

# Repeats the process used at the variable "final" for the other columns.
# Inefficient process, although the only one I could think.

names(final) <- c("subject","activity",names2)
