# 824-Final-Project
Shiny app for my final project for STAT 824.

Initial project plan was to create a visualization using a covid-19 dataset to display cases by country or similar. This idea had to be scrapped early as the dataset was not sufficient to complete this goal in a satisfying manner. I pivoted my work to displaying.

I found it would be interesting to compare highway miles per gallon between classes and manufacturers in a visual way in order to see if certain manufacturers had better mileage for a given type of vehicle. To facilitate this I created a basic reactive graph setup showing a histogram of highway mileage for a selected class per manufacturer. To make the user experience somewhat I better, I elected to add a second graph, a bar chart, to show which classes of vehicles were built by the selected manufacturer. 

Update:
I added a searchable data table to show the same contents as the bar chart but in a more numerical view. This bar chart may be obsolete at this point. Additionally, I have converted all of my graphs to ggplot2 graphs, which do not break the moment there is a lack of data, therefore my (rudimentary) error handling is now built-in.
