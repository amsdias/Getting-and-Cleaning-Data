---
title: "Codebook"
output: html_document
---

#Variables

* To store the data read from the Samsung files:
    + *x_train*
    + *x_test*
    + *y_train*
    + *y_test*
    + *train*
    + *test*

* The data is then merged in to 3 variables:
    + *x*
    + *y*
    + *subject*

* Column names are read from the files "features.txt" and saved in the variables *features*, which is searched for names containing "mean" and "std",
and those are saved in the variable *mean_std_features*.
Then, activy names are read from the file "activity_labels.txt" and saved to the variable *activities*

* *merged_data* holds the data from the variables *x*, *y* and *subject*, merged with cbind

* ddply is used to calculate column means and the result is saved to the *data* variable, which is then written to disk as "cleandata.txt"