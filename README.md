
Getting and Cleaning Data 
=========================
Course Project
==============

Introduction
------------

This repository contains my course project for the Coursera course "Getting and Cleaning data."  


Prerequisites:
--------------

The UCI HAR Dataset is available at this link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The UCI HAR Dataset must be downloaded, and extracted into a directory called "data" in your working directory.


run_analysis.R:
---------------

The R script called run_analysis.R does the following:

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


CodeBook.md
-----------

Explains the transformations performed and the resulting data and variables.
