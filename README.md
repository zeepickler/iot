### IoT Sensor System

Watching the PBS program "The Crowd and the Cloud" inspired me to think about the entire ecosystem of citizen science and policy enactment. One of the episode's highlighted the "Mosquito Alert" mobile application, which allows users to upload photos of mosquitos and also their environment (areas of standing water where they lay eggs.) While documentation of the issue satisifed the scientists needs, citizens wanted to do more to abate the mosquito problem. So the project leaders worked with pest control services at the city (in Barcelona) to alert them of areas needing to be treated.

This dialogue between sensors and policy enactment sets up a nice framework to efficiently manage an environment and allows for a quicker response to changes in the environment -- preventing problems before major crises appear.

This idea has been fleshed out as a prototype in this repo, using the example scenario of measuring pH values in water.

Below is a break down of how the components work together:

#### Sensor Data

The "sensor_data.csv" is a mock representation of a sensor recording the pH of a managed body of water (ie. river or lake). The file contains a date stamp and the pH level recorded. In practice, there may be GPS location data included or sensor ID.  The data format may consist of a full time period of recording (several days or months) or a single data sample relayed to an API via mobile internet access.

#### Policy

The 'policy.json' file provides a grade of environmental quality for the data vector in question.  For any given data vector, multiple jurisdictions may have their own grading system, so the grading policy is applied in each instance to satisfy the legal requirements.

#### Action

The 'Action.json' file describes pre-determined responses to be acted on based on the current environmental quality. The types of action that could be taken vary widely and create the greatest value of this system:

-Volunteer Action: Volunteer organizations would play a great role in providing extra monitoring and data collection. Example actions might be: "plan incident committee meeting", "perform a site visit", or "collect photo documentation".

-Government Action: Local, City, State, and Federal governments could include their response action plans directly into this system, so offcials are prompted to enact their plan. Examples might be: "Enact response plan 2001-A", "Send out hazardous waste teams", or "establish safety zone around site".

-Automated Action: The system is becomes especially powerful when alerts feed into automated systems that control usage and supply. Utilities could use this information to modify service and re-route resources automatically to maintain service levels and prevent pollutants entering public supply systems. Also, alerts could feed into an automated weather system at NOAA or other weather organizations to provide public emergency weather alerts.

#### Putting It All Together

The 'sensor.rb' file pulls all these components togther, with the output being the action to be taken. The given logic consists of a few functions which can be built into an API to serve web applications and act as an endpoint for IoT devices.

#### The Next Steps

The next important question is 'who needs to know what', meaning a sort of social media app would be built around the data reporting so relavent parties can take appropriate action.  Just as with social media, people would follow sensors relavent to them. Important sensors, such as those in use by the US Government, could be verified with a star so official data sources can be easily recognized. Based on the sensors geolocation, the respective jurisdictional grading policies can be determined and automatically applied, so relavent grades are provided along with the data measurement in the data feed.

Actions are a little more involved. As with Slack, first groups would be setup. Then each group can invite members.  The group admin would subscribe to their relavent data sensors and then create actions to be taken. The admin even may create subgroups and apply an alert that tasks the subgroup with an action.

Finally, though we can think of actions as a direct result of a grade, some data vectors like pH can be plotted on a graph and thought of in a continuous manner instead of discrete data points.  Given this view, we can think of the data as the stock market and apply 'triggers' -- applying actions simply when a number is reached or ie. when a number drops 50%.
