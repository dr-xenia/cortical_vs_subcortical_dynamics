# Comparing cortical and subcortical brain dynamics in a reduced space

## Contributors (in alphabetical order):
- Natasha Bertelsen, CTO and Recycler Enthusiast
- Thomas Kirk, CFO and Cutlery Master
- Xenia Kobeleva, CEO and Supreme Leader

## Aims: 
- compare brain dynamics of anatomically ("historically") defined regions (cortex and subcortex) to see which dynamic properties differ in these regions (classical statistics)
- find a feature that allows us to classify a node whether it is cortical or subcortical (machine learning)

## Methods:
- extract cortical/ subcortical timeseries from the HCP dataset
- reduce timeseries into 22 features using Catch22 (https://github.com/chlubba/catch22) (dimensionality reduction)
- compare features using statistics, explain why some features differ in cortex vs subcortex/ explain the meaning of the features
- use the features, leave the biology behind, to classify between cortical and subcortical areas (1. feature selection and 2. training and testing)
- plot results in surface/ volume space

## Project goals/future ideas:
- include physiological noise measurements
- timeseries vs. functional connectivity comparison vs. those features
- cluster some features?
- at OHBM 2020: how to select features for machine learning and how to create a train/ test data set
- spatial analysis using the plotted surface

