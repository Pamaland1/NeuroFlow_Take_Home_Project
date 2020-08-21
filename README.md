# NeuroFlow_Take_Home_Project

This is a data munging and visualization exercise on behavioral health startup NeuroFlow's problem space using anonymized and simplifed data from their internal datasets.

It consists of a response to to 2 prompts:

## Part 1

NeuroFlow's problem is that there is no currently good way to show patients and providers their trajectory on the GAD-7 assessment through time.  The aim of this section is to first, visualize a patient's trajectory, and second, to develop further insights into the business challenges of Neuroflow.  

## Part 1 Response

I responded to this prompt with 2 visualization studies:

* [Individual Patient Trajectory](https://github.com/Pamaland1/NeuroFlow_Take_Home_Project/blob/master/Anupama_Garla_Part_1_NeuroFlow_Take_Home_Data_Visualization.ipynb)
The first looks at how to visually display the trajectory of a patient's GAD-7 progress through time.  

* [Data Exploration](https://github.com/Pamaland1/NeuroFlow_Take_Home_Project/blob/master/Anupama_Garla_Part_1_Neuroflow_Data_Exploration.ipynb)
The second takes an overview of all patients' trajectories, and drills down into temporal data to get a handle on a few things:
-How many GAD-7's do patients tend to have?
-How soon after the creation of a patient is a GAD-7 administered?
-How long does it take to complete a second GAD-7?

Insights:
1. It may be helpful for patients and providers to see a visual cohort analysis of GAD-7 trajectories over time - perhaps of other patients who have started in the same scoring scale (for instance, their trajectory overlaid on others that have started out as moderate severity), as well as a few sample trajectories of patients in order to understand that the trajectory can be directional but a small temporal batch of reading dates can also fluctuate highly and that's ok.

Additional Pieces of Information to collect:
1. Exercise types completed between GAD-7 evaluation dates could be useful to analyze the effectiveness of the exercises.
2. Provider ID's could be useful to analyze the effectiveness of the provider.
3. Demographic data of patients could be useful to analyze if certain providers/exercises are more effective with particular demographic cohorts.

## Part 2

* [SQL Queries](https://github.com/Pamaland1/NeuroFlow_Take_Home_Project/blob/master/Anupama_Garla_Part_2_NeuroFlow_SQL_Queries.sql)
This part was dedicated to advanced sql queries that likely will be common practice in the role of data scientist at Neuroflow. 

## Author

* **Anupama Garla** - [Pamaland1](https://github.com/Pamaland1)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
