# Final-Assignment---Getting-and-Cleaning-Data

## Files Description:

1) features.txt: Contains (561) functions (with descriptions) over some variables from the experiment;
2) activity_labels.txt: Activity identification;
3) X_test.txt: Test measurements regarding all the functions that appeared at features.txt file. It is a 2947x561 df;
4) X_train.txt: Train measurements regarding all the functions that appeared at features.txt file. It is a 7352x561 df;
5) y_test.txt: Identification of activity, about test measurements. It is a 2947x1 df;
6) y_train.txt: Identification of activity, about train measurements. It is a 7352x1 df;
7) subject_test.txt: Identification of subject, about test measurements. It is a 2947x1 df;
8) subject_train.txt: Identification of subject, about train measurements. It is a 7352x1 df;

### Note that df's 3), 5) and 7) are complementary of each other. At the same way, 4), 6) and 8) are also complementary.

## The Nuts and Bolts:

First, I read every file that I will use, that is: X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt and features.txt.

Next, I define the fElement() in order to rename the column names (to the pattern "variableJ", which I explain on "README2.md", at this same repository). I will use this function only in STEP4.

## STEP 1

First, I merged each category data set with the relevant files. That is, I merged all the files related to "test" (described at line 5) in one data frame and did the same for "train" related files. Next, I use rbind() in order to merge once again the two data sets described earlier and assigned to "consolidated".

## STEP 2

I've utilized sapply in order to get the means and standard of each column - except the first and second one, which characterizes the subject and activity.

## STEP 4

I jumped to 4 because I thought it would be easier to do this first. So, in this step, I've only renamed the column names by using the function described at line 7 (fElement()).

## STEP 3

I assign to "activities" all the activities that the experiment imposes on each subject. But note that, at this point, each activity identification is a number (from 1 to 6). Using the information at "activity_labels.txt", I used sapply in order to replace each identification number with the respective activity.

## STEP 5

At this last step, I first define the group_both, which receives as argument subject and activity - variables which we must untangle in order to lead to the desired output. Then, I defined "final" in order to build my inicial structure - to which I will add the other relevant means through the for loop beneath it. Summarize is a central part to the earlier step. Finally, I only ajusted the column names.
