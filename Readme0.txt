1) ALL_DATA.xlsx : This file is downloaded from https://hivdb.stanford.edu/download/GenoPhenoDatasets/PI_DataSet.txt and converted to the excel format.
2) ALLDATA.mat: This file is the .mat version of the ALL_DATA.xlsx.
3) CP.mat: This file include the positions of each drug in the Final.mat.
4) Data.mat: This file include isolate-fold change data of each drug.
5) Final.mat: This file includes drug fingerprint - isolate input versus fold change output values of all drugs.
6) Main.m: This program takes ALLDATA.mat as input an produces the Data.mat with the use of additional function str_char_improved.m.
7) Main_Final: This program concatenates the isolate inputs from Data.mat and drug fingerprint data Morgan.mat to givel the desired output data Final.mat.
8) Morgan.mat: This data file includes the Morgan fingerprint representations (512 bit vector) of each drug.
9) Red_Morgan: This data is reeduced from Morgan.m by removing all zeros or all one columns.
10) Reduction.m: This program converts Morgan.m to Red_Morgan.m.
11) str_char_improved.m: This function converts the isolates into individual mutation patterns.