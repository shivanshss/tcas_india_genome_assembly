#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 17 18:54:01 2023

@author: bloodmark
"""

import numpy as np
import pandas as pd
from sklearn import svm
from sklearn.metrics import classification_report
import matplotlib.pyplot as plt
import seaborn as sns
from Bio import SeqIO
import matplotlib.pylab as pylab


plt.rcParams['figure.figsize'] = (12, 8)

ctgs_all = pd.read_csv('/media/bloodmark/HDD6_SS_extra/DiscoverY/annotated_male_contigs/01B/01B_male_contigs_names.txt', names=["Chr_name", "Length", "Proportion", "Coverage"], delimiter=' ', header=None)
ctgs_mapped = ctgs_all[ctgs_all['Chr_name'] != "unmapped"]
print(ctgs_mapped.tail())
print(ctgs_mapped.shape)

ctgs = ctgs_mapped[ctgs_mapped['Length'] > 100]
print(ctgs.shape)

# Flip the proportions
# Proportions from now on will be prop shared with female
ctgs.loc[:, "Proportion"] = ctgs["Proportion"].apply(lambda x: 1 - x)
print("Checking dataframe...")
print(ctgs.head())


# ctgs.loc[ctgs['Proportion'] > 0.8, 'Chr_name'] = 'chrY'


# Add a Label column which is 1 if chrY
ctgs.loc[:, "Label"] = ctgs["Chr_name"].apply(lambda x: 0 if x == "chrY" else 1)
ctgs.head()

# Remove outlier contigs with super high proportion
ctgs = ctgs[ctgs['Proportion'] <= 1.0]
ctgs.shape
ctgs['Length'].sum()

# Remove outlier contigs with super high coverage
# Drops about 2.5% of all contigs, and Y_ctgs of total length only 123 kb
ctgs_less_500_cvg = ctgs[ctgs['Coverage'] < 1000]
ctgs_less_500_cvg.shape
print("Total length of all contigs after removing outliers : ")
print(ctgs_less_500_cvg['Length'].sum())


print("Total length of Y contigs after removing outliers : ")
non_outlier_Y_ctgs = ctgs_less_500_cvg[ctgs_less_500_cvg['Chr_name'] == "chrY"]
print(non_outlier_Y_ctgs['Length'].sum())

print("# of Y ctgs : ", non_outlier_Y_ctgs.shape)

# # Just checking the total Y-length of these high coverage ctgs lost
# ctgs_gr_500_cvg = ctgs[ctgs['Coverage'] >= 500]
# ctgs_gr_500_cvg.shape
# and_Y = ctgs_gr_500_cvg[ctgs_gr_500_cvg['Chr_name'] == "chrY"]
# print("Total length of all Y-contigs in outliers : ")
# print(and_Y['Length'].sum())

# print("Training classifier on a subset of data (8%)")
# # 0. Subsample the dataset
# ctgs_sample = ctgs_less_500_cvg.sample(frac=0.2, random_state=200)
# ctgs_curr = ctgs_sample
# ctgs_curr.shape

# # 1. Load the dataset
# features = ["Proportion", "Coverage"]
# X = ctgs_curr[list(features)].values
# y = ctgs_curr["Label"].values

# # 2. Split into test-train
# from sklearn.model_selection import train_test_split

# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)
# print("Training data size is : ", X_train.shape)
# print("Testing data size is : ", X_test.shape)

# # 3. Choose the model
# from sklearn.svm import LinearSVC
# classifier = LinearSVC(random_state=0)

# # Alternative models
# from sklearn.linear_model import LogisticRegression
# classifier = LogisticRegression()

# print(classifier)

# print("Fitting a subsample")
# print(classifier.fit(X_train, y_train))

# print("Scoring the classifier")
# print(classifier.score(X_train, y_train))

# y_prediction = classifier.predict(X_test)
# print("Shape of y_prediction")
# print(y_prediction.shape)

# y_truth = y_test
# print("Shape of y_truth")
# print(y_truth.shape)

# # Classification report for 2% of data after training on 8% of data
# print("Classification report for 2pc of data after training on 8pc of data")
# print(classification_report(y_truth, y_prediction))

# print("Now classifying on all data")
# full_X = ctgs_less_500_cvg[list(features)].values
# full_y = ctgs_less_500_cvg["Label"].values

# full_y_prediction = classifier.predict(full_X)
# print("Shape of full_y_prediction")
# print(full_y_prediction.shape)

# full_y_truth = full_y
# print("Shape of full_y_truth")
# full_y_truth.shape

# # Classification report for 100% of data after training on 8% of data
# print("Classification report for all data after training on 8pc of data")


# from sklearn.metrics import classification_report, confusion_matrix


# print("Strategy : ", classifier)
# print(classification_report(full_y_truth, full_y_prediction))

# agreement = ctgs_less_500_cvg.loc[(ctgs_less_500_cvg['Label'] == full_y_prediction) & ctgs_less_500_cvg['Label'].isin([0])]


# print "Total Length selected as Y is : ", ctgs_less_500_cvg[ctgs_less_500_cvg['Label'] == full_y_prediction]

# ctgs_less_500_cvg.loc[:, "from_classifier"] = full_y_prediction
# classed_as_Y = ctgs_less_500_cvg[(ctgs_less_500_cvg['from_classifier'] == 0)]

# tp = agreement['Length'].sum()
# tp_plus_fp = classed_as_Y['Length'].sum()
# total_original_len = non_outlier_Y_ctgs['Length'].sum()

# print("True Positive length of Y is : ", tp)
# print("Total Length selected as Y is : ", tp_plus_fp)
# print("Total length of Y contigs in the dataset : ", total_original_len)

# precision = tp / tp_plus_fp
# recall = tp / total_original_len

# print("Precision is : ", precision)
# print("Recall is : ", recall)

# W = classifier.coef_[0]
# I = classifier.intercept_

# a = -W[0] / W[1]
# b = I[0] / W[1]

# # y = a*x - b
# intercept1 = b
# slope1 = a

# print("Equation is : y = ", a, "*x - ", b)
# print("Slope is : ", a)
# print("Y-Intercept is : ", b)
# print("X-Intercept is : ", b/a)

# Extract 'Proportion' and 'Coverage' columns
proportion = ctgs_less_500_cvg['Proportion']
coverage = ctgs_less_500_cvg['Coverage']

# Define conditions for labeling points green
green_condition = (proportion < 0.2) & (coverage >= 10) & (coverage <= 200)


# Create a scatter plot for non-Y contigs (blue points)
plt.scatter(proportion[~green_condition], coverage[~green_condition], c='blue', marker='o', label='Non-Y Contigs')

# Create a scatter plot for Y contigs (green points)
plt.scatter(proportion[green_condition], coverage[green_condition], c='green', marker='o', label='Y Contigs')

# Set labels and title
plt.xlabel('Proportion')
plt.ylabel('Coverage')
plt.title('Proportion vs Coverage for 01B')

# Set axis limits
plt.xlim(0, 1)  # Adjust these values based on your data
plt.ylim(0, 1000)  # Adjust these values based on your data

# Show the legend
plt.legend()

# Save the plot with all labels into a file
plt.savefig("01B_discoverY.png", bbox_inches='tight')

# Show the plot
plt.show()


# Filter the DataFrame based on the conditions
filtered_ctgs = ctgs_less_500_cvg[(ctgs_less_500_cvg['Proportion'] < 0.2) & (ctgs_less_500_cvg['Coverage'] >= 10) & (ctgs_less_500_cvg['Coverage'] <= 200)]

# Extract the 'chr_name' values from the filtered DataFrame
chr_names = filtered_ctgs['Chr_name']

# Write the 'chr_name' values to a file named "y_contig_names"
with open("01B_y_contig_names.txt", "w") as file:
    for name in chr_names:
        file.write(name + '\n')

# Close the file
file.close()
