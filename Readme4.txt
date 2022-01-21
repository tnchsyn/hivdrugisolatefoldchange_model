1) class_perform.m: This function takes predicted and true classes as input and gives accuracy, sensitivity and specificity values as output.
2) class_perform2.m: This function takes predicted and true classes as input and gives both nominator and denominator ...
values of accuracy, sensitivity and specificity values as output (for instance n out of m is true predicted and this cunction gives both n an m for accuracy metric.
3) Figure3.mat: .mat version of the Figure 3 of the paper. 
4) Figure3.png: .png version of the Figure 3 of the paper. 
3) Main3.m: This program takes SUMMARY.mat as input and creates the Figure 3 by using models COL_BESTNET{i,j}. Drug reistance tendencies are ...
converted to the classification problem and the ROC curves are plotted for each PI pair. Additionall the TABLE variable denotes the Table 2 of the paper.
4) SUMMARY.mat: This data represents the traning output of our DIF-based ANN model. 