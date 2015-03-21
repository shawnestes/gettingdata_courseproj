### Tidying data from UCI's Human Activity Recognition data

#### Goal

Our purpose is to the transform two datasets into one cohesive, tidy dataset of the mean and standard deviation of each measurement. The raw, original data is based on files provided at <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>.

#### Process and file structure

R packages: data.table is required.

To install: 

install.packages(data.table)

It is expected the full extracted structure of the data (<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">download</a>) is available, unmanipulated in the working directory. 

working_directory -><br>
&nbsp;&nbsp;&nbsp;   UCI HAR Dataset/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      -> activity_labels.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-> features_info.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-> features.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      -> README.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      -> test/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        -> subject_test.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        -> X_test.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        -> y_test.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      -> train/ <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         -> subject_train.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         -> X_train.txt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         -> y_train.txt<br>
&nbsp;&nbsp;&nbsp;   run_analysis.R - our analysis file<br>
&nbsp;&nbsp;&nbsp;   exported_set.txt - a generated export<br>
&nbsp;&nbsp;&nbsp;   README.md - this file<br>
&nbsp;&nbsp;&nbsp;   CODEBOOK.md - details on transformations and data layout (see also: the raw data provided)<br>

Once that criteria is met, execute run_analysis.R from your R environment will export the resulting tidy dataset to "exported_dataset.txt"

#### Sources and citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 