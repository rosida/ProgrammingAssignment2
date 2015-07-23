# Introduction

What the `run_analysis.R` Script do.

 1. Read Training file from folder train
		 - X_train.txt, y_train.txt
 2. Read Subject Trainning subject_train.txt
 3. Read Test file from folder test
		 - X_test.txt, y_test.txt
 4. Read Subject  Test subject_test.txt
 5. Combine Training & Test file  (x,y file from folder Train and test)
 6. Combine Subject for Training and test

# Variables

* `x_train`, 
* `y_train`, 
* `x_test`, 
* `y_test`, 
* `subject_train` and 
* `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* Finally, `tidy_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
