#### Goal: 
Our analysis goal is to take the raw data provided by UCI and obtain the average measurement for each activity and subject. 

##### Raw Data: 

The dataset provides its own description as follows: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

##### Data Transformations: 

Analysis cleans and extracts usable data from the raw dataset. Runing run_analysis.R does the following: reads all raw and merges it into one complete dataset, all data is extracted that matches mean or std in the variable name, gives meaningful names to the activity using provided labels, and exports the average of each variable by each activity and subject. 

From the raw data, measurement categories were renamed for ease of use and normalization: 

- BodyBody becomes Body-
- tBody becomes TimeBody-
- gravity becomes Gravity
- Measurements beginning with "t" were append with "Time-"
- Measurements beginning with "f" were appended with "Frequency-"

All measurements that contain names that appear like functions were replaced. 

- mean() becomes -Mean
- std() becomes -STD
- freq() becomes -Frequency