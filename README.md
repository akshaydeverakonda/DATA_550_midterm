This READme file contains instructions on how to build a report examining different aspects of CDC wastewater surveillance data.

Code/analysis2/detect_prop_15d_analysis.Rmd analyzes detect_prop_15d across different wwtp_jurisdiction to see which jurisdictions have higher SARS-CoV-2 detection rates over the 15-day periods.

keita's code aggregates ptc_15d data by season or quarter to observe any seasonal trends in wastewater virus levels.

00_clean_data.R, 01_make_plot.R, and 01_make_table.R analyze the average change in wastewater levels over time per state. The output of this analysis will be a table showing for each state what the average change of the “ptc_15d” variable over the reporting periods included in this document is. 

Code/.Rhistory Investigatse correlation between population size (population_served) and average proportion of tests with SARS-CoV-2 detected (detect_prop_15d). The output will be a scatterplot with the X axis being population levels of each wastewater treatment plant, and the y axis will be the average of the detect_prop_15d values recorded for each population size.

