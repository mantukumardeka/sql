# Exam Topics Questions

@thatonecodes

## Exam Professional Data Engineer topic 1 question 1 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 1
Topic #: 1

[All Professional Data Engineer Questions]

Your company built a TensorFlow neutral-network model with a large number of neurons and layers. The model fits well for the training data. However, when tested against new data, it performs poorly. What method can you employ to address this? 

A. Threading

B. Serialization

C. Dropout Methods

D. Dimensionality Reduction

**Answer: C**

**Timestamp: Sept. 2, 2022, 2:46 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79414-exam-professional-data-engineer-topic-1-question-1/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 2 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 2
Topic #: 1

[All Professional Data Engineer Questions]

You are building a model to make clothing recommendations. You know a user's fashion preference is likely to change over time, so you build a data pipeline to stream new data back to the model as it becomes available. How should you use this data to train the model? 

A. Continuously retrain the model on just the new data.

B. Continuously retrain the model on a combination of existing data and the new data.

C. Train on the existing data while using the new data as your test set.

D. Train on the new data while using the existing data as your test set.

**Answer: B**

**Timestamp: March 9, 2020, 9:40 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/15911-exam-professional-data-engineer-topic-1-question-2/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 3 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 3
Topic #: 1

[All Professional Data Engineer Questions]

You designed a database for patient records as a pilot project to cover a few hundred patients in three clinics. Your design used a single database table to represent all patients and their visits, and you used self-joins to generate reports. The server resource utilization was at 50%. Since then, the scope of the project has expanded. The database must now store 100 times more patient records. You can no longer run the reports, because they either take too long or they encounter errors with insufficient compute resources. How should you adjust the database design? 

A. Add capacity (memory and disk space) to the database server by the order of 200.

B. Shard the tables into smaller ones based on date ranges, and only generate reports with prespecified date ranges.

C. Normalize the master patient-record table into the patient table and the visits table, and create other necessary tables to avoid self-join.

D. Partition the table into smaller tables, with one for each clinic. Run queries against the smaller table pairs, and use unions for consolidated reports.

**Answer: C**

**Timestamp: March 15, 2020, 8:14 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16635-exam-professional-data-engineer-topic-1-question-3/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 4 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 4
Topic #: 1

[All Professional Data Engineer Questions]

You create an important report for your large team in Google Data Studio 360. The report uses Google BigQuery as its data source. You notice that visualizations are not showing data that is less than 1 hour old. What should you do? 

A. Disable caching by editing the report settings.

B. Disable caching in BigQuery by editing table details.

C. Refresh your browser tab showing the visualizations.

D. Clear your browser history for the past hour then reload the tab showing the virtualizations.

**Answer: A**

**Timestamp: Sept. 3, 2022, 6:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79677-exam-professional-data-engineer-topic-1-question-4/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 5 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 5
Topic #: 1

[All Professional Data Engineer Questions]

An external customer provides you with a daily dump of data from their database. The data flows into Google Cloud Storage GCS as comma-separated values(CSV) files. You want to analyze this data in Google BigQuery, but the data could have rows that are formatted incorrectly or corrupted. How should you build this pipeline? 

A. Use federated data sources, and check data in the SQL query.

B. Enable BigQuery monitoring in Google Stackdriver and create an alert.

C. Import the data into BigQuery using the gcloud CLI and set max_bad_records to 0.

D. Run a Google Cloud Dataflow batch pipeline to import the data into BigQuery, and push errors to another dead-letter table for analysis.

**Answer: D**

**Timestamp: March 15, 2020, 8:14 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16637-exam-professional-data-engineer-topic-1-question-5/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 6 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 6
Topic #: 1

[All Professional Data Engineer Questions]

Your weather app queries a database every 15 minutes to get the current temperature. The frontend is powered by Google App Engine and server millions of users. How should you design the frontend to respond to a database failure? 

A. Issue a command to restart the database servers.

B. Retry the query with exponential backoff, up to a cap of 15 minutes.

C. Retry the query every second until it comes back online to minimize staleness of data.

D. Reduce the query frequency to once every hour until the database comes back online.

**Answer: B**

**Timestamp: March 15, 2020, 8:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16639-exam-professional-data-engineer-topic-1-question-6/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 7 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 7
Topic #: 1

[All Professional Data Engineer Questions]

You are creating a model to predict housing prices. Due to budget constraints, you must run it on a single resource-constrained virtual machine. Which learning algorithm should you use? 

A. Linear regression

B. Logistic classification

C. Recurrent neural network

D. Feedforward neural network

**Answer: A**

**Timestamp: March 15, 2020, 8:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16640-exam-professional-data-engineer-topic-1-question-7/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 8 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 8
Topic #: 1

[All Professional Data Engineer Questions]

You are building new real-time data warehouse for your company and will use Google BigQuery streaming inserts. There is no guarantee that data will only be sent in once but you do have a unique ID for each row of data and an event timestamp. You want to ensure that duplicates are not included while interactively querying data. Which query type should you use? 

A. Include ORDER BY DESK on timestamp column and LIMIT to 1.

B. Use GROUP BY on the unique ID column and timestamp column and SUM on the values.

C. Use the LAG window function with PARTITION by unique ID along with WHERE LAG IS NOT NULL.

D. Use the ROW_NUMBER window function with PARTITION by unique ID along with WHERE row equals 1.

**Answer: D**

**Timestamp: March 15, 2020, 8:44 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16641-exam-professional-data-engineer-topic-1-question-8/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 9 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 9
Topic #: 1

[All Professional Data Engineer Questions]

Your company is using WILDCARD tables to query data across multiple tables with similar names. The SQL statement is currently failing with the following error:Which table name will make the SQL statement work correctly? 

A. 'bigquery-public-data.noaa_gsod.gsod'

B. bigquery-public-data.noaa_gsod.gsod*

C. 'bigquery-public-data.noaa_gsod.gsod'*

D. 'bigquery-public-data.noaa_gsod.gsod*`

**Answer: D**

**Timestamp: Sept. 3, 2022, 6:48 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79679-exam-professional-data-engineer-topic-1-question-9/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 10 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 10
Topic #: 1

[All Professional Data Engineer Questions]

Your company is in a highly regulated industry. One of your requirements is to ensure individual users have access only to the minimum amount of information required to do their jobs. You want to enforce this requirement with Google BigQuery. Which three approaches can you take? (Choose three.) 

A. Disable writes to certain tables.

B. Restrict access to tables by role.

C. Ensure that the data is encrypted at all times.

D. Restrict BigQuery API access to approved users.

E. Segregate data across multiple tables or databases.

F. Use Google Stackdriver Audit Logging to determine policy violations.

**Answer: BDE**

**Timestamp: March 15, 2020, 8:44 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16642-exam-professional-data-engineer-topic-1-question-10/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 11 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 11
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a basket abandonment system for an ecommerce company. The system will send a message to a user based on these rules:✑ No interaction by the user on the site for 1 hourHas added more than $30 worth of products to the basket✑ Has not completed a transactionYou use Google Cloud Dataflow to process the data and decide if a message should be sent. How should you design the pipeline? 

A. Use a fixed-time window with a duration of 60 minutes.

B. Use a sliding time window with a duration of 60 minutes.

C. Use a session window with a gap time duration of 60 minutes.

D. Use a global window with a time based trigger with a delay of 60 minutes.

**Answer: C**

**Timestamp: Sept. 3, 2022, 6:50 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79682-exam-professional-data-engineer-topic-1-question-11/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 12 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 12
Topic #: 1

[All Professional Data Engineer Questions]

Your company handles data processing for a number of different clients. Each client prefers to use their own suite of analytics tools, with some allowing direct query access via Google BigQuery. You need to secure the data so that clients cannot see each other's data. You want to ensure appropriate access to the data.Which three steps should you take? (Choose three.) 

A. Load data into different partitions.

B. Load data into a different dataset for each client.

C. Put each client's BigQuery dataset into a different table.

D. Restrict a client's dataset to approved users.

E. Only allow a service account to access the datasets.

F. Use the appropriate identity and access management (IAM) roles for each client's users.

**Answer: BDF**

**Timestamp: March 15, 2020, 9:07 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16644-exam-professional-data-engineer-topic-1-question-12/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 13 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 13
Topic #: 1

[All Professional Data Engineer Questions]

You want to process payment transactions in a point-of-sale application that will run on Google Cloud Platform. Your user base could grow exponentially, but you do not want to manage infrastructure scaling.Which Google database service should you use? 

A. Cloud SQL

B. BigQuery

C. Cloud Bigtable

D. Cloud Datastore

**Answer: D**

**Timestamp: March 11, 2020, 6:22 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16279-exam-professional-data-engineer-topic-1-question-13/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 14 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 14
Topic #: 1

[All Professional Data Engineer Questions]

You want to use a database of information about tissue samples to classify future tissue samples as either normal or mutated. You are evaluating an unsupervised anomaly detection method for classifying the tissue samples. Which two characteristic support this method? (Choose two.) 

A. There are very few occurrences of mutations relative to normal samples.

B. There are roughly equal occurrences of both normal and mutated samples in the database.

C. You expect future mutations to have different features from the mutated samples in the database.

D. You expect future mutations to have similar features to the mutated samples in the database.

E. You already have labels for which samples are mutated and which are normal in the database.

**Answer: AC**

**Timestamp: March 11, 2020, 6:24 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16281-exam-professional-data-engineer-topic-1-question-14/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 15 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 15
Topic #: 1

[All Professional Data Engineer Questions]

You need to store and analyze social media postings in Google BigQuery at a rate of 10,000 messages per minute in near real-time. Initially, design the application to use streaming inserts for individual postings. Your application also performs data aggregations right after the streaming inserts. You discover that the queries after streaming inserts do not exhibit strong consistency, and reports from the queries might miss in-flight data. How can you adjust your application design? 

A. Re-write the application to load accumulated data every 2 minutes.

B. Convert the streaming insert code to batch load for individual messages.

C. Load the original message to Google Cloud SQL, and export the table every hour to BigQuery via streaming inserts.

D. Estimate the average latency for data availability after streaming inserts, and always run queries after waiting twice as long.

**Answer: D**

**Timestamp: March 16, 2020, 9:37 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16723-exam-professional-data-engineer-topic-1-question-15/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 16 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 16
Topic #: 1

[All Professional Data Engineer Questions]

Your startup has never implemented a formal security policy. Currently, everyone in the company has access to the datasets stored in Google BigQuery. Teams have freedom to use the service as they see fit, and they have not documented their use cases. You have been asked to secure the data warehouse. You need to discover what everyone is doing. What should you do first? 

A. Use Google Stackdriver Audit Logs to review data access.

B. Get the identity and access management IIAM) policy of each table

C. Use Stackdriver Monitoring to see the usage of BigQuery query slots.

D. Use the Google Cloud Billing API to see what account the warehouse is being billed to.

**Answer: A**

**Timestamp: March 16, 2020, 11:25 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16729-exam-professional-data-engineer-topic-1-question-16/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 17 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 17
Topic #: 1

[All Professional Data Engineer Questions]

Your company is migrating their 30-node Apache Hadoop cluster to the cloud. They want to re-use Hadoop jobs they have already created and minimize the management of the cluster as much as possible. They also want to be able to persist data beyond the life of the cluster. What should you do? 

A. Create a Google Cloud Dataflow job to process the data.

B. Create a Google Cloud Dataproc cluster that uses persistent disks for HDFS.

C. Create a Hadoop cluster on Google Compute Engine that uses persistent disks.

D. Create a Cloud Dataproc cluster that uses the Google Cloud Storage connector.

E. Create a Hadoop cluster on Google Compute Engine that uses Local SSD disks.

**Answer: D**

**Timestamp: March 16, 2020, 11:26 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16730-exam-professional-data-engineer-topic-1-question-17/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 18 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 18
Topic #: 1

[All Professional Data Engineer Questions]

Business owners at your company have given you a database of bank transactions. Each row contains the user ID, transaction type, transaction location, and transaction amount. They ask you to investigate what type of machine learning can be applied to the data. Which three machine learning applications can you use? (Choose three.) 

A. Supervised learning to determine which transactions are most likely to be fraudulent.

B. Unsupervised learning to determine which transactions are most likely to be fraudulent.

C. Clustering to divide the transactions into N categories based on feature similarity.

D. Supervised learning to predict the location of a transaction.

E. Reinforcement learning to predict the location of a transaction.

F. Unsupervised learning to predict the location of a transaction.

**Answer: BCD**

**Timestamp: March 15, 2020, 12:32 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16654-exam-professional-data-engineer-topic-1-question-18/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 19 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 19
Topic #: 1

[All Professional Data Engineer Questions]

Your company's on-premises Apache Hadoop servers are approaching end-of-life, and IT has decided to migrate the cluster to Google Cloud Dataproc. A like-for- like migration of the cluster would require 50 TB of Google Persistent Disk per node. The CIO is concerned about the cost of using that much block storage. You want to minimize the storage cost of the migration. What should you do? 

A. Put the data into Google Cloud Storage.

B. Use preemptible virtual machines (VMs) for the Cloud Dataproc cluster.

C. Tune the Cloud Dataproc cluster so that there is just enough disk for all data.

D. Migrate some of the cold data into Google Cloud Storage, and keep only the hot data in Persistent Disk.

**Answer: A**

**Timestamp: March 17, 2020, 4:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16870-exam-professional-data-engineer-topic-1-question-19/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 20 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 20
Topic #: 1

[All Professional Data Engineer Questions]

You work for a car manufacturer and have set up a data pipeline using Google Cloud Pub/Sub to capture anomalous sensor events. You are using a push subscription in Cloud Pub/Sub that calls a custom HTTPS endpoint that you have created to take action of these anomalous events as they occur. Your customHTTPS endpoint keeps getting an inordinate amount of duplicate messages. What is the most likely cause of these duplicate messages? 

A. The message body for the sensor event is too large.

B. Your custom endpoint has an out-of-date SSL certificate.

C. The Cloud Pub/Sub topic has too many messages published to it.

D. Your custom endpoint is not acknowledging messages within the acknowledgement deadline.

**Answer: D**

**Timestamp: March 11, 2020, 6:37 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16282-exam-professional-data-engineer-topic-1-question-20/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 21 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 21
Topic #: 1

[All Professional Data Engineer Questions]

Your company uses a proprietary system to send inventory data every 6 hours to a data ingestion service in the cloud. Transmitted data includes a payload of several fields and the timestamp of the transmission. If there are any concerns about a transmission, the system re-transmits the data. How should you deduplicate the data most efficiency? 

A. Assign global unique identifiers (GUID) to each data entry.

B. Compute the hash value of each data entry, and compare it with all historical data.

C. Store each data entry as the primary key in a separate database and apply an index.

D. Maintain a database table to store the hash value and other metadata for each data entry.

**Answer: A**

**Timestamp: March 18, 2020, 4:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16929-exam-professional-data-engineer-topic-1-question-21/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 22 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 22
Topic #: 1

[All Professional Data Engineer Questions]

Your company has hired a new data scientist who wants to perform complicated analyses across very large datasets stored in Google Cloud Storage and in aCassandra cluster on Google Compute Engine. The scientist primarily wants to create labelled data sets for machine learning projects, along with some visualization tasks. She reports that her laptop is not powerful enough to perform her tasks and it is slowing her down. You want to help her perform her tasks.What should you do? 

A. Run a local version of Jupiter on the laptop.

B. Grant the user access to Google Cloud Shell.

C. Host a visualization tool on a VM on Google Compute Engine.

D. Deploy Google Cloud Datalab to a virtual machine (VM) on Google Compute Engine.

**Answer: D**

**Timestamp: March 15, 2020, 3:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16624-exam-professional-data-engineer-topic-1-question-22/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 23 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 23
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying 10,000 new Internet of Things devices to collect temperature data in your warehouses globally. You need to process, store and analyze these very large datasets in real time. What should you do? 

A. Send the data to Google Cloud Datastore and then export to BigQuery.

B. Send the data to Google Cloud Pub/Sub, stream Cloud Pub/Sub to Google Cloud Dataflow, and store the data in Google BigQuery.

C. Send the data to Cloud Storage and then spin up an Apache Hadoop cluster as needed in Google Cloud Dataproc whenever analysis is required.

D. Export logs in batch to Google Cloud Storage and then spin up a Google Cloud SQL instance, import the data from Cloud Storage, and run an analysis as needed.

**Answer: B**

**Timestamp: March 18, 2020, 4:38 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16931-exam-professional-data-engineer-topic-1-question-23/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 24 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 24
Topic #: 1

[All Professional Data Engineer Questions]

You have spent a few days loading data from comma-separated values (CSV) files into the Google BigQuery table CLICK_STREAM. The column DT stores the epoch time of click events. For convenience, you chose a simple schema where every field is treated as the STRING type. Now, you want to compute web session durations of users who visit your site, and you want to change its data type to the TIMESTAMP. You want to minimize the migration effort without making future queries computationally expensive. What should you do? 

A. Delete the table CLICK_STREAM, and then re-create it such that the column DT is of the TIMESTAMP type. Reload the data.

B. Add a column TS of the TIMESTAMP type to the table CLICK_STREAM, and populate the numeric values from the column TS for each row. Reference the column TS instead of the column DT from now on.

C. Create a view CLICK_STREAM_V, where strings from the column DT are cast into TIMESTAMP values. Reference the view CLICK_STREAM_V instead of the table CLICK_STREAM from now on.

D. Add two columns to the table CLICK STREAM: TS of the TIMESTAMP type and IS_NEW of the BOOLEAN type. Reload all data in append mode. For each appended row, set the value of IS_NEW to true. For future queries, reference the column TS instead of the column DT, with the WHERE clause ensuring that the value of IS_NEW must be true.

E. Construct a query to return every row of the table CLICK_STREAM, while using the built-in function to cast strings from the column DT into TIMESTAMP values. Run the query into a destination table NEW_CLICK_STREAM, in which the column TS is the TIMESTAMP type. Reference the table NEW_CLICK_STREAM instead of the table CLICK_STREAM from now on. In the future, new data is loaded into the table NEW_CLICK_STREAM.

**Answer: E**

**Timestamp: March 11, 2020, 7:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16285-exam-professional-data-engineer-topic-1-question-24/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 25 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 25
Topic #: 1

[All Professional Data Engineer Questions]

You want to use Google Stackdriver Logging to monitor Google BigQuery usage. You need an instant notification to be sent to your monitoring tool when new data is appended to a certain table using an insert job, but you do not want to receive notifications for other tables. What should you do? 

A. Make a call to the Stackdriver API to list all logs, and apply an advanced filter.

B. In the Stackdriver logging admin interface, and enable a log sink export to BigQuery.

C. In the Stackdriver logging admin interface, enable a log sink export to Google Cloud Pub/Sub, and subscribe to the topic from your monitoring tool.

D. Using the Stackdriver API, create a project sink with advanced log filter to export to Pub/Sub, and subscribe to the topic from your monitoring tool.

**Answer: D**

**Timestamp: March 11, 2020, 7:16 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16286-exam-professional-data-engineer-topic-1-question-25/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 26 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 26
Topic #: 1

[All Professional Data Engineer Questions]

You are working on a sensitive project involving private user data. You have set up a project on Google Cloud Platform to house your work internally. An external consultant is going to assist with coding a complex transformation in a Google Cloud Dataflow pipeline for your project. How should you maintain users' privacy? 

A. Grant the consultant the Viewer role on the project.

B. Grant the consultant the Cloud Dataflow Developer role on the project.

C. Create a service account and allow the consultant to log on with it.

D. Create an anonymized sample of the data for the consultant to work with in a different project.

**Answer: D**

**Timestamp: March 11, 2020, 7:18 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16288-exam-professional-data-engineer-topic-1-question-26/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 27 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 27
Topic #: 1

[All Professional Data Engineer Questions]

You are building a model to predict whether or not it will rain on a given day. You have thousands of input features and want to see if you can improve training speed by removing some features while having a minimum effect on model accuracy. What can you do? 

A. Eliminate features that are highly correlated to the output labels.

B. Combine highly co-dependent features into one representative feature.

C. Instead of feeding in each feature individually, average their values in batches of 3.

D. Remove the features that have null values for more than 50% of the training records.

**Answer: B**

**Timestamp: March 19, 2020, 10:54 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16969-exam-professional-data-engineer-topic-1-question-27/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 28 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 28
Topic #: 1

[All Professional Data Engineer Questions]

Your company is performing data preprocessing for a learning algorithm in Google Cloud Dataflow. Numerous data logs are being are being generated during this step, and the team wants to analyze them. Due to the dynamic nature of the campaign, the data is growing exponentially every hour.The data scientists have written the following code to read the data for a new key features in the logs.You want to improve the performance of this data read. What should you do? 

A. Specify the TableReference object in the code.

B. Use .fromQuery operation to read specific fields from the table.

C. Use of both the Google BigQuery TableSchema and TableFieldSchema classes.

D. Call a transform that returns TableRow objects, where each element in the PCollection represents a single row in the table.

**Answer: B**

**Timestamp: Sept. 2, 2022, 1:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79388-exam-professional-data-engineer-topic-1-question-28/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 29 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 29
Topic #: 1

[All Professional Data Engineer Questions]

Your company is streaming real-time sensor data from their factory floor into Bigtable and they have noticed extremely poor performance. How should the row key be redesigned to improve Bigtable performance on queries that populate real-time dashboards? 

A. Use a row key of the form <timestamp>.

B. Use a row key of the form <sensorid>.

C. Use a row key of the form <timestamp>#<sensorid>.

D. Use a row key of the form >#<sensorid>#<timestamp>.

**Answer: D**

**Timestamp: March 20, 2020, 8:08 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17029-exam-professional-data-engineer-topic-1-question-29/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 30 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 30
Topic #: 1

[All Professional Data Engineer Questions]

Your company's customer and order databases are often under heavy load. This makes performing analytics against them difficult without harming operations.The databases are in a MySQL cluster, with nightly backups taken using mysqldump. You want to perform analytics with minimal impact on operations. What should you do? 

A. Add a node to the MySQL cluster and build an OLAP cube there.

B. Use an ETL tool to load the data from MySQL into Google BigQuery.

C. Connect an on-premises Apache Hadoop cluster to MySQL and perform ETL.

D. Mount the backups to Google Cloud SQL, and then process the data using Google Cloud Dataproc.

**Answer: B**

**Timestamp: March 15, 2020, 12:56 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16655-exam-professional-data-engineer-topic-1-question-30/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 31 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 31
Topic #: 1

[All Professional Data Engineer Questions]

You have Google Cloud Dataflow streaming pipeline running with a Google Cloud Pub/Sub subscription as the source. You need to make an update to the code that will make the new Cloud Dataflow pipeline incompatible with the current version. You do not want to lose any data when making this update. What should you do? 

A. Update the current pipeline and use the drain flag.

B. Update the current pipeline and provide the transform mapping JSON object.

C. Create a new pipeline that has the same Cloud Pub/Sub subscription and cancel the old pipeline.

D. Create a new pipeline that has a new Cloud Pub/Sub subscription and cancel the old pipeline.

**Answer: A**

**Timestamp: March 20, 2020, 2:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17051-exam-professional-data-engineer-topic-1-question-31/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 32 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 32
Topic #: 1

[All Professional Data Engineer Questions]

Your company is running their first dynamic campaign, serving different offers by analyzing real-time data during the holiday season. The data scientists are collecting terabytes of data that rapidly grows every hour during their 30-day campaign. They are using Google Cloud Dataflow to preprocess the data and collect the feature (signals) data that is needed for the machine learning model in Google Cloud Bigtable. The team is observing suboptimal performance with reads and writes of their initial load of 10 TB of data. They want to improve this performance while minimizing cost. What should they do? 

A. Redefine the schema by evenly distributing reads and writes across the row space of the table.

B. The performance issue should be resolved over time as the site of the BigDate cluster is increased.

C. Redesign the schema to use a single row key to identify values that need to be updated frequently in the cluster.

D. Redesign the schema to use row keys based on numeric IDs that increase sequentially per user viewing the offers.

**Answer: A**

**Timestamp: March 20, 2020, 2:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17052-exam-professional-data-engineer-topic-1-question-32/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 33 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 33
Topic #: 1

[All Professional Data Engineer Questions]

Your software uses a simple JSON format for all messages. These messages are published to Google Cloud Pub/Sub, then processed with Google CloudDataflow to create a real-time dashboard for the CFO. During testing, you notice that some messages are missing in the dashboard. You check the logs, and all messages are being published to Cloud Pub/Sub successfully. What should you do next? 

A. Check the dashboard application to see if it is not displaying correctly.

B. Run a fixed dataset through the Cloud Dataflow pipeline and analyze the output.

C. Use Google Stackdriver Monitoring on Cloud Pub/Sub to find the missing messages.

D. Switch Cloud Dataflow to pull messages from Cloud Pub/Sub instead of Cloud Pub/Sub pushing messages to Cloud Dataflow.

**Answer: B**

**Timestamp: March 20, 2020, 3:42 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17054-exam-professional-data-engineer-topic-1-question-33/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 34 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 34
Topic #: 1

[All Professional Data Engineer Questions]

Flowlogistic Case Study -Company Overview -Flowlogistic is a leading logistics and supply chain provider. They help businesses throughout the world manage their resources and transport them to their final destination. The company has grown rapidly, expanding their offerings to include rail, truck, aircraft, and oceanic shipping.Company Background -The company started as a regional trucking company, and then expanded into other logistics market. Because they have not updated their infrastructure, managing and tracking orders and shipments has become a bottleneck. To improve operations, Flowlogistic developed proprietary technology for tracking shipments in real time at the parcel level. However, they are unable to deploy it because their technology stack, based on Apache Kafka, cannot support the processing volume. In addition, Flowlogistic wants to further analyze their orders and shipments to determine how best to deploy their resources.Solution Concept -Flowlogistic wants to implement two concepts using the cloud:✑ Use their proprietary technology in a real-time inventory-tracking system that indicates the location of their loads✑ Perform analytics on all their orders and shipment logs, which contain both structured and unstructured data, to determine how best to deploy resources, which markets to expand info. They also want to use predictive analytics to learn earlier when a shipment will be delayed.Existing Technical Environment -Flowlogistic architecture resides in a single data center:✑ Databases8 physical servers in 2 clusters- SQL Server `" user data, inventory, static data3 physical servers- Cassandra `" metadata, tracking messages10 Kafka servers `" tracking message aggregation and batch insert✑ Application servers `" customer front end, middleware for order/customs60 virtual machines across 20 physical servers- Tomcat `" Java services- Nginx `" static content- Batch servers✑ Storage appliances- iSCSI for virtual machine (VM) hosts- Fibre Channel storage area network (FC SAN) `" SQL server storage- Network-attached storage (NAS) image storage, logs, backups✑ 10 Apache Hadoop /Spark servers- Core Data Lake- Data analysis workloads✑ 20 miscellaneous servers- Jenkins, monitoring, bastion hosts,Business Requirements -Build a reliable and reproducible environment with scaled panty of production.✑ Aggregate data in a centralized Data Lake for analysis✑ Use historical data to perform predictive analytics on future shipments✑ Accurately track every shipment worldwide using proprietary technology✑ Improve business agility and speed of innovation through rapid provisioning of new resources✑ Analyze and optimize architecture for performance in the cloud✑ Migrate fully to the cloud if all other requirements are metTechnical Requirements -✑ Handle both streaming and batch data✑ Migrate existing Hadoop workloads✑ Ensure architecture is scalable and elastic to meet the changing demands of the company.✑ Use managed services whenever possible✑ Encrypt data flight and at rest✑ Connect a VPN between the production data center and cloud environmentSEO Statement -We have grown so quickly that our inability to upgrade our infrastructure is really hampering further growth and efficiency. We are efficient at moving shipments around the world, but we are inefficient at moving data around.We need to organize our information so we can more easily understand where our customers are and what they are shipping.CTO Statement -IT has never been a priority for us, so as our data has grown, we have not invested enough in our technology. I have a good staff to manage IT, but they are so busy managing our infrastructure that I cannot get them to do the things that really matter, such as organizing our data, building the analytics, and figuring out how to implement the CFO' s tracking technology.CFO Statement -Part of our competitive advantage is that we penalize ourselves for late shipments and deliveries. Knowing where out shipments are at all times has a direct correlation to our bottom line and profitability. Additionally, I don't want to commit capital to building out a server environment.Flowlogistic wants to use Google BigQuery as their primary analysis system, but they still have Apache Hadoop and Spark workloads that they cannot move toBigQuery. Flowlogistic does not know how to store the data that is common to both workloads. What should they do? 

A. Store the common data in BigQuery as partitioned tables.

B. Store the common data in BigQuery and expose authorized views.

C. Store the common data encoded as Avro in Google Cloud Storage.

D. Store he common data in the HDFS storage for a Google Cloud Dataproc cluster.

**Answer: C**

**Timestamp: Sept. 3, 2022, 12:44 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79622-exam-professional-data-engineer-topic-1-question-34/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 35 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 35
Topic #: 1

[All Professional Data Engineer Questions]

Flowlogistic Case Study -Company Overview -Flowlogistic is a leading logistics and supply chain provider. They help businesses throughout the world manage their resources and transport them to their final destination. The company has grown rapidly, expanding their offerings to include rail, truck, aircraft, and oceanic shipping.Company Background -The company started as a regional trucking company, and then expanded into other logistics market. Because they have not updated their infrastructure, managing and tracking orders and shipments has become a bottleneck. To improve operations, Flowlogistic developed proprietary technology for tracking shipments in real time at the parcel level. However, they are unable to deploy it because their technology stack, based on Apache Kafka, cannot support the processing volume. In addition, Flowlogistic wants to further analyze their orders and shipments to determine how best to deploy their resources.Solution Concept -Flowlogistic wants to implement two concepts using the cloud:✑ Use their proprietary technology in a real-time inventory-tracking system that indicates the location of their loads✑ Perform analytics on all their orders and shipment logs, which contain both structured and unstructured data, to determine how best to deploy resources, which markets to expand info. They also want to use predictive analytics to learn earlier when a shipment will be delayed.Existing Technical Environment -Flowlogistic architecture resides in a single data center:✑ Databases8 physical servers in 2 clusters- SQL Server `" user data, inventory, static data3 physical servers- Cassandra `" metadata, tracking messages10 Kafka servers `" tracking message aggregation and batch insert✑ Application servers `" customer front end, middleware for order/customs60 virtual machines across 20 physical servers- Tomcat `" Java services- Nginx `" static content- Batch servers✑ Storage appliances- iSCSI for virtual machine (VM) hosts- Fibre Channel storage area network (FC SAN) `" SQL server storage- Network-attached storage (NAS) image storage, logs, backups✑ 10 Apache Hadoop /Spark servers- Core Data Lake- Data analysis workloads✑ 20 miscellaneous servers- Jenkins, monitoring, bastion hosts,Business Requirements -✑ Build a reliable and reproducible environment with scaled panty of production.✑ Aggregate data in a centralized Data Lake for analysis✑ Use historical data to perform predictive analytics on future shipments✑ Accurately track every shipment worldwide using proprietary technology✑ Improve business agility and speed of innovation through rapid provisioning of new resources✑ Analyze and optimize architecture for performance in the cloud✑ Migrate fully to the cloud if all other requirements are metTechnical Requirements -✑ Handle both streaming and batch data✑ Migrate existing Hadoop workloads✑ Ensure architecture is scalable and elastic to meet the changing demands of the company.✑ Use managed services whenever possible✑ Encrypt data flight and at rest✑ Connect a VPN between the production data center and cloud environmentSEO Statement -We have grown so quickly that our inability to upgrade our infrastructure is really hampering further growth and efficiency. We are efficient at moving shipments around the world, but we are inefficient at moving data around.We need to organize our information so we can more easily understand where our customers are and what they are shipping.CTO Statement -IT has never been a priority for us, so as our data has grown, we have not invested enough in our technology. I have a good staff to manage IT, but they are so busy managing our infrastructure that I cannot get them to do the things that really matter, such as organizing our data, building the analytics, and figuring out how to implement the CFO' s tracking technology.CFO Statement -Part of our competitive advantage is that we penalize ourselves for late shipments and deliveries. Knowing where out shipments are at all times has a direct correlation to our bottom line and profitability. Additionally, I don't want to commit capital to building out a server environment.Flowlogistic's management has determined that the current Apache Kafka servers cannot handle the data volume for their real-time inventory tracking system.You need to build a new system on Google Cloud Platform (GCP) that will feed the proprietary tracking software. The system must be able to ingest data from a variety of global sources, process and query in real-time, and store the data reliably. Which combination of GCP products should you choose? 

A. Cloud Pub/Sub, Cloud Dataflow, and Cloud Storage

B. Cloud Pub/Sub, Cloud Dataflow, and Local SSD

C. Cloud Pub/Sub, Cloud SQL, and Cloud Storage

D. Cloud Load Balancing, Cloud Dataflow, and Cloud Storage

**Answer: A**

**Timestamp: March 15, 2020, 1:18 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16658-exam-professional-data-engineer-topic-1-question-35/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 37 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 37
Topic #: 1

[All Professional Data Engineer Questions]

Flowlogistic Case Study -Company Overview -Flowlogistic is a leading logistics and supply chain provider. They help businesses throughout the world manage their resources and transport them to their final destination. The company has grown rapidly, expanding their offerings to include rail, truck, aircraft, and oceanic shipping.Company Background -The company started as a regional trucking company, and then expanded into other logistics market. Because they have not updated their infrastructure, managing and tracking orders and shipments has become a bottleneck. To improve operations, Flowlogistic developed proprietary technology for tracking shipments in real time at the parcel level. However, they are unable to deploy it because their technology stack, based on Apache Kafka, cannot support the processing volume. In addition, Flowlogistic wants to further analyze their orders and shipments to determine how best to deploy their resources.Solution Concept -Flowlogistic wants to implement two concepts using the cloud:✑ Use their proprietary technology in a real-time inventory-tracking system that indicates the location of their loads✑ Perform analytics on all their orders and shipment logs, which contain both structured and unstructured data, to determine how best to deploy resources, which markets to expand info. They also want to use predictive analytics to learn earlier when a shipment will be delayed.Existing Technical Environment -Flowlogistic architecture resides in a single data center:✑ Databases8 physical servers in 2 clusters- SQL Server `" user data, inventory, static data3 physical servers- Cassandra `" metadata, tracking messages10 Kafka servers `" tracking message aggregation and batch insert✑ Application servers `" customer front end, middleware for order/customs60 virtual machines across 20 physical servers- Tomcat `" Java services- Nginx `" static content- Batch servers✑ Storage appliances- iSCSI for virtual machine (VM) hosts- Fibre Channel storage area network (FC SAN) `" SQL server storage- Network-attached storage (NAS) image storage, logs, backups✑ 10 Apache Hadoop /Spark servers- Core Data Lake- Data analysis workloads✑ 20 miscellaneous servers- Jenkins, monitoring, bastion hosts,Business Requirements -✑ Build a reliable and reproducible environment with scaled panty of production.✑ Aggregate data in a centralized Data Lake for analysis✑ Use historical data to perform predictive analytics on future shipments✑ Accurately track every shipment worldwide using proprietary technology✑ Improve business agility and speed of innovation through rapid provisioning of new resources✑ Analyze and optimize architecture for performance in the cloud✑ Migrate fully to the cloud if all other requirements are metTechnical Requirements -✑ Handle both streaming and batch data✑ Migrate existing Hadoop workloads✑ Ensure architecture is scalable and elastic to meet the changing demands of the company.✑ Use managed services whenever possible✑ Encrypt data flight and at rest✑ Connect a VPN between the production data center and cloud environmentSEO Statement -We have grown so quickly that our inability to upgrade our infrastructure is really hampering further growth and efficiency. We are efficient at moving shipments around the world, but we are inefficient at moving data around.We need to organize our information so we can more easily understand where our customers are and what they are shipping.CTO Statement -IT has never been a priority for us, so as our data has grown, we have not invested enough in our technology. I have a good staff to manage IT, but they are so busy managing our infrastructure that I cannot get them to do the things that really matter, such as organizing our data, building the analytics, and figuring out how to implement the CFO' s tracking technology.CFO Statement -Part of our competitive advantage is that we penalize ourselves for late shipments and deliveries. Knowing where out shipments are at all times has a direct correlation to our bottom line and profitability. Additionally, I don't want to commit capital to building out a server environment.Flowlogistic is rolling out their real-time inventory tracking system. The tracking devices will all send package-tracking messages, which will now go to a singleGoogle Cloud Pub/Sub topic instead of the Apache Kafka cluster. A subscriber application will then process the messages for real-time reporting and store them inGoogle BigQuery for historical analysis. You want to ensure the package data can be analyzed over time.Which approach should you take? 

A. Attach the timestamp on each message in the Cloud Pub/Sub subscriber application as they are received.

B. Attach the timestamp and Package ID on the outbound message from each publisher device as they are sent to Clod Pub/Sub.

C. Use the NOW () function in BigQuery to record the event's time.

D. Use the automatically generated timestamp from Cloud Pub/Sub to order the data.

**Answer: B**

**Timestamp: March 20, 2020, 4:42 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17059-exam-professional-data-engineer-topic-1-question-37/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 39 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 39
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.✑ Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.✑ Provide reliable and timely access to data for analysis from distributed research workersMaintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -✑ Ensure secure and efficient transport and storage of telemetry data✑ Rapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.✑ Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/day✑ Support rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.You need to compose visualizations for operations teams with the following requirements:✑ The report must include telemetry data from all 50,000 installations for the most resent 6 weeks (sampling once every minute).✑ The report must not be more than 3 hours delayed from live data.✑ The actionable report should only show suboptimal links.✑ Most suboptimal links should be sorted to the top.✑ Suboptimal links can be grouped and filtered by regional geography.✑ User response time to load the report must be <5 seconds.Which approach meets the requirements? 

A. Load the data into Google Sheets, use formulas to calculate a metric, and use filters/sorting to show only suboptimal links in a table.

B. Load the data into Google BigQuery tables, write Google Apps Script that queries the data, calculates the metric, and shows only suboptimal rows in a table in Google Sheets.

C. Load the data into Google Cloud Datastore tables, write a Google App Engine Application that queries all rows, applies a function to derive the metric, and then renders results in a table using the Google charts and visualization API.

D. Load the data into Google BigQuery tables, write a Google Data Studio 360 report that connects to your data, calculates a metric, and then uses a filter expression to show only suboptimal rows in a table.

**Answer: D**

**Timestamp: March 21, 2020, 4:22 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17075-exam-professional-data-engineer-topic-1-question-39/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 40 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 40
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.✑ Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.Provide reliable and timely access to data for analysis from distributed research workers✑ Maintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -✑ Ensure secure and efficient transport and storage of telemetry data✑ Rapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.✑ Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/day✑ Support rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.You create a new report for your large team in Google Data Studio 360. The report uses Google BigQuery as its data source. It is company policy to ensure employees can view only the data associated with their region, so you create and populate a table for each region. You need to enforce the regional access policy to the data.Which two actions should you take? (Choose two.) 

A. Ensure all the tables are included in global dataset.

B. Ensure each table is included in a dataset for a region.

C. Adjust the settings for each table to allow a related region-based security group view access.

D. Adjust the settings for each view to allow a related region-based security group view access.

E. Adjust the settings for each dataset to allow a related region-based security group view access.

**Answer: BE**

**Timestamp: March 21, 2020, 4:25 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17076-exam-professional-data-engineer-topic-1-question-40/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 41 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 41
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.✑ Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.✑ Provide reliable and timely access to data for analysis from distributed research workers✑ Maintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -Ensure secure and efficient transport and storage of telemetry data✑ Rapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.✑ Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/day✑ Support rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.MJTelco needs you to create a schema in Google Bigtable that will allow for the historical analysis of the last 2 years of records. Each record that comes in is sent every 15 minutes, and contains a unique identifier of the device and a data record. The most common query is for all the data for a given device for a given day.Which schema should you use? 

A. Rowkey: date#device_id Column data: data_point

B. Rowkey: date Column data: device_id, data_point

C. Rowkey: device_id Column data: date, data_point

D. Rowkey: data_point Column data: device_id, date

E. Rowkey: date#data_point Column data: device_id

**Answer: A**

**Timestamp: March 15, 2020, 1:42 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16659-exam-professional-data-engineer-topic-1-question-41/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 42 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 42
Topic #: 1

[All Professional Data Engineer Questions]

Your company has recently grown rapidly and now ingesting data at a significantly higher rate than it was previously. You manage the daily batch MapReduce analytics jobs in Apache Hadoop. However, the recent increase in data has meant the batch jobs are falling behind. You were asked to recommend ways the development team could increase the responsiveness of the analytics without increasing costs. What should you recommend they do? 

A. Rewrite the job in Pig.

B. Rewrite the job in Apache Spark.

C. Increase the size of the Hadoop cluster.

D. Decrease the size of the Hadoop cluster but also rewrite the job in Hive.

**Answer: B**

**Timestamp: March 15, 2020, 1:43 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16660-exam-professional-data-engineer-topic-1-question-42/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 43 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 43
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large fast food restaurant chain with over 400,000 employees. You store employee information in Google BigQuery in a Users table consisting of a FirstName field and a LastName field. A member of IT is building an application and asks you to modify the schema and data in BigQuery so the application can query a FullName field consisting of the value of the FirstName field concatenated with a space, followed by the value of the LastName field for each employee. How can you make that data available while minimizing cost? 

A. Create a view in BigQuery that concatenates the FirstName and LastName field values to produce the FullName.

B. Add a new column called FullName to the Users table. Run an UPDATE statement that updates the FullName column for each user with the concatenation of the FirstName and LastName values.

C. Create a Google Cloud Dataflow job that queries BigQuery for the entire Users table, concatenates the FirstName value and LastName value for each user, and loads the proper values for FirstName, LastName, and FullName into a new table in BigQuery.

D. Use BigQuery to export the data for the table to a CSV file. Create a Google Cloud Dataproc job to process the CSV file and output a new CSV file containing the proper values for FirstName, LastName and FullName. Run a BigQuery load job to load the new CSV file into BigQuery.

**Answer: A**

**Timestamp: March 17, 2020, 4:39 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16819-exam-professional-data-engineer-topic-1-question-43/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 44 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 44
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying a new storage system for your mobile application, which is a media streaming service. You decide the best fit is Google Cloud Datastore. You have entities with multiple properties, some of which can take on multiple values. For example, in the entity 'Movie' the property 'actors' and the property'tags' have multiple values but the property 'date released' does not. A typical query would ask for all movies with actor=<actorname> ordered by date_released or all movies with tag=Comedy ordered by date_released. How should you avoid a combinatorial explosion in the number of indexes? 

A. Manually configure the index in your index config as follows:

B. Manually configure the index in your index config as follows:

C. Set the following in your entity options: exclude_from_indexes = 'actors, tags'

D. Set the following in your entity options: exclude_from_indexes = 'date_published'

**Answer: A**

**Timestamp: Sept. 3, 2022, 1:26 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79762-exam-professional-data-engineer-topic-1-question-44/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 45 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 45
Topic #: 1

[All Professional Data Engineer Questions]

You work for a manufacturing plant that batches application log files together into a single log file once a day at 2:00 AM. You have written a Google CloudDataflow job to process that log file. You need to make sure the log file in processed once per day as inexpensively as possible. What should you do? 

A. Change the processing job to use Google Cloud Dataproc instead.

B. Manually start the Cloud Dataflow job each morning when you get into the office.

C. Create a cron job with Google App Engine Cron Service to run the Cloud Dataflow job.

D. Configure the Cloud Dataflow job as a streaming job so that it processes the log data immediately.

**Answer: C**

**Timestamp: March 21, 2020, 7:34 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17080-exam-professional-data-engineer-topic-1-question-45/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 46 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 46
Topic #: 1

[All Professional Data Engineer Questions]

You work for an economic consulting firm that helps companies identify economic trends as they happen. As part of your analysis, you use Google BigQuery to correlate customer data with the average prices of the 100 most common goods sold, including bread, gasoline, milk, and others. The average prices of these goods are updated every 30 minutes. You want to make sure this data stays up to date so you can combine it with other data in BigQuery as cheaply as possible.What should you do? 

A. Load the data every 30 minutes into a new partitioned table in BigQuery.

B. Store and update the data in a regional Google Cloud Storage bucket and create a federated data source in BigQuery

C. Store the data in Google Cloud Datastore. Use Google Cloud Dataflow to query BigQuery and combine the data programmatically with the data stored in Cloud Datastore

D. Store the data in a file in a regional Google Cloud Storage bucket. Use Cloud Dataflow to query BigQuery and combine the data programmatically with the data stored in Google Cloud Storage.

**Answer: B**

**Timestamp: March 11, 2020, 2:31 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16253-exam-professional-data-engineer-topic-1-question-46/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 47 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 47
Topic #: 1

[All Professional Data Engineer Questions]

You are designing the database schema for a machine learning-based food ordering service that will predict what users want to eat. Here is some of the information you need to store:✑ The user profile: What the user likes and doesn't like to eat✑ The user account information: Name, address, preferred meal times✑ The order information: When orders are made, from where, to whomThe database will be used to store all the transactional data of the product. You want to optimize the data schema. Which Google Cloud Platform product should you use? 

A. BigQuery

B. Cloud SQL

C. Cloud Bigtable

D. Cloud Datastore

**Answer: B**

**Timestamp: March 17, 2020, 4:50 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16820-exam-professional-data-engineer-topic-1-question-47/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 48 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 48
Topic #: 1

[All Professional Data Engineer Questions]

Your company is loading comma-separated values (CSV) files into Google BigQuery. The data is fully imported successfully; however, the imported data is not matching byte-to-byte to the source file. What is the most likely cause of this problem? 

A. The CSV data loaded in BigQuery is not flagged as CSV.

B. The CSV data has invalid rows that were skipped on import.

C. The CSV data loaded in BigQuery is not using BigQuery's default encoding.

D. The CSV data has not gone through an ETL phase before loading into BigQuery.

**Answer: C**

**Timestamp: March 21, 2020, 8:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17082-exam-professional-data-engineer-topic-1-question-48/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 49 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 49
Topic #: 1

[All Professional Data Engineer Questions]

Your company produces 20,000 files every hour. Each data file is formatted as a comma separated values (CSV) file that is less than 4 KB. All files must be ingested on Google Cloud Platform before they can be processed. Your company site has a 200 ms latency to Google Cloud, and your Internet connection bandwidth is limited as 50 Mbps. You currently deploy a secure FTP (SFTP) server on a virtual machine in Google Compute Engine as the data ingestion point. A local SFTP client runs on a dedicated machine to transmit the CSV files as is. The goal is to make reports with data from the previous day available to the executives by 10:00 a.m. each day. This design is barely able to keep up with the current volume, even though the bandwidth utilization is rather low.You are told that due to seasonality, your company expects the number of files to double for the next three months. Which two actions should you take? (Choose two.) 

A. Introduce data compression for each file to increase the rate file of file transfer.

B. Contact your internet service provider (ISP) to increase your maximum bandwidth to at least 100 Mbps.

C. Redesign the data ingestion process to use gsutil tool to send the CSV files to a storage bucket in parallel.

D. Assemble 1,000 files into a tape archive (TAR) file. Transmit the TAR files instead, and disassemble the CSV files in the cloud upon receiving them.

E. Create an S3-compatible storage endpoint in your network, and use Google Cloud Storage Transfer Service to transfer on-premises data to the designated storage bucket.

**Answer: CD**

**Timestamp: March 21, 2020, 8:48 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17083-exam-professional-data-engineer-topic-1-question-49/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 50 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 50
Topic #: 1

[All Professional Data Engineer Questions]

You are choosing a NoSQL database to handle telemetry data submitted from millions of Internet-of-Things (IoT) devices. The volume of data is growing at 100TB per year, and each data entry has about 100 attributes. The data processing pipeline does not require atomicity, consistency, isolation, and durability (ACID).However, high availability and low latency are required.You need to analyze the data by querying against individual fields. Which three databases meet your requirements? (Choose three.) 

A. Redis

B. HBase

C. MySQL

D. MongoDB

E. Cassandra

F. HDFS with Hive

**Answer: BDE**

**Timestamp: March 15, 2020, 1:59 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16661-exam-professional-data-engineer-topic-1-question-50/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 51 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 51
Topic #: 1

[All Professional Data Engineer Questions]

You are training a spam classifier. You notice that you are overfitting the training data. Which three actions can you take to resolve this problem? (Choose three.) 

A. Get more training examples

B. Reduce the number of training examples

C. Use a smaller set of features

D. Use a larger set of features

E. Increase the regularization parameters

F. Decrease the regularization parameters

**Answer: ACE**

**Timestamp: March 13, 2020, 10:28 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16468-exam-professional-data-engineer-topic-1-question-51/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 52 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 52
Topic #: 1

[All Professional Data Engineer Questions]

You are implementing security best practices on your data pipeline. Currently, you are manually executing jobs as the Project Owner. You want to automate these jobs by taking nightly batch files containing non-public information from Google Cloud Storage, processing them with a Spark Scala job on a Google CloudDataproc cluster, and depositing the results into Google BigQuery.How should you securely run this workload? 

A. Restrict the Google Cloud Storage bucket so only you can see the files

B. Grant the Project Owner role to a service account, and run the job with it

C. Use a service account with the ability to read the batch files and to write to BigQuery

D. Use a user account with the Project Viewer role on the Cloud Dataproc cluster to read the batch files and write to BigQuery

**Answer: C**

**Timestamp: March 17, 2020, 5:01 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16822-exam-professional-data-engineer-topic-1-question-52/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 53 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 53
Topic #: 1

[All Professional Data Engineer Questions]

You are using Google BigQuery as your data warehouse. Your users report that the following simple query is running very slowly, no matter when they run the query:SELECT country, state, city FROM [myproject:mydataset.mytable] GROUP BY countryYou check the query plan for the query and see the following output in the Read section of Stage:1:What is the most likely cause of the delay for this query? 

A. Users are running too many concurrent queries in the system

B. The [myproject:mydataset.mytable] table has too many partitions

C. Either the state or the city columns in the [myproject:mydataset.mytable] table have too many NULL values

D. Most rows in the [myproject:mydataset.mytable] table have the same value in the country column, causing data skew

**Answer: D**

**Timestamp: March 21, 2020, 9:32 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17085-exam-professional-data-engineer-topic-1-question-53/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 54 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 54
Topic #: 1

[All Professional Data Engineer Questions]

Your globally distributed auction application allows users to bid on items. Occasionally, users place identical bids at nearly identical times, and different application servers process those bids. Each bid event contains the item, amount, user, and timestamp. You want to collate those bid events into a single location in real time to determine which user bid first. What should you do? 

A. Create a file on a shared file and have the application servers write all bid events to that file. Process the file with Apache Hadoop to identify which user bid first.

B. Have each application server write the bid events to Cloud Pub/Sub as they occur. Push the events from Cloud Pub/Sub to a custom endpoint that writes the bid event information into Cloud SQL.

C. Set up a MySQL database for each application server to write bid events into. Periodically query each of those distributed MySQL databases and update a master MySQL database with bid event information.

D. Have each application server write the bid events to Google Cloud Pub/Sub as they occur. Use a pull subscription to pull the bid events using Google Cloud Dataflow. Give the bid for each item to the user in the bid event that is processed first.

**Answer: D**

**Timestamp: March 15, 2020, 4:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16670-exam-professional-data-engineer-topic-1-question-54/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 55 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 55
Topic #: 1

[All Professional Data Engineer Questions]

Your organization has been collecting and analyzing data in Google BigQuery for 6 months. The majority of the data analyzed is placed in a time-partitioned table named events_partitioned. To reduce the cost of queries, your organization created a view called events, which queries only the last 14 days of data. The view is described in legacy SQL. Next month, existing applications will be connecting to BigQuery to read the events data via an ODBC connection. You need to ensure the applications can connect. Which two actions should you take? (Choose two.) 

A. Create a new view over events using standard SQL

B. Create a new partitioned table using a standard SQL query

C. Create a new view over events_partitioned using standard SQL

D. Create a service account for the ODBC connection to use for authentication

E. Create a Google Cloud Identity and Access Management (Cloud IAM) role for the ODBC connection and shared ג€eventsג€

**Answer: CD**

**Timestamp: March 15, 2020, 4:14 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16669-exam-professional-data-engineer-topic-1-question-55/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 56 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 56
Topic #: 1

[All Professional Data Engineer Questions]

You have enabled the free integration between Firebase Analytics and Google BigQuery. Firebase now automatically creates a new table daily in BigQuery in the format app_events_YYYYMMDD. You want to query all of the tables for the past 30 days in legacy SQL. What should you do? 

A. Use the TABLE_DATE_RANGE function

B. Use the WHERE_PARTITIONTIME pseudo column

C. Use WHERE date BETWEEN YYYY-MM-DD AND YYYY-MM-DD

D. Use SELECT IF.(date >= YYYY-MM-DD AND date <= YYYY-MM-DD

**Answer: A**

**Timestamp: Sept. 19, 2022, 8:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/82857-exam-professional-data-engineer-topic-1-question-56/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 57 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 57
Topic #: 1

[All Professional Data Engineer Questions]

Your company is currently setting up data pipelines for their campaign. For all the Google Cloud Pub/Sub streaming data, one of the important business requirements is to be able to periodically identify the inputs and their timings during their campaign. Engineers have decided to use windowing and transformation in Google Cloud Dataflow for this purpose. However, when testing this feature, they find that the Cloud Dataflow job fails for the all streaming insert. What is the most likely cause of this problem? 

A. They have not assigned the timestamp, which causes the job to fail

B. They have not set the triggers to accommodate the data coming in late, which causes the job to fail

C. They have not applied a global windowing function, which causes the job to fail when the pipeline is created

D. They have not applied a non-global windowing function, which causes the job to fail when the pipeline is created

**Answer: D**

**Timestamp: March 15, 2020, 5:05 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16673-exam-professional-data-engineer-topic-1-question-57/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 58 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 58
Topic #: 1

[All Professional Data Engineer Questions]

You architect a system to analyze seismic data. Your extract, transform, and load (ETL) process runs as a series of MapReduce jobs on an Apache Hadoop cluster. The ETL process takes days to process a data set because some steps are computationally expensive. Then you discover that a sensor calibration step has been omitted. How should you change your ETL process to carry out sensor calibration systematically in the future? 

A. Modify the transformMapReduce jobs to apply sensor calibration before they do anything else.

B. Introduce a new MapReduce job to apply sensor calibration to raw data, and ensure all other MapReduce jobs are chained after this.

C. Add sensor calibration data to the output of the ETL process, and document that all users need to apply sensor calibration themselves.

D. Develop an algorithm through simulation to predict variance of data output from the last MapReduce job based on calibration factors, and apply the correction to all data.

**Answer: B**

**Timestamp: March 21, 2020, 11:31 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17090-exam-professional-data-engineer-topic-1-question-58/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 59 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 59
Topic #: 1

[All Professional Data Engineer Questions]

An online retailer has built their current application on Google App Engine. A new initiative at the company mandates that they extend their application to allow their customers to transact directly via the application. They need to manage their shopping transactions and analyze combined data from multiple datasets using a business intelligence (BI) tool. They want to use only a single database for this purpose. Which Google Cloud database should they choose? 

A. BigQuery

B. Cloud SQL

C. Cloud BigTable

D. Cloud Datastore

**Answer: B**

**Timestamp: Sept. 7, 2022, 5:35 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/80950-exam-professional-data-engineer-topic-1-question-59/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 60 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 60
Topic #: 1

[All Professional Data Engineer Questions]

You launched a new gaming app almost three years ago. You have been uploading log files from the previous day to a separate Google BigQuery table with the table name format LOGS_yyyymmdd. You have been using table wildcard functions to generate daily and monthly reports for all time ranges. Recently, you discovered that some queries that cover long date ranges are exceeding the limit of 1,000 tables and failing. How can you resolve this issue? 

A. Convert all daily log tables into date-partitioned tables

B. Convert the sharded tables into a single partitioned table

C. Enable query caching so you can cache data from previous months

D. Create separate views to cover each month, and query from these views

**Answer: B**

**Timestamp: March 21, 2020, 1:28 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17096-exam-professional-data-engineer-topic-1-question-60/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 62 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 62
Topic #: 1

[All Professional Data Engineer Questions]

Your company receives both batch- and stream-based event data. You want to process the data using Google Cloud Dataflow over a predictable time period.However, you realize that in some instances data can arrive late or out of order. How should you design your Cloud Dataflow pipeline to handle data that is late or out of order? 

A. Set a single global window to capture all the data.

B. Set sliding windows to capture all the lagged data.

C. Use watermarks and timestamps to capture the lagged data.

D. Ensure every datasource type (stream or batch) has a timestamp, and use the timestamps to define the logic for lagged data.

**Answer: C**

**Timestamp: March 21, 2020, 3:16 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17104-exam-professional-data-engineer-topic-1-question-62/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 63 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 63
Topic #: 1

[All Professional Data Engineer Questions]

You have some data, which is shown in the graphic below. The two dimensions are X and Y, and the shade of each dot represents what class it is. You want to classify this data accurately using a linear algorithm. To do this you need to add a synthetic feature. What should the value of that feature be? 

A. X2+Y2

B. X2

C. Y2

D. cos(X)

**Answer: A**

**Timestamp: March 16, 2020, 2:39 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16745-exam-professional-data-engineer-topic-1-question-63/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 64 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 64
Topic #: 1

[All Professional Data Engineer Questions]

You are integrating one of your internal IT applications and Google BigQuery, so users can query BigQuery from the application's interface. You do not want individual users to authenticate to BigQuery and you do not want to give them access to the dataset. You need to securely access BigQuery from your IT application. What should you do? 

A. Create groups for your users and give those groups access to the dataset

B. Integrate with a single sign-on (SSO) platform, and pass each user's credentials along with the query request

C. Create a service account and grant dataset access to that account. Use the service account's private key to access the dataset

D. Create a dummy user and grant dataset access to that user. Store the username and password for that user in a file on the files system, and use those credentials to access the BigQuery dataset

**Answer: C**

**Timestamp: March 21, 2020, 3:26 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17105-exam-professional-data-engineer-topic-1-question-64/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 65 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 65
Topic #: 1

[All Professional Data Engineer Questions]

You are building a data pipeline on Google Cloud. You need to prepare data using a casual method for a machine-learning process. You want to support a logistic regression model. You also need to monitor and adjust for null values, which must remain real-valued and cannot be removed. What should you do? 

A. Use Cloud Dataprep to find null values in sample source data. Convert all nulls to 'none' using a Cloud Dataproc job.

B. Use Cloud Dataprep to find null values in sample source data. Convert all nulls to 0 using a Cloud Dataprep job.

C. Use Cloud Dataflow to find null values in sample source data. Convert all nulls to 'none' using a Cloud Dataprep job.

D. Use Cloud Dataflow to find null values in sample source data. Convert all nulls to 0 using a custom script.

**Answer: B**

**Timestamp: March 13, 2020, 1:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16476-exam-professional-data-engineer-topic-1-question-65/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 66 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 66
Topic #: 1

[All Professional Data Engineer Questions]

You set up a streaming data insert into a Redis cluster via a Kafka cluster. Both clusters are running on Compute Engine instances. You need to encrypt data at rest with encryption keys that you can create, rotate, and destroy as needed. What should you do? 

A. Create a dedicated service account, and use encryption at rest to reference your data stored in your Compute Engine cluster instances as part of your API service calls.

B. Create encryption keys in Cloud Key Management Service. Use those keys to encrypt your data in all of the Compute Engine cluster instances.

C. Create encryption keys locally. Upload your encryption keys to Cloud Key Management Service. Use those keys to encrypt your data in all of the Compute Engine cluster instances.

D. Create encryption keys in Cloud Key Management Service. Reference those keys in your API service calls when accessing the data in your Compute Engine cluster instances.

**Answer: B**

**Timestamp: March 21, 2020, 4:16 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17109-exam-professional-data-engineer-topic-1-question-66/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 67 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 67
Topic #: 1

[All Professional Data Engineer Questions]

You are developing an application that uses a recommendation engine on Google Cloud. Your solution should display new videos to customers based on past views. Your solution needs to generate labels for the entities in videos that the customer has viewed. Your design must be able to provide very fast filtering suggestions based on data from other customer preferences on several TB of data. What should you do? 

A. Build and train a complex classification model with Spark MLlib to generate labels and filter the results. Deploy the models using Cloud Dataproc. Call the model from your application.

B. Build and train a classification model with Spark MLlib to generate labels. Build and train a second classification model with Spark MLlib to filter results to match customer preferences. Deploy the models using Cloud Dataproc. Call the models from your application.

C. Build an application that calls the Cloud Video Intelligence API to generate labels. Store data in Cloud Bigtable, and filter the predicted labels to match the user's viewing history to generate preferences.

D. Build an application that calls the Cloud Video Intelligence API to generate labels. Store data in Cloud SQL, and join and filter the predicted labels to match the user's viewing history to generate preferences.

**Answer: C**

**Timestamp: March 21, 2020, 4:25 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17110-exam-professional-data-engineer-topic-1-question-67/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 68 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 68
Topic #: 1

[All Professional Data Engineer Questions]

You are selecting services to write and transform JSON messages from Cloud Pub/Sub to BigQuery for a data pipeline on Google Cloud. You want to minimize service costs. You also want to monitor and accommodate input data volume that will vary in size with minimal manual intervention. What should you do? 

A. Use Cloud Dataproc to run your transformations. Monitor CPU utilization for the cluster. Resize the number of worker nodes in your cluster via the command line.

B. Use Cloud Dataproc to run your transformations. Use the diagnose command to generate an operational output archive. Locate the bottleneck and adjust cluster resources.

C. Use Cloud Dataflow to run your transformations. Monitor the job system lag with Stackdriver. Use the default autoscaling setting for worker instances.

D. Use Cloud Dataflow to run your transformations. Monitor the total execution time for a sampling of jobs. Configure the job to use non-default Compute Engine machine types when needed.

**Answer: C**

**Timestamp: March 13, 2020, 2:01 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16478-exam-professional-data-engineer-topic-1-question-68/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 69 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 69
Topic #: 1

[All Professional Data Engineer Questions]

Your infrastructure includes a set of YouTube channels. You have been tasked with creating a process for sending the YouTube channel data to Google Cloud for analysis. You want to design a solution that allows your world-wide marketing teams to perform ANSI SQL and other types of analysis on up-to-date YouTube channels log data. How should you set up the log data transfer into Google Cloud? 

A. Use Storage Transfer Service to transfer the offsite backup files to a Cloud Storage Multi-Regional storage bucket as a final destination.

B. Use Storage Transfer Service to transfer the offsite backup files to a Cloud Storage Regional bucket as a final destination.

C. Use BigQuery Data Transfer Service to transfer the offsite backup files to a Cloud Storage Multi-Regional storage bucket as a final destination.

D. Use BigQuery Data Transfer Service to transfer the offsite backup files to a Cloud Storage Regional storage bucket as a final destination.

**Answer: C**

**Timestamp: March 10, 2020, 1:10 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16072-exam-professional-data-engineer-topic-1-question-69/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 70 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 70
Topic #: 1

[All Professional Data Engineer Questions]

You are designing storage for very large text files for a data pipeline on Google Cloud. You want to support ANSI SQL queries. You also want to support compression and parallel load from the input locations using Google recommended practices. What should you do? 

A. Transform text files to compressed Avro using Cloud Dataflow. Use BigQuery for storage and query.

B. Transform text files to compressed Avro using Cloud Dataflow. Use Cloud Storage and BigQuery permanent linked tables for query.

C. Compress text files to gzip using the Grid Computing Tools. Use BigQuery for storage and query.

D. Compress text files to gzip using the Grid Computing Tools. Use Cloud Storage, and then import into Cloud Bigtable for query.

**Answer: B**

**Timestamp: March 15, 2020, 6:11 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16631-exam-professional-data-engineer-topic-1-question-70/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 71 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 71
Topic #: 1

[All Professional Data Engineer Questions]

You are developing an application on Google Cloud that will automatically generate subject labels for users' blog posts. You are under competitive pressure to add this feature quickly, and you have no additional developer resources. No one on your team has experience with machine learning. What should you do? 

A. Call the Cloud Natural Language API from your application. Process the generated Entity Analysis as labels.

B. Call the Cloud Natural Language API from your application. Process the generated Sentiment Analysis as labels.

C. Build and train a text classification model using TensorFlow. Deploy the model using Cloud Machine Learning Engine. Call the model from your application and process the results as labels.

D. Build and train a text classification model using TensorFlow. Deploy the model using a Kubernetes Engine cluster. Call the model from your application and process the results as labels.

**Answer: A**

**Timestamp: March 21, 2020, 4:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17111-exam-professional-data-engineer-topic-1-question-71/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 72 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 72
Topic #: 1

[All Professional Data Engineer Questions]

You are designing storage for 20 TB of text files as part of deploying a data pipeline on Google Cloud. Your input data is in CSV format. You want to minimize the cost of querying aggregate values for multiple users who will query the data in Cloud Storage with multiple engines. Which storage service and schema design should you use? 

A. Use Cloud Bigtable for storage. Install the HBase shell on a Compute Engine instance to query the Cloud Bigtable data.

B. Use Cloud Bigtable for storage. Link as permanent tables in BigQuery for query.

C. Use Cloud Storage for storage. Link as permanent tables in BigQuery for query.

D. Use Cloud Storage for storage. Link as temporary tables in BigQuery for query.

**Answer: C**

**Timestamp: March 17, 2020, 8:06 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16832-exam-professional-data-engineer-topic-1-question-72/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 73 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 73
Topic #: 1

[All Professional Data Engineer Questions]

You are designing storage for two relational tables that are part of a 10-TB database on Google Cloud. You want to support transactions that scale horizontally.You also want to optimize data for range queries on non-key columns. What should you do? 

A. Use Cloud SQL for storage. Add secondary indexes to support query patterns.

B. Use Cloud SQL for storage. Use Cloud Dataflow to transform data to support query patterns.

C. Use Cloud Spanner for storage. Add secondary indexes to support query patterns.

D. Use Cloud Spanner for storage. Use Cloud Dataflow to transform data to support query patterns.

**Answer: C**

**Timestamp: March 21, 2020, 4:52 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17112-exam-professional-data-engineer-topic-1-question-73/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 74 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 74
Topic #: 1

[All Professional Data Engineer Questions]

Your financial services company is moving to cloud technology and wants to store 50 TB of financial time-series data in the cloud. This data is updated frequently and new data will be streaming in all the time. Your company also wants to move their existing Apache Hadoop jobs to the cloud to get insights into this data.Which product should they use to store the data? 

A. Cloud Bigtable

B. Google BigQuery

C. Google Cloud Storage

D. Google Cloud Datastore

**Answer: A**

**Timestamp: Sept. 2, 2022, 9:42 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79320-exam-professional-data-engineer-topic-1-question-74/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 75 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 75
Topic #: 1

[All Professional Data Engineer Questions]

An organization maintains a Google BigQuery dataset that contains tables with user-level data. They want to expose aggregates of this data to other GoogleCloud projects, while still controlling access to the user-level data. Additionally, they need to minimize their overall storage cost and ensure the analysis cost for other projects is assigned to those projects. What should they do? 

A. Create and share an authorized view that provides the aggregate results.

B. Create and share a new dataset and view that provides the aggregate results.

C. Create and share a new dataset and table that contains the aggregate results.

D. Create dataViewer Identity and Access Management (IAM) roles on the dataset to enable sharing.

**Answer: A**

**Timestamp: Sept. 3, 2022, 1:51 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79767-exam-professional-data-engineer-topic-1-question-75/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 76 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 76
Topic #: 1

[All Professional Data Engineer Questions]

Government regulations in your industry mandate that you have to maintain an auditable record of access to certain types of data. Assuming that all expiring logs will be archived correctly, where should you store data that is subject to that mandate? 

A. Encrypted on Cloud Storage with user-supplied encryption keys. A separate decryption key will be given to each authorized user.

B. In a BigQuery dataset that is viewable only by authorized personnel, with the Data Access log used to provide the auditability.

C. In Cloud SQL, with separate database user names to each user. The Cloud SQL Admin activity logs will be used to provide the auditability.

D. In a bucket on Cloud Storage that is accessible only by an AppEngine service that collects user information and logs the access before providing a link to the bucket.

**Answer: B**

**Timestamp: March 21, 2020, 6:01 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17114-exam-professional-data-engineer-topic-1-question-76/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 77 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 77
Topic #: 1

[All Professional Data Engineer Questions]

Your neural network model is taking days to train. You want to increase the training speed. What can you do? 

A. Subsample your test dataset.

B. Subsample your training dataset.

C. Increase the number of input features to your model.

D. Increase the number of layers in your neural network.

**Answer: B**

**Timestamp: Sept. 2, 2022, 11:01 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79343-exam-professional-data-engineer-topic-1-question-77/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 78 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 78
Topic #: 1

[All Professional Data Engineer Questions]

You are responsible for writing your company's ETL pipelines to run on an Apache Hadoop cluster. The pipeline will require some checkpointing and splitting pipelines. Which method should you use to write the pipelines? 

A. PigLatin using Pig

B. HiveQL using Hive

C. Java using MapReduce

D. Python using MapReduce

**Answer: A**

**Timestamp: March 21, 2020, 6:11 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17115-exam-professional-data-engineer-topic-1-question-78/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 79 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 79
Topic #: 1

[All Professional Data Engineer Questions]

Your company maintains a hybrid deployment with GCP, where analytics are performed on your anonymized customer data. The data are imported to CloudStorage from your data center through parallel uploads to a data transfer server running on GCP. Management informs you that the daily transfers take too long and have asked you to fix the problem. You want to maximize transfer speeds. Which action should you take? 

A. Increase the CPU size on your server.

B. Increase the size of the Google Persistent Disk on your server.

C. Increase your network bandwidth from your datacenter to GCP.

D. Increase your network bandwidth from Compute Engine to Cloud Storage.

**Answer: C**

**Timestamp: March 21, 2020, 6:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17118-exam-professional-data-engineer-topic-1-question-79/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 80 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 80
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.✑ Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.✑ Provide reliable and timely access to data for analysis from distributed research workers✑ Maintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -Ensure secure and efficient transport and storage of telemetry dataRapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/daySupport rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.MJTelco is building a custom interface to share data. They have these requirements:1. They need to do aggregations over their petabyte-scale datasets.2. They need to scan specific time range rows with a very fast response time (milliseconds).Which combination of Google Cloud Platform products should you recommend? 

A. Cloud Datastore and Cloud Bigtable

B. Cloud Bigtable and Cloud SQL

C. BigQuery and Cloud Bigtable

D. BigQuery and Cloud Storage

**Answer: C**

**Timestamp: March 21, 2020, 6:19 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17119-exam-professional-data-engineer-topic-1-question-80/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 81 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 81
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.✑ Provide reliable and timely access to data for analysis from distributed research workers✑ Maintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -Ensure secure and efficient transport and storage of telemetry dataRapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/daySupport rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.You need to compose visualization for operations teams with the following requirements:✑ Telemetry must include data from all 50,000 installations for the most recent 6 weeks (sampling once every minute)✑ The report must not be more than 3 hours delayed from live data.✑ The actionable report should only show suboptimal links.✑ Most suboptimal links should be sorted to the top.Suboptimal links can be grouped and filtered by regional geography.✑ User response time to load the report must be <5 seconds.You create a data source to store the last 6 weeks of data, and create visualizations that allow viewers to see multiple date ranges, distinct geographic regions, and unique installation types. You always show the latest data without any changes to your visualizations. You want to avoid creating and updating new visualizations each month. What should you do? 

A. Look through the current data and compose a series of charts and tables, one for each possible combination of criteria.

B. Look through the current data and compose a small set of generalized charts and tables bound to criteria filters that allow value selection.

C. Export the data to a spreadsheet, compose a series of charts and tables, one for each possible combination of criteria, and spread them across multiple tabs.

D. Load the data into relational database tables, write a Google App Engine application that queries all rows, summarizes the data across each criteria, and then renders results using the Google Charts and visualization API.

**Answer: B**

**Timestamp: March 22, 2020, 6:19 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17264-exam-professional-data-engineer-topic-1-question-81/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 82 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 82
Topic #: 1

[All Professional Data Engineer Questions]

MJTelco Case Study -Company Overview -MJTelco is a startup that plans to build networks in rapidly growing, underserved markets around the world. The company has patents for innovative optical communications hardware. Based on these patents, they can create many reliable, high-speed backbone links with inexpensive hardware.Company Background -Founded by experienced telecom executives, MJTelco uses technologies originally developed to overcome communications challenges in space. Fundamental to their operation, they need to create a distributed data infrastructure that drives real-time analysis and incorporates machine learning to continuously optimize their topologies. Because their hardware is inexpensive, they plan to overdeploy the network allowing them to account for the impact of dynamic regional politics on location availability and cost.Their management and operations teams are situated all around the globe creating many-to-many relationship between data consumers and provides in their system. After careful consideration, they decided public cloud is the perfect environment to support their needs.Solution Concept -MJTelco is running a successful proof-of-concept (PoC) project in its labs. They have two primary needs:✑ Scale and harden their PoC to support significantly more data flows generated when they ramp to more than 50,000 installations.✑ Refine their machine-learning cycles to verify and improve the dynamic models they use to control topology definition.MJTelco will also use three separate operating environments `" development/test, staging, and production `" to meet the needs of running experiments, deploying new features, and serving production customers.Business Requirements -✑ Scale up their production environment with minimal cost, instantiating resources when and where needed in an unpredictable, distributed telecom user community.✑ Ensure security of their proprietary data to protect their leading-edge machine learning and analysis.✑ Provide reliable and timely access to data for analysis from distributed research workers✑ Maintain isolated environments that support rapid iteration of their machine-learning models without affecting their customers.Technical Requirements -Ensure secure and efficient transport and storage of telemetry dataRapidly scale instances to support between 10,000 and 100,000 data providers with multiple flows each.Allow analysis and presentation against data tables tracking up to 2 years of data storing approximately 100m records/daySupport rapid iteration of monitoring infrastructure focused on awareness of data pipeline problems both in telemetry flows and in production learning cycles.CEO Statement -Our business model relies on our patents, analytics and dynamic machine learning. Our inexpensive hardware is organized to be highly reliable, which gives us cost advantages. We need to quickly stabilize our large distributed data pipelines to meet our reliability and capacity commitments.CTO Statement -Our public cloud services must operate as advertised. We need resources that scale and keep our data secure. We also need environments in which our data scientists can carefully study and quickly adapt our models. Because we rely on automation to process our data, we also need our development and test environments to work as we iterate.CFO Statement -The project is too large for us to maintain the hardware and software required for the data and analysis. Also, we cannot afford to staff an operations team to monitor so many data feeds, so we will rely on automation and infrastructure. Google Cloud's machine learning will allow our quantitative researchers to work on our high-value problems instead of problems with our data pipelines.Given the record streams MJTelco is interested in ingesting per day, they are concerned about the cost of Google BigQuery increasing. MJTelco asks you to provide a design solution. They require a single large data table called tracking_table. Additionally, they want to minimize the cost of daily queries while performing fine-grained analysis of each day's events. They also want to use streaming ingestion. What should you do? 

A. Create a table called tracking_table and include a DATE column.

B. Create a partitioned table called tracking_table and include a TIMESTAMP column.

C. Create sharded tables for each day following the pattern tracking_table_YYYYMMDD.

D. Create a table called tracking_table with a TIMESTAMP column to represent the day.

**Answer: B**

**Timestamp: March 22, 2020, 6:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17263-exam-professional-data-engineer-topic-1-question-82/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 83 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 83
Topic #: 1

[All Professional Data Engineer Questions]

Flowlogistic Case Study -Company Overview -Flowlogistic is a leading logistics and supply chain provider. They help businesses throughout the world manage their resources and transport them to their final destination. The company has grown rapidly, expanding their offerings to include rail, truck, aircraft, and oceanic shipping.Company Background -The company started as a regional trucking company, and then expanded into other logistics market. Because they have not updated their infrastructure, managing and tracking orders and shipments has become a bottleneck. To improve operations, Flowlogistic developed proprietary technology for tracking shipments in real time at the parcel level. However, they are unable to deploy it because their technology stack, based on Apache Kafka, cannot support the processing volume. In addition, Flowlogistic wants to further analyze their orders and shipments to determine how best to deploy their resources.Solution Concept -Flowlogistic wants to implement two concepts using the cloud:✑ Use their proprietary technology in a real-time inventory-tracking system that indicates the location of their loads✑ Perform analytics on all their orders and shipment logs, which contain both structured and unstructured data, to determine how best to deploy resources, which markets to expand info. They also want to use predictive analytics to learn earlier when a shipment will be delayed.Existing Technical Environment -Flowlogistic architecture resides in a single data center:✑ Databases- 8 physical servers in 2 clusters- SQL Server `" user data, inventory, static data- 3 physical servers- Cassandra `" metadata, tracking messages10 Kafka servers `" tracking message aggregation and batch insert✑ Application servers `" customer front end, middleware for order/customs- 60 virtual machines across 20 physical servers- Tomcat `" Java services- Nginx `" static content- Batch servers✑ Storage appliances- iSCSI for virtual machine (VM) hosts- Fibre Channel storage area network (FC SAN) `" SQL server storageNetwork-attached storage (NAS) image storage, logs, backups✑ 10 Apache Hadoop /Spark servers- Core Data Lake- Data analysis workloads✑ 20 miscellaneous servers- Jenkins, monitoring, bastion hosts,Business Requirements -✑ Build a reliable and reproducible environment with scaled panty of production.✑ Aggregate data in a centralized Data Lake for analysis✑ Use historical data to perform predictive analytics on future shipments✑ Accurately track every shipment worldwide using proprietary technology✑ Improve business agility and speed of innovation through rapid provisioning of new resources✑ Analyze and optimize architecture for performance in the cloud✑ Migrate fully to the cloud if all other requirements are metTechnical Requirements -✑ Handle both streaming and batch data✑ Migrate existing Hadoop workloads✑ Ensure architecture is scalable and elastic to meet the changing demands of the company.✑ Use managed services whenever possible✑ Encrypt data flight and at restConnect a VPN between the production data center and cloud environmentSEO Statement -We have grown so quickly that our inability to upgrade our infrastructure is really hampering further growth and efficiency. We are efficient at moving shipments around the world, but we are inefficient at moving data around.We need to organize our information so we can more easily understand where our customers are and what they are shipping.CTO Statement -IT has never been a priority for us, so as our data has grown, we have not invested enough in our technology. I have a good staff to manage IT, but they are so busy managing our infrastructure that I cannot get them to do the things that really matter, such as organizing our data, building the analytics, and figuring out how to implement the CFO' s tracking technology.CFO Statement -Part of our competitive advantage is that we penalize ourselves for late shipments and deliveries. Knowing where out shipments are at all times has a direct correlation to our bottom line and profitability. Additionally, I don't want to commit capital to building out a server environment.Flowlogistic's management has determined that the current Apache Kafka servers cannot handle the data volume for their real-time inventory tracking system.You need to build a new system on Google Cloud Platform (GCP) that will feed the proprietary tracking software. The system must be able to ingest data from a variety of global sources, process and query in real-time, and store the data reliably. Which combination of GCP products should you choose? 

A. Cloud Pub/Sub, Cloud Dataflow, and Cloud Storage

B. Cloud Pub/Sub, Cloud Dataflow, and Local SSD

C. Cloud Pub/Sub, Cloud SQL, and Cloud Storage

D. Cloud Load Balancing, Cloud Dataflow, and Cloud Storage

E. Cloud Dataflow, Cloud SQL, and Cloud Storage

**Answer: A**

**Timestamp: March 22, 2020, 6:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17262-exam-professional-data-engineer-topic-1-question-83/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 84 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 84
Topic #: 1

[All Professional Data Engineer Questions]

After migrating ETL jobs to run on BigQuery, you need to verify that the output of the migrated jobs is the same as the output of the original. You've loaded a table containing the output of the original job and want to compare the contents with output from the migrated job to show that they are identical. The tables do not contain a primary key column that would enable you to join them together for comparison.What should you do? 

A. Select random samples from the tables using the RAND() function and compare the samples.

B. Select random samples from the tables using the HASH() function and compare the samples.

C. Use a Dataproc cluster and the BigQuery Hadoop connector to read the data from each table and calculate a hash from non-timestamp columns of the table after sorting. Compare the hashes of each table.

D. Create stratified random samples using the OVER() function and compare equivalent samples from each table.

**Answer: C**

**Timestamp: March 17, 2020, 8:31 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16835-exam-professional-data-engineer-topic-1-question-84/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 85 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 85
Topic #: 1

[All Professional Data Engineer Questions]

You are a head of BI at a large enterprise company with multiple business units that each have different priorities and budgets. You use on-demand pricing forBigQuery with a quota of 2K concurrent on-demand slots per project. Users at your organization sometimes don't get slots to execute their query and you need to correct this. You'd like to avoid introducing new projects to your account.What should you do? 

A. Convert your batch BQ queries into interactive BQ queries.

B. Create an additional project to overcome the 2K on-demand per-project quota.

C. Switch to flat-rate pricing and establish a hierarchical priority model for your projects.

D. Increase the amount of concurrent slots per project at the Quotas page at the Cloud Console.

**Answer: C**

**Timestamp: Sept. 21, 2022, 6:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/83115-exam-professional-data-engineer-topic-1-question-85/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 86 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 86
Topic #: 1

[All Professional Data Engineer Questions]

You have an Apache Kafka cluster on-prem with topics containing web application logs. You need to replicate the data to Google Cloud for analysis in BigQuery and Cloud Storage. The preferred replication method is mirroring to avoid deployment of Kafka Connect plugins.What should you do? 

A. Deploy a Kafka cluster on GCE VM Instances. Configure your on-prem cluster to mirror your topics to the cluster running in GCE. Use a Dataproc cluster or Dataflow job to read from Kafka and write to GCS.

B. Deploy a Kafka cluster on GCE VM Instances with the Pub/Sub Kafka connector configured as a Sink connector. Use a Dataproc cluster or Dataflow job to read from Kafka and write to GCS.

C. Deploy the Pub/Sub Kafka connector to your on-prem Kafka cluster and configure Pub/Sub as a Source connector. Use a Dataflow job to read from Pub/Sub and write to GCS.

D. Deploy the Pub/Sub Kafka connector to your on-prem Kafka cluster and configure Pub/Sub as a Sink connector. Use a Dataflow job to read from Pub/Sub and write to GCS.

**Answer: A**

**Timestamp: March 22, 2020, 4:20 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17173-exam-professional-data-engineer-topic-1-question-86/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 87 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 87
Topic #: 1

[All Professional Data Engineer Questions]

You've migrated a Hadoop job from an on-prem cluster to dataproc and GCS. Your Spark job is a complicated analytical workload that consists of many shuffling operations and initial data are parquet files (on average 200-400 MB size each). You see some degradation in performance after the migration to Dataproc, so you'd like to optimize for it. You need to keep in mind that your organization is very cost-sensitive, so you'd like to continue using Dataproc on preemptibles (with 2 non-preemptible workers only) for this workload.What should you do? 

A. Increase the size of your parquet files to ensure them to be 1 GB minimum.

B. Switch to TFRecords formats (appr. 200MB per file) instead of parquet files.

C. Switch from HDDs to SSDs, copy initial data from GCS to HDFS, run the Spark job and copy results back to GCS.

D. Switch from HDDs to SSDs, override the preemptible VMs configuration to increase the boot disk size.

**Answer: D**

**Timestamp: March 14, 2020, 2:44 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16572-exam-professional-data-engineer-topic-1-question-87/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 88 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 88
Topic #: 1

[All Professional Data Engineer Questions]

Your team is responsible for developing and maintaining ETLs in your company. One of your Dataflow jobs is failing because of some errors in the input data, and you need to improve reliability of the pipeline (incl. being able to reprocess all failing data).What should you do? 

A. Add a filtering step to skip these types of errors in the future, extract erroneous rows from logs.

B. Add a tryג€¦ catch block to your DoFn that transforms the data, extract erroneous rows from logs.

C. Add a tryג€¦ catch block to your DoFn that transforms the data, write erroneous rows to Pub/Sub PubSub directly from the DoFn.

D. Add a tryג€¦ catch block to your DoFn that transforms the data, use a sideOutput to create a PCollection that can be stored to Pub/Sub later.

**Answer: D**

**Timestamp: Sept. 3, 2022, 1:58 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79771-exam-professional-data-engineer-topic-1-question-88/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 89 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 89
Topic #: 1

[All Professional Data Engineer Questions]

You're training a model to predict housing prices based on an available dataset with real estate properties. Your plan is to train a fully connected neural net, and you've discovered that the dataset contains latitude and longitude of the property. Real estate professionals have told you that the location of the property is highly influential on price, so you'd like to engineer a feature that incorporates this physical dependency.What should you do? 

A. Provide latitude and longitude as input vectors to your neural net.

B. Create a numeric column from a feature cross of latitude and longitude.

C. Create a feature cross of latitude and longitude, bucketize it at the minute level and use L1 regularization during optimization.

D. Create a feature cross of latitude and longitude, bucketize it at the minute level and use L2 regularization during optimization.

**Answer: C**

**Timestamp: Sept. 2, 2022, 10:26 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79337-exam-professional-data-engineer-topic-1-question-89/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 90 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 90
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying MariaDB SQL databases on GCE VM Instances and need to configure monitoring and alerting. You want to collect metrics including network connections, disk IO and replication status from MariaDB with minimal development effort and use StackDriver for dashboards and alerts.What should you do? 

A. Install the OpenCensus Agent and create a custom metric collection application with a StackDriver exporter.

B. Place the MariaDB instances in an Instance Group with a Health Check.

C. Install the StackDriver Logging Agent and configure fluentd in_tail plugin to read MariaDB logs.

D. Install the StackDriver Agent and configure the MySQL plugin.

**Answer: D**

**Timestamp: March 22, 2020, 5:59 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17260-exam-professional-data-engineer-topic-1-question-90/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 91 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 91
Topic #: 1

[All Professional Data Engineer Questions]

You work for a bank. You have a labelled dataset that contains information on already granted loan application and whether these applications have been defaulted. You have been asked to train a model to predict default rates for credit applicants.What should you do? 

A. Increase the size of the dataset by collecting additional data.

B. Train a linear regression to predict a credit default risk score.

C. Remove the bias from the data and collect applications that have been declined loans.

D. Match loan applicants with their social profiles to enable feature engineering.

**Answer: B**

**Timestamp: March 22, 2020, 4:37 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17256-exam-professional-data-engineer-topic-1-question-91/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 92 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 92
Topic #: 1

[All Professional Data Engineer Questions]

You need to migrate a 2TB relational database to Google Cloud Platform. You do not have the resources to significantly refactor the application that uses this database and cost to operate is of primary concern.Which service do you select for storing and serving your data? 

A. Cloud Spanner

B. Cloud Bigtable

C. Cloud Firestore

D. Cloud SQL

**Answer: D**

**Timestamp: March 22, 2020, 4:39 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17257-exam-professional-data-engineer-topic-1-question-92/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 93 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 93
Topic #: 1

[All Professional Data Engineer Questions]

You're using Bigtable for a real-time application, and you have a heavy load that is a mix of read and writes. You've recently identified an additional use case and need to perform hourly an analytical job to calculate certain statistics across the whole database. You need to ensure both the reliability of your production application as well as the analytical workload.What should you do? 

A. Export Bigtable dump to GCS and run your analytical job on top of the exported files.

B. Add a second cluster to an existing instance with a multi-cluster routing, use live-traffic app profile for your regular workload and batch-analytics profile for the analytics workload.

C. Add a second cluster to an existing instance with a single-cluster routing, use live-traffic app profile for your regular workload and batch-analytics profile for the analytics workload.

D. Increase the size of your existing cluster twice and execute your analytics workload on your new resized cluster.

**Answer: C**

**Timestamp: Sept. 3, 2022, 2:01 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79773-exam-professional-data-engineer-topic-1-question-93/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 94 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 94
Topic #: 1

[All Professional Data Engineer Questions]

You are designing an Apache Beam pipeline to enrich data from Cloud Pub/Sub with static reference data from BigQuery. The reference data is small enough to fit in memory on a single worker. The pipeline should write enriched results to BigQuery for analysis. Which job type and transforms should this pipeline use? 

A. Batch job, PubSubIO, side-inputs

B. Streaming job, PubSubIO, JdbcIO, side-outputs

C. Streaming job, PubSubIO, BigQueryIO, side-inputs

D. Streaming job, PubSubIO, BigQueryIO, side-outputs

**Answer: C**

**Timestamp: March 17, 2020, 9:34 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16841-exam-professional-data-engineer-topic-1-question-94/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 95 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 95
Topic #: 1

[All Professional Data Engineer Questions]

You have a data pipeline that writes data to Cloud Bigtable using well-designed row keys. You want to monitor your pipeline to determine when to increase the size of your Cloud Bigtable cluster. Which two actions can you take to accomplish this? (Choose two.) 

A. Review Key Visualizer metrics. Increase the size of the Cloud Bigtable cluster when the Read pressure index is above 100.

B. Review Key Visualizer metrics. Increase the size of the Cloud Bigtable cluster when the Write pressure index is above 100.

C. Monitor the latency of write operations. Increase the size of the Cloud Bigtable cluster when there is a sustained increase in write latency.

D. Monitor storage utilization. Increase the size of the Cloud Bigtable cluster when utilization increases above 70% of max capacity.

E. Monitor latency of read operations. Increase the size of the Cloud Bigtable cluster of read operations take longer than 100 ms.

**Answer: CD**

**Timestamp: March 17, 2020, 9:48 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16842-exam-professional-data-engineer-topic-1-question-95/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 96 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 96
Topic #: 1

[All Professional Data Engineer Questions]

You want to analyze hundreds of thousands of social media posts daily at the lowest cost and with the fewest steps.You have the following requirements:✑ You will batch-load the posts once per day and run them through the Cloud Natural Language API.✑ You will extract topics and sentiment from the posts.✑ You must store the raw posts for archiving and reprocessing.✑ You will create dashboards to be shared with people both inside and outside your organization.You need to store both the data extracted from the API to perform analysis as well as the raw social media posts for historical archiving. What should you do? 

A. Store the social media posts and the data extracted from the API in BigQuery.

B. Store the social media posts and the data extracted from the API in Cloud SQL.

C. Store the raw social media posts in Cloud Storage, and write the data extracted from the API into BigQuery.

D. Feed to social media posts into the API directly from the source, and write the extracted data from the API into BigQuery.

**Answer: C**

**Timestamp: March 17, 2020, 9:51 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16843-exam-professional-data-engineer-topic-1-question-96/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 97 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 97
Topic #: 1

[All Professional Data Engineer Questions]

You store historic data in Cloud Storage. You need to perform analytics on the historic data. You want to use a solution to detect invalid data entries and perform data transformations that will not require programming or knowledge of SQL.What should you do? 

A. Use Cloud Dataflow with Beam to detect errors and perform transformations.

B. Use Cloud Dataprep with recipes to detect errors and perform transformations.

C. Use Cloud Dataproc with a Hadoop job to detect errors and perform transformations.

D. Use federated tables in BigQuery with queries to detect errors and perform transformations.

**Answer: B**

**Timestamp: March 10, 2020, 3:10 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16109-exam-professional-data-engineer-topic-1-question-97/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 98 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 98
Topic #: 1

[All Professional Data Engineer Questions]

Your company needs to upload their historic data to Cloud Storage. The security rules don't allow access from external IPs to their on-premises resources. After an initial upload, they will add new data from existing on-premises applications every day. What should they do? 

A. Execute gsutil rsync from the on-premises servers.

B. Use Dataflow and write the data to Cloud Storage.

C. Write a job template in Dataproc to perform the data transfer.

D. Install an FTP server on a Compute Engine VM to receive the files and move them to Cloud Storage.

**Answer: A**

**Timestamp: March 22, 2020, 4:23 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17255-exam-professional-data-engineer-topic-1-question-98/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 99 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 99
Topic #: 1

[All Professional Data Engineer Questions]

You have a query that filters a BigQuery table using a WHERE clause on timestamp and ID columns. By using bq query `"-dry_run you learn that the query triggers a full scan of the table, even though the filter on timestamp and ID select a tiny fraction of the overall data. You want to reduce the amount of data scanned by BigQuery with minimal changes to existing SQL queries. What should you do? 

A. Create a separate table for each ID.

B. Use the LIMIT keyword to reduce the number of rows returned.

C. Recreate the table with a partitioning column and clustering column.

D. Use the bq query --maximum_bytes_billed flag to restrict the number of bytes billed.

**Answer: C**

**Timestamp: March 17, 2020, 10:05 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16845-exam-professional-data-engineer-topic-1-question-99/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 100 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 100
Topic #: 1

[All Professional Data Engineer Questions]

You have a requirement to insert minute-resolution data from 50,000 sensors into a BigQuery table. You expect significant growth in data volume and need the data to be available within 1 minute of ingestion for real-time analysis of aggregated trends. What should you do? 

A. Use bq load to load a batch of sensor data every 60 seconds.

B. Use a Cloud Dataflow pipeline to stream data into the BigQuery table.

C. Use the INSERT statement to insert a batch of data every 60 seconds.

D. Use the MERGE statement to apply updates in batch every 60 seconds.

**Answer: B**

**Timestamp: March 19, 2020, 5:39 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16982-exam-professional-data-engineer-topic-1-question-100/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 101 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 101
Topic #: 1

[All Professional Data Engineer Questions]

You need to copy millions of sensitive patient records from a relational database to BigQuery. The total size of the database is 10 TB. You need to design a solution that is secure and time-efficient. What should you do? 

A. Export the records from the database as an Avro file. Upload the file to GCS using gsutil, and then load the Avro file into BigQuery using the BigQuery web UI in the GCP Console.

B. Export the records from the database as an Avro file. Copy the file onto a Transfer Appliance and send it to Google, and then load the Avro file into BigQuery using the BigQuery web UI in the GCP Console.

C. Export the records from the database into a CSV file. Create a public URL for the CSV file, and then use Storage Transfer Service to move the file to Cloud Storage. Load the CSV file into BigQuery using the BigQuery web UI in the GCP Console.

D. Export the records from the database as an Avro file. Create a public URL for the Avro file, and then use Storage Transfer Service to move the file to Cloud Storage. Load the Avro file into BigQuery using the BigQuery web UI in the GCP Console.

**Answer: A**

**Timestamp: March 22, 2020, 6:35 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17204-exam-professional-data-engineer-topic-1-question-101/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 102 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 102
Topic #: 1

[All Professional Data Engineer Questions]

You need to create a near real-time inventory dashboard that reads the main inventory tables in your BigQuery data warehouse. Historical inventory data is stored as inventory balances by item and location. You have several thousand updates to inventory every hour. You want to maximize performance of the dashboard and ensure that the data is accurate. What should you do? 

A. Leverage BigQuery UPDATE statements to update the inventory balances as they are changing.

B. Partition the inventory balance table by item to reduce the amount of data scanned with each inventory update.

C. Use the BigQuery streaming the stream changes into a daily inventory movement table. Calculate balances in a view that joins it to the historical inventory balance table. Update the inventory balance table nightly.

D. Use the BigQuery bulk loader to batch load inventory changes into a daily inventory movement table. Calculate balances in a view that joins it to the historical inventory balance table. Update the inventory balance table nightly.

**Answer: C**

**Timestamp: March 22, 2020, 6:37 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17205-exam-professional-data-engineer-topic-1-question-102/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 103 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 103
Topic #: 1

[All Professional Data Engineer Questions]

You have a data stored in BigQuery. The data in the BigQuery dataset must be highly available. You need to define a storage, backup, and recovery strategy of this data that minimizes cost. How should you configure the BigQuery table that have a recovery point objective (RPO) of 30 days? 

A. Set the BigQuery dataset to be regional. In the event of an emergency, use a point-in-time snapshot to recover the data.

B. Set the BigQuery dataset to be regional. Create a scheduled query to make copies of the data to tables suffixed with the time of the backup. In the event of an emergency, use the backup copy of the table.

C. Set the BigQuery dataset to be multi-regional. In the event of an emergency, use a point-in-time snapshot to recover the data.

D. Set the BigQuery dataset to be multi-regional. Create a scheduled query to make copies of the data to tables suffixed with the time of the backup. In the event of an emergency, use the backup copy of the table.

**Answer: C**

**Timestamp: Sept. 3, 2022, 2:04 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79775-exam-professional-data-engineer-topic-1-question-103/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 104 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 104
Topic #: 1

[All Professional Data Engineer Questions]

You used Dataprep to create a recipe on a sample of data in a BigQuery table. You want to reuse this recipe on a daily upload of data with the same schema, after the load job with variable execution time completes. What should you do? 

A. Create a cron schedule in Dataprep.

B. Create an App Engine cron job to schedule the execution of the Dataprep job.

C. Export the recipe as a Dataprep template, and create a job in Cloud Scheduler.

D. Export the Dataprep job as a Dataflow template, and incorporate it into a Composer job.

**Answer: D**

**Timestamp: Sept. 2, 2022, 9:40 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79318-exam-professional-data-engineer-topic-1-question-104/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 105 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 105
Topic #: 1

[All Professional Data Engineer Questions]

You want to automate execution of a multi-step data pipeline running on Google Cloud. The pipeline includes Dataproc and Dataflow jobs that have multiple dependencies on each other. You want to use managed services where possible, and the pipeline will run every day. Which tool should you use? 

A. cron

B. Cloud Composer

C. Cloud Scheduler

D. Workflow Templates on Dataproc

**Answer: B**

**Timestamp: Sept. 2, 2022, 9:41 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79319-exam-professional-data-engineer-topic-1-question-105/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 106 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 106
Topic #: 1

[All Professional Data Engineer Questions]

You are managing a Cloud Dataproc cluster. You need to make a job run faster while minimizing costs, without losing work in progress on your clusters. What should you do? 

A. Increase the cluster size with more non-preemptible workers.

B. Increase the cluster size with preemptible worker nodes, and configure them to forcefully decommission.

C. Increase the cluster size with preemptible worker nodes, and use Cloud Stackdriver to trigger a script to preserve work.

D. Increase the cluster size with preemptible worker nodes, and configure them to use graceful decommissioning.

**Answer: D**

**Timestamp: Sept. 3, 2022, 2:06 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79777-exam-professional-data-engineer-topic-1-question-106/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 107 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 107
Topic #: 1

[All Professional Data Engineer Questions]

You work for a shipping company that uses handheld scanners to read shipping labels. Your company has strict data privacy standards that require scanners to only transmit tracking numbers when events are sent to Kafka topics. A recent software update caused the scanners to accidentally transmit recipients' personally identifiable information (PII) to analytics systems, which violates user privacy rules. You want to quickly build a scalable solution using cloud-native managed services to prevent exposure of PII to the analytics systems. What should you do? 

A. Create an authorized view in BigQuery to restrict access to tables with sensitive data.

B. Install a third-party data validation tool on Compute Engine virtual machines to check the incoming data for sensitive information.

C. Use Cloud Logging to analyze the data passed through the total pipeline to identify transactions that may contain sensitive information.

D. Build a Cloud Function that reads the topics and makes a call to the Cloud Data Loss Prevention (Cloud DLP) API. Use the tagging and confidence levels to either pass or quarantine the data in a bucket for review.

**Answer: D**

**Timestamp: Sept. 3, 2022, 2:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79778-exam-professional-data-engineer-topic-1-question-107/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 108 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 108
Topic #: 1

[All Professional Data Engineer Questions]

You have developed three data processing jobs. One executes a Cloud Dataflow pipeline that transforms data uploaded to Cloud Storage and writes results toBigQuery. The second ingests data from on-premises servers and uploads it to Cloud Storage. The third is a Cloud Dataflow pipeline that gets information from third-party data providers and uploads the information to Cloud Storage. You need to be able to schedule and monitor the execution of these three workflows and manually execute them when needed. What should you do? 

A. Create a Direct Acyclic Graph in Cloud Composer to schedule and monitor the jobs.

B. Use Stackdriver Monitoring and set up an alert with a Webhook notification to trigger the jobs.

C. Develop an App Engine application to schedule and request the status of the jobs using GCP API calls.

D. Set up cron jobs in a Compute Engine instance to schedule and monitor the pipelines using GCP API calls.

**Answer: A**

**Timestamp: March 22, 2020, 6:48 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17209-exam-professional-data-engineer-topic-1-question-108/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 109 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 109
Topic #: 1

[All Professional Data Engineer Questions]

You have Cloud Functions written in Node.js that pull messages from Cloud Pub/Sub and send the data to BigQuery. You observe that the message processing rate on the Pub/Sub topic is orders of magnitude higher than anticipated, but there is no error logged in Cloud Logging. What are the two most likely causes of this problem? (Choose two.) 

A. Publisher throughput quota is too small.

B. Total outstanding messages exceed the 10-MB maximum.

C. Error handling in the subscriber code is not handling run-time errors properly.

D. The subscriber code cannot keep up with the messages.

E. The subscriber code does not acknowledge the messages that it pulls.

**Answer: CE**

**Timestamp: Sept. 3, 2022, 2:09 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79780-exam-professional-data-engineer-topic-1-question-109/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 110 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 110
Topic #: 1

[All Professional Data Engineer Questions]

You are creating a new pipeline in Google Cloud to stream IoT data from Cloud Pub/Sub through Cloud Dataflow to BigQuery. While previewing the data, you notice that roughly 2% of the data appears to be corrupt. You need to modify the Cloud Dataflow pipeline to filter out this corrupt data. What should you do? 

A. Add a SideInput that returns a Boolean if the element is corrupt.

B. Add a ParDo transform in Cloud Dataflow to discard corrupt elements.

C. Add a Partition transform in Cloud Dataflow to separate valid data from corrupt data.

D. Add a GroupByKey transform in Cloud Dataflow to group all of the valid data together and discard the rest.

**Answer: B**

**Timestamp: March 22, 2020, 2:51 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17252-exam-professional-data-engineer-topic-1-question-110/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 111 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 111
Topic #: 1

[All Professional Data Engineer Questions]

You have historical data covering the last three years in BigQuery and a data pipeline that delivers new data to BigQuery daily. You have noticed that when theData Science team runs a query filtered on a date column and limited to 30`"90 days of data, the query scans the entire table. You also noticed that your bill is increasing more quickly than you expected. You want to resolve the issue as cost-effectively as possible while maintaining the ability to conduct SQL queries.What should you do? 

A. Re-create the tables using DDL. Partition the tables by a column containing a TIMESTAMP or DATE Type.

B. Recommend that the Data Science team export the table to a CSV file on Cloud Storage and use Cloud Datalab to explore the data by reading the files directly.

C. Modify your pipeline to maintain the last 30ג€"90 days of data in one table and the longer history in a different table to minimize full table scans over the entire history.

D. Write an Apache Beam pipeline that creates a BigQuery table per day. Recommend that the Data Science team use wildcards on the table name suffixes to select the data they need.

**Answer: A**

**Timestamp: March 22, 2020, 1:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17248-exam-professional-data-engineer-topic-1-question-111/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 112 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 112
Topic #: 1

[All Professional Data Engineer Questions]

You operate a logistics company, and you want to improve event delivery reliability for vehicle-based sensors. You operate small data centers around the world to capture these events, but leased lines that provide connectivity from your event collection infrastructure to your event processing infrastructure are unreliable, with unpredictable latency. You want to address this issue in the most cost-effective way. What should you do? 

A. Deploy small Kafka clusters in your data centers to buffer events.

B. Have the data acquisition devices publish data to Cloud Pub/Sub.

C. Establish a Cloud Interconnect between all remote data centers and Google.

D. Write a Cloud Dataflow pipeline that aggregates all data in session windows.

**Answer: B**

**Timestamp: March 22, 2020, 1:58 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17249-exam-professional-data-engineer-topic-1-question-112/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 113 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 113
Topic #: 1

[All Professional Data Engineer Questions]

You are a retailer that wants to integrate your online sales capabilities with different in-home assistants, such as Google Home. You need to interpret customer voice commands and issue an order to the backend systems. Which solutions should you choose? 

A. Speech-to-Text API

B. Cloud Natural Language API

C. Dialogflow Enterprise Edition

D. AutoML Natural Language

**Answer: C**

**Timestamp: March 17, 2020, 12:12 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16856-exam-professional-data-engineer-topic-1-question-113/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 114 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 114
Topic #: 1

[All Professional Data Engineer Questions]

Your company has a hybrid cloud initiative. You have a complex data pipeline that moves data between cloud provider services and leverages services from each of the cloud providers. Which cloud-native service should you use to orchestrate the entire pipeline? 

A. Cloud Dataflow

B. Cloud Composer

C. Cloud Dataprep

D. Cloud Dataproc

**Answer: B**

**Timestamp: March 15, 2020, 4:16 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16628-exam-professional-data-engineer-topic-1-question-114/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 115 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 115
Topic #: 1

[All Professional Data Engineer Questions]

You use a dataset in BigQuery for analysis. You want to provide third-party companies with access to the same dataset. You need to keep the costs of data sharing low and ensure that the data is current. Which solution should you choose? 

A. Use Analytics Hub to control data access, and provide third party companies with access to the dataset.

B. Use Cloud Scheduler to export the data on a regular basis to Cloud Storage, and provide third-party companies with access to the bucket.

C. Create a separate dataset in BigQuery that contains the relevant data to share, and provide third-party companies with access to the new dataset.

D. Create a Dataflow job that reads the data in frequent time intervals, and writes it to the relevant BigQuery dataset or Cloud Storage bucket for third-party companies to use.

**Answer: A**

**Timestamp: Sept. 2, 2022, 5 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79459-exam-professional-data-engineer-topic-1-question-115/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 116 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 116
Topic #: 1

[All Professional Data Engineer Questions]

Your company is in the process of migrating its on-premises data warehousing solutions to BigQuery. The existing data warehouse uses trigger-based change data capture (CDC) to apply updates from multiple transactional database sources on a daily basis. With BigQuery, your company hopes to improve its handling ofCDC so that changes to the source systems are available to query in BigQuery in near-real time using log-based CDC streams, while also optimizing for the performance of applying changes to the data warehouse. Which two steps should they take to ensure that changes are available in the BigQuery reporting table with minimal latency while reducing compute overhead? (Choose two.) 

A. Perform a DML INSERT, UPDATE, or DELETE to replicate each individual CDC record in real time directly on the reporting table.

B. Insert each new CDC record and corresponding operation type to a staging table in real time.

C. Periodically DELETE outdated records from the reporting table.

D. Periodically use a DML MERGE to perform several DML INSERT, UPDATE, and DELETE operations at the same time on the reporting table.

E. Insert each new CDC record and corresponding operation type in real time to the reporting table, and use a materialized view to expose only the newest version of each unique record.

**Answer: BD**

**Timestamp: Sept. 3, 2022, 6:25 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79672-exam-professional-data-engineer-topic-1-question-116/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 117 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 117
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a data processing pipeline. The pipeline must be able to scale automatically as load increases. Messages must be processed at least once and must be ordered within windows of 1 hour. How should you design the solution? 

A. Use Apache Kafka for message ingestion and use Cloud Dataproc for streaming analysis.

B. Use Apache Kafka for message ingestion and use Cloud Dataflow for streaming analysis.

C. Use Cloud Pub/Sub for message ingestion and Cloud Dataproc for streaming analysis.

D. Use Cloud Pub/Sub for message ingestion and Cloud Dataflow for streaming analysis.

**Answer: D**

**Timestamp: March 15, 2020, 4:23 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16629-exam-professional-data-engineer-topic-1-question-117/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 118 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 118
Topic #: 1

[All Professional Data Engineer Questions]

You need to set access to BigQuery for different departments within your company. Your solution should comply with the following requirements:✑ Each department should have access only to their data.✑ Each department will have one or more leads who need to be able to create and update tables and provide them to their team.✑ Each department has data analysts who need to be able to query but not modify data.How should you set access to the data in BigQuery? 

A. Create a dataset for each department. Assign the department leads the role of OWNER, and assign the data analysts the role of WRITER on their dataset.

B. Create a dataset for each department. Assign the department leads the role of WRITER, and assign the data analysts the role of READER on their dataset.

C. Create a table for each department. Assign the department leads the role of Owner, and assign the data analysts the role of Editor on the project the table is in.

D. Create a table for each department. Assign the department leads the role of Editor, and assign the data analysts the role of Viewer on the project the table is in.

**Answer: B**

**Timestamp: Sept. 2, 2022, 5:22 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79462-exam-professional-data-engineer-topic-1-question-118/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 119 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 119
Topic #: 1

[All Professional Data Engineer Questions]

You operate a database that stores stock trades and an application that retrieves average stock price for a given company over an adjustable window of time. The data is stored in Cloud Bigtable where the datetime of the stock trade is the beginning of the row key. Your application has thousands of concurrent users, and you notice that performance is starting to degrade as more stocks are added. What should you do to improve the performance of your application? 

A. Change the row key syntax in your Cloud Bigtable table to begin with the stock symbol.

B. Change the row key syntax in your Cloud Bigtable table to begin with a random number per second.

C. Change the data pipeline to use BigQuery for storing stock trades, and update your application.

D. Use Cloud Dataflow to write a summary of each day's stock trades to an Avro file on Cloud Storage. Update your application to read from Cloud Storage and Cloud Bigtable to compute the responses.

**Answer: A**

**Timestamp: March 22, 2020, 12:41 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17244-exam-professional-data-engineer-topic-1-question-119/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 120 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 120
Topic #: 1

[All Professional Data Engineer Questions]

You are operating a Cloud Dataflow streaming pipeline. The pipeline aggregates events from a Cloud Pub/Sub subscription source, within a window, and sinks the resulting aggregation to a Cloud Storage bucket. The source has consistent throughput. You want to monitor an alert on behavior of the pipeline with CloudStackdriver to ensure that it is processing data. Which Stackdriver alerts should you create? 

A. An alert based on a decrease of subscription/num_undelivered_messages for the source and a rate of change increase of instance/storage/ used_bytes for the destination

B. An alert based on an increase of subscription/num_undelivered_messages for the source and a rate of change decrease of instance/storage/ used_bytes for the destination

C. An alert based on a decrease of instance/storage/used_bytes for the source and a rate of change increase of subscription/ num_undelivered_messages for the destination

D. An alert based on an increase of instance/storage/used_bytes for the source and a rate of change decrease of subscription/ num_undelivered_messages for the destination

**Answer: B**

**Timestamp: March 22, 2020, 12:46 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17245-exam-professional-data-engineer-topic-1-question-120/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 121 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 121
Topic #: 1

[All Professional Data Engineer Questions]

You currently have a single on-premises Kafka cluster in a data center in the us-east region that is responsible for ingesting messages from IoT devices globally.Because large parts of globe have poor internet connectivity, messages sometimes batch at the edge, come in all at once, and cause a spike in load on yourKafka cluster. This is becoming difficult to manage and prohibitively expensive. What is the Google-recommended cloud native architecture for this scenario? 

A. Edge TPUs as sensor devices for storing and transmitting the messages.

B. Cloud Dataflow connected to the Kafka cluster to scale the processing of incoming messages.

C. An IoT gateway connected to Cloud Pub/Sub, with Cloud Dataflow to read and process the messages from Cloud Pub/Sub.

D. A Kafka cluster virtualized on Compute Engine in us-east with Cloud Load Balancing to connect to the devices around the world.

**Answer: C**

**Timestamp: March 22, 2020, 11:22 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17240-exam-professional-data-engineer-topic-1-question-121/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 122 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 122
Topic #: 1

[All Professional Data Engineer Questions]

You decided to use Cloud Datastore to ingest vehicle telemetry data in real time. You want to build a storage system that will account for the long-term data growth, while keeping the costs low. You also want to create snapshots of the data periodically, so that you can make a point-in-time (PIT) recovery, or clone a copy of the data for Cloud Datastore in a different environment. You want to archive these snapshots for a long time. Which two methods can accomplish this?(Choose two.) 

A. Use managed export, and store the data in a Cloud Storage bucket using Nearline or Coldline class.

B. Use managed export, and then import to Cloud Datastore in a separate project under a unique namespace reserved for that export.

C. Use managed export, and then import the data into a BigQuery table created just for that export, and delete temporary export files.

D. Write an application that uses Cloud Datastore client libraries to read all the entities. Treat each entity as a BigQuery table row via BigQuery streaming insert. Assign an export timestamp for each export, and attach it as an extra column for each row. Make sure that the BigQuery table is partitioned using the export timestamp column.

E. Write an application that uses Cloud Datastore client libraries to read all the entities. Format the exported data into a JSON file. Apply compression before storing the data in Cloud Source Repositories.

**Answer: AB**

**Timestamp: March 17, 2020, 12:49 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16858-exam-professional-data-engineer-topic-1-question-122/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 123 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 123
Topic #: 1

[All Professional Data Engineer Questions]

You need to create a data pipeline that copies time-series transaction data so that it can be queried from within BigQuery by your data science team for analysis.Every hour, thousands of transactions are updated with a new status. The size of the initial dataset is 1.5 PB, and it will grow by 3 TB per day. The data is heavily structured, and your data science team will build machine learning models based on this data. You want to maximize performance and usability for your data science team. Which two strategies should you adopt? (Choose two.) 

A. Denormalize the data as must as possible.

B. Preserve the structure of the data as much as possible.

C. Use BigQuery UPDATE to further reduce the size of the dataset.

D. Develop a data pipeline where status updates are appended to BigQuery instead of updated.

E. Copy a daily snapshot of transaction data to Cloud Storage and store it as an Avro file. Use BigQuery's support for external data sources to query.

**Answer: AD**

**Timestamp: March 20, 2020, 4:21 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17023-exam-professional-data-engineer-topic-1-question-123/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 124 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 124
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a cloud-native historical data processing system to meet the following conditions:✑ The data being analyzed is in CSV, Avro, and PDF formats and will be accessed by multiple analysis tools including Dataproc, BigQuery, and ComputeEngine.✑ A batch pipeline moves daily data.✑ Performance is not a factor in the solution.✑ The solution design should maximize availability.How should you design data storage for this solution? 

A. Create a Dataproc cluster with high availability. Store the data in HDFS, and perform analysis as needed.

B. Store the data in BigQuery. Access the data using the BigQuery Connector on Dataproc and Compute Engine.

C. Store the data in a regional Cloud Storage bucket. Access the bucket directly using Dataproc, BigQuery, and Compute Engine.

D. Store the data in a multi-regional Cloud Storage bucket. Access the data directly using Dataproc, BigQuery, and Compute Engine.

**Answer: D**

**Timestamp: Sept. 8, 2022, 8:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/81264-exam-professional-data-engineer-topic-1-question-124/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 125 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 125
Topic #: 1

[All Professional Data Engineer Questions]

You have a petabyte of analytics data and need to design a storage and processing platform for it. You must be able to perform data warehouse-style analytics on the data in Google Cloud and expose the dataset as files for batch analysis tools in other cloud providers. What should you do? 

A. Store and process the entire dataset in BigQuery.

B. Store and process the entire dataset in Bigtable.

C. Store the full dataset in BigQuery, and store a compressed copy of the data in a Cloud Storage bucket.

D. Store the warm data as files in Cloud Storage, and store the active data in BigQuery. Keep this ratio as 80% warm and 20% active.

**Answer: C**

**Timestamp: March 22, 2020, 12:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17243-exam-professional-data-engineer-topic-1-question-125/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 126 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 126
Topic #: 1

[All Professional Data Engineer Questions]

You work for a manufacturing company that sources up to 750 different components, each from a different supplier. You've collected a labeled dataset that has on average 1000 examples for each unique component. Your team wants to implement an app to help warehouse workers recognize incoming components based on a photo of the component. You want to implement the first working version of this app (as Proof-Of-Concept) within a few working days. What should you do? 

A. Use Cloud Vision AutoML with the existing dataset.

B. Use Cloud Vision AutoML, but reduce your dataset twice.

C. Use Cloud Vision API by providing custom labels as recognition hints.

D. Train your own image recognition model leveraging transfer learning techniques.

**Answer: A**

**Timestamp: March 22, 2020, 10:52 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17235-exam-professional-data-engineer-topic-1-question-126/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 127 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 127
Topic #: 1

[All Professional Data Engineer Questions]

You are working on a niche product in the image recognition domain. Your team has developed a model that is dominated by custom C++ TensorFlow ops your team has implemented. These ops are used inside your main training loop and are performing bulky matrix multiplications. It currently takes up to several days to train a model. You want to decrease this time significantly and keep the cost low by using an accelerator on Google Cloud. What should you do? 

A. Use Cloud TPUs without any additional adjustment to your code.

B. Use Cloud TPUs after implementing GPU kernel support for your customs ops.

C. Use Cloud GPUs after implementing GPU kernel support for your customs ops.

D. Stay on CPUs, and increase the size of the cluster you're training your model on.

**Answer: C**

**Timestamp: March 22, 2020, 11:01 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17236-exam-professional-data-engineer-topic-1-question-127/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 128 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 128
Topic #: 1

[All Professional Data Engineer Questions]

You work on a regression problem in a natural language processing domain, and you have 100M labeled examples in your dataset. You have randomly shuffled your data and split your dataset into train and test samples (in a 90/10 ratio). After you trained the neural network and evaluated your model on a test set, you discover that the root-mean-squared error (RMSE) of your model is twice as high on the train set as on the test set. How should you improve the performance of your model? 

A. Increase the share of the test sample in the train-test split.

B. Try to collect more data and increase the size of your dataset.

C. Try out regularization techniques (e.g., dropout of batch normalization) to avoid overfitting.

D. Increase the complexity of your model by, e.g., introducing an additional layer or increase sizing the size of vocabularies or n-grams used.

**Answer: D**

**Timestamp: March 22, 2020, 11:11 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17238-exam-professional-data-engineer-topic-1-question-128/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 129 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 129
Topic #: 1

[All Professional Data Engineer Questions]

You use BigQuery as your centralized analytics platform. New data is loaded every day, and an ETL pipeline modifies the original data and prepares it for the final users. This ETL pipeline is regularly modified and can generate errors, but sometimes the errors are detected only after 2 weeks. You need to provide a method to recover from these errors, and your backups should be optimized for storage costs. How should you organize your data in BigQuery and store your backups? 

A. Organize your data in a single table, export, and compress and store the BigQuery data in Cloud Storage.

B. Organize your data in separate tables for each month, and export, compress, and store the data in Cloud Storage.

C. Organize your data in separate tables for each month, and duplicate your data on a separate dataset in BigQuery.

D. Organize your data in separate tables for each month, and use snapshot decorators to restore the table to a time prior to the corruption.

**Answer: B**

**Timestamp: March 22, 2020, 11:14 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17239-exam-professional-data-engineer-topic-1-question-129/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 130 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 130
Topic #: 1

[All Professional Data Engineer Questions]

The marketing team at your organization provides regular updates of a segment of your customer dataset. The marketing team has given you a CSV with 1 million records that must be updated in BigQuery. When you use the UPDATE statement in BigQuery, you receive a quotaExceeded error. What should you do? 

A. Reduce the number of records updated each day to stay within the BigQuery UPDATE DML statement limit.

B. Increase the BigQuery UPDATE DML statement limit in the Quota management section of the Google Cloud Platform Console.

C. Split the source CSV file into smaller CSV files in Cloud Storage to reduce the number of BigQuery UPDATE DML statements per BigQuery job.

D. Import the new records from the CSV file into a new BigQuery table. Create a BigQuery job that merges the new records with the existing records and writes the results to a new BigQuery table.

**Answer: D**

**Timestamp: March 15, 2020, 4:01 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16667-exam-professional-data-engineer-topic-1-question-130/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 131 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 131
Topic #: 1

[All Professional Data Engineer Questions]

As your organization expands its usage of GCP, many teams have started to create their own projects. Projects are further multiplied to accommodate different stages of deployments and target audiences. Each project requires unique access control configurations. The central IT team needs to have access to all projects.Furthermore, data from Cloud Storage buckets and BigQuery datasets must be shared for use in other projects in an ad hoc way. You want to simplify access control management by minimizing the number of policies. Which two steps should you take? (Choose two.) 

A. Use Cloud Deployment Manager to automate access provision.

B. Introduce resource hierarchy to leverage access control policy inheritance.

C. Create distinct groups for various teams, and specify groups in Cloud IAM policies.

D. Only use service accounts when sharing data for Cloud Storage buckets and BigQuery datasets.

E. For each Cloud Storage bucket or BigQuery dataset, decide which projects need access. Find all the active members who have access to these projects, and create a Cloud IAM policy to grant access to all these users.

**Answer: BC**

**Timestamp: March 22, 2020, 10:12 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17231-exam-professional-data-engineer-topic-1-question-131/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 132 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 132
Topic #: 1

[All Professional Data Engineer Questions]

Your United States-based company has created an application for assessing and responding to user actions. The primary table's data volume grows by 250,000 records per second. Many third parties use your application's APIs to build the functionality into their own frontend applications. Your application's APIs should comply with the following requirements:✑ Single global endpoint✑ ANSI SQL support✑ Consistent access to the most up-to-date dataWhat should you do? 

A. Implement BigQuery with no region selected for storage or processing.

B. Implement Cloud Spanner with the leader in North America and read-only replicas in Asia and Europe.

C. Implement Cloud SQL for PostgreSQL with the master in North America and read replicas in Asia and Europe.

D. Implement Bigtable with the primary cluster in North America and secondary clusters in Asia and Europe.

**Answer: B**

**Timestamp: March 22, 2020, 10:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17232-exam-professional-data-engineer-topic-1-question-132/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 133 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 133
Topic #: 1

[All Professional Data Engineer Questions]

A data scientist has created a BigQuery ML model and asks you to create an ML pipeline to serve predictions. You have a REST API application with the requirement to serve predictions for an individual user ID with latency under 100 milliseconds. You use the following query to generate predictions: SELECT predicted_label, user_id FROM ML.PREDICT (MODEL 'dataset.model', table user_features). How should you create the ML pipeline? 

A. Add a WHERE clause to the query, and grant the BigQuery Data Viewer role to the application service account.

B. Create an Authorized View with the provided query. Share the dataset that contains the view with the application service account.

C. Create a Dataflow pipeline using BigQueryIO to read results from the query. Grant the Dataflow Worker role to the application service account.

D. Create a Dataflow pipeline using BigQueryIO to read predictions for all users from the query. Write the results to Bigtable using BigtableIO. Grant the Bigtable Reader role to the application service account so that the application can read predictions for individual users from Bigtable.

**Answer: D**

**Timestamp: March 20, 2020, 3:49 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17019-exam-professional-data-engineer-topic-1-question-133/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 134 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 134
Topic #: 1

[All Professional Data Engineer Questions]

You are building an application to share financial market data with consumers, who will receive data feeds. Data is collected from the markets in real time.Consumers will receive the data in the following ways:✑ Real-time event stream✑ ANSI SQL access to real-time stream and historical data✑ Batch historical exportsWhich solution should you use? 

A. Cloud Dataflow, Cloud SQL, Cloud Spanner

B. Cloud Pub/Sub, Cloud Storage, BigQuery

C. Cloud Dataproc, Cloud Dataflow, BigQuery

D. Cloud Pub/Sub, Cloud Dataproc, Cloud SQL

**Answer: B**

**Timestamp: March 22, 2020, 10:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17233-exam-professional-data-engineer-topic-1-question-134/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 135 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 135
Topic #: 1

[All Professional Data Engineer Questions]

You are building a new application that you need to collect data from in a scalable way. Data arrives continuously from the application throughout the day, and you expect to generate approximately 150 GB of JSON data per day by the end of the year. Your requirements are:✑ Decoupling producer from consumer✑ Space and cost-efficient storage of the raw ingested data, which is to be stored indefinitely✑ Near real-time SQL query✑ Maintain at least 2 years of historical data, which will be queried with SQLWhich pipeline should you use to meet these requirements? 

A. Create an application that provides an API. Write a tool to poll the API and write data to Cloud Storage as gzipped JSON files.

B. Create an application that writes to a Cloud SQL database to store the data. Set up periodic exports of the database to write to Cloud Storage and load into BigQuery.

C. Create an application that publishes events to Cloud Pub/Sub, and create Spark jobs on Cloud Dataproc to convert the JSON data to Avro format, stored on HDFS on Persistent Disk.

D. Create an application that publishes events to Cloud Pub/Sub, and create a Cloud Dataflow pipeline that transforms the JSON event payloads to Avro, writing the data to Cloud Storage and BigQuery.

**Answer: D**

**Timestamp: March 22, 2020, 10:49 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17234-exam-professional-data-engineer-topic-1-question-135/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 136 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 136
Topic #: 1

[All Professional Data Engineer Questions]

You are running a pipeline in Dataflow that receives messages from a Pub/Sub topic and writes the results to a BigQuery dataset in the EU. Currently, your pipeline is located in europe-west4 and has a maximum of 3 workers, instance type n1-standard-1. You notice that during peak periods, your pipeline is struggling to process records in a timely fashion, when all 3 workers are at maximum CPU utilization. Which two actions can you take to increase performance of your pipeline? (Choose two.) 

A. Increase the number of max workers

B. Use a larger instance type for your Dataflow workers

C. Change the zone of your Dataflow pipeline to run in us-central1

D. Create a temporary table in Bigtable that will act as a buffer for new data. Create a new step in your pipeline to write to this table first, and then create a new pipeline to write from Bigtable to BigQuery

E. Create a temporary table in Cloud Spanner that will act as a buffer for new data. Create a new step in your pipeline to write to this table first, and then create a new pipeline to write from Cloud Spanner to BigQuery

**Answer: AB**

**Timestamp: March 18, 2020, 4:39 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16932-exam-professional-data-engineer-topic-1-question-136/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 137 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 137
Topic #: 1

[All Professional Data Engineer Questions]

You have a data pipeline with a Dataflow job that aggregates and writes time series metrics to Bigtable. You notice that data is slow to update in Bigtable. This data feeds a dashboard used by thousands of users across the organization. You need to support additional concurrent users and reduce the amount of time required to write the data. Which two actions should you take? (Choose two.) 

A. Configure your Dataflow pipeline to use local execution

B. Increase the maximum number of Dataflow workers by setting maxNumWorkers in PipelineOptions

C. Increase the number of nodes in the Bigtable cluster

D. Modify your Dataflow pipeline to use the Flatten transform before writing to Bigtable

E. Modify your Dataflow pipeline to use the CoGroupByKey transform before writing to Bigtable

**Answer: BC**

**Timestamp: Sept. 3, 2022, 6:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79674-exam-professional-data-engineer-topic-1-question-137/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 138 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 138
Topic #: 1

[All Professional Data Engineer Questions]

You have several Spark jobs that run on a Cloud Dataproc cluster on a schedule. Some of the jobs run in sequence, and some of the jobs run concurrently. You need to automate this process. What should you do? 

A. Create a Cloud Dataproc Workflow Template

B. Create an initialization action to execute the jobs

C. Create a Directed Acyclic Graph in Cloud Composer

D. Create a Bash script that uses the Cloud SDK to create a cluster, execute jobs, and then tear down the cluster

**Answer: C**

**Timestamp: Sept. 3, 2022, 6:39 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79675-exam-professional-data-engineer-topic-1-question-138/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 140 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 140
Topic #: 1

[All Professional Data Engineer Questions]

You need to create a new transaction table in Cloud Spanner that stores product sales data. You are deciding what to use as a primary key. From a performance perspective, which strategy should you choose? 

A. The current epoch time

B. A concatenation of the product name and the current epoch time

C. A random universally unique identifier number (version 4 UUID)

D. The original order identification number from the sales system, which is a monotonically increasing integer

**Answer: C**

**Timestamp: Sept. 5, 2022, 10:23 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/80270-exam-professional-data-engineer-topic-1-question-140/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 141 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 141
Topic #: 1

[All Professional Data Engineer Questions]

Data Analysts in your company have the Cloud IAM Owner role assigned to them in their projects to allow them to work with multiple GCP products in their projects. Your organization requires that all BigQuery data access logs be retained for 6 months. You need to ensure that only audit personnel in your company can access the data access logs for all projects. What should you do? 

A. Enable data access logs in each Data Analyst's project. Restrict access to Stackdriver Logging via Cloud IAM roles.

B. Export the data access logs via a project-level export sink to a Cloud Storage bucket in the Data Analysts' projects. Restrict access to the Cloud Storage bucket.

C. Export the data access logs via a project-level export sink to a Cloud Storage bucket in a newly created projects for audit logs. Restrict access to the project with the exported logs.

D. Export the data access logs via an aggregated export sink to a Cloud Storage bucket in a newly created project for audit logs. Restrict access to the project that contains the exported logs.

**Answer: D**

**Timestamp: March 22, 2020, 8:58 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17225-exam-professional-data-engineer-topic-1-question-141/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 142 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 142
Topic #: 1

[All Professional Data Engineer Questions]

Each analytics team in your organization is running BigQuery jobs in their own projects. You want to enable each team to monitor slot usage within their projects.What should you do? 

A. Create a Cloud Monitoring dashboard based on the BigQuery metric query/scanned_bytes

B. Create a Cloud Monitoring dashboard based on the BigQuery metric slots/allocated_for_project

C. Create a log export for each project, capture the BigQuery job execution logs, create a custom metric based on the totalSlotMs, and create a Cloud Monitoring dashboard based on the custom metric

D. Create an aggregated log export at the organization level, capture the BigQuery job execution logs, create a custom metric based on the totalSlotMs, and create a Cloud Monitoring dashboard based on the custom metric

**Answer: B**

**Timestamp: Sept. 13, 2022, 4:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/81914-exam-professional-data-engineer-topic-1-question-142/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 143 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 143
Topic #: 1

[All Professional Data Engineer Questions]

You are operating a streaming Cloud Dataflow pipeline. Your engineers have a new version of the pipeline with a different windowing algorithm and triggering strategy. You want to update the running pipeline with the new version. You want to ensure that no data is lost during the update. What should you do? 

A. Update the Cloud Dataflow pipeline inflight by passing the --update option with the --jobName set to the existing job name

B. Update the Cloud Dataflow pipeline inflight by passing the --update option with the --jobName set to a new unique job name

C. Stop the Cloud Dataflow pipeline with the Cancel option. Create a new Cloud Dataflow job with the updated code

D. Stop the Cloud Dataflow pipeline with the Drain option. Create a new Cloud Dataflow job with the updated code

**Answer: D**

**Timestamp: Sept. 3, 2022, 6:44 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79678-exam-professional-data-engineer-topic-1-question-143/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 144 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 144
Topic #: 1

[All Professional Data Engineer Questions]

You need to move 2 PB of historical data from an on-premises storage appliance to Cloud Storage within six months, and your outbound network capacity is constrained to 20 Mb/sec. How should you migrate this data to Cloud Storage? 

A. Use Transfer Appliance to copy the data to Cloud Storage

B. Use gsutil cp ג€"J to compress the content being uploaded to Cloud Storage

C. Create a private URL for the historical data, and then use Storage Transfer Service to copy the data to Cloud Storage

D. Use trickle or ionice along with gsutil cp to limit the amount of bandwidth gsutil utilizes to less than 20 Mb/sec so it does not interfere with the production traffic

**Answer: A**

**Timestamp: March 22, 2020, 9:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17228-exam-professional-data-engineer-topic-1-question-144/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 145 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 145
Topic #: 1

[All Professional Data Engineer Questions]

You receive data files in CSV format monthly from a third party. You need to cleanse this data, but every third month the schema of the files changes. Your requirements for implementing these transformations include:✑ Executing the transformations on a schedule✑ Enabling non-developer analysts to modify transformations✑ Providing a graphical tool for designing transformationsWhat should you do? 

A. Use Dataprep by Trifacta to build and maintain the transformation recipes, and execute them on a scheduled basis

B. Load each month's CSV data into BigQuery, and write a SQL query to transform the data to a standard schema. Merge the transformed tables together with a SQL query

C. Help the analysts write a Dataflow pipeline in Python to perform the transformation. The Python code should be stored in a revision control system and modified as the incoming data's schema changes

D. Use Apache Spark on Dataproc to infer the schema of the CSV file before creating a Dataframe. Then implement the transformations in Spark SQL before writing the data out to Cloud Storage and loading into BigQuery

**Answer: A**

**Timestamp: March 15, 2020, 5:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16674-exam-professional-data-engineer-topic-1-question-145/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 146 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 146
Topic #: 1

[All Professional Data Engineer Questions]

You want to migrate an on-premises Hadoop system to Cloud Dataproc. Hive is the primary tool in use, and the data format is Optimized Row Columnar (ORC).All ORC files have been successfully copied to a Cloud Storage bucket. You need to replicate some data to the cluster's local Hadoop Distributed File System(HDFS) to maximize performance. What are two ways to start using Hive in Cloud Dataproc? (Choose two.) 

A. Run the gsutil utility to transfer all ORC files from the Cloud Storage bucket to HDFS. Mount the Hive tables locally.

B. Run the gsutil utility to transfer all ORC files from the Cloud Storage bucket to any node of the Dataproc cluster. Mount the Hive tables locally.

C. Run the gsutil utility to transfer all ORC files from the Cloud Storage bucket to the master node of the Dataproc cluster. Then run the Hadoop utility to copy them do HDFS. Mount the Hive tables from HDFS.

D. Leverage Cloud Storage connector for Hadoop to mount the ORC files as external Hive tables. Replicate external Hive tables to the native ones.

E. Load the ORC files into BigQuery. Leverage BigQuery connector for Hadoop to mount the BigQuery tables as external Hive tables. Replicate external Hive tables to the native ones.

**Answer: AD**

**Timestamp: March 22, 2020, 8:31 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17224-exam-professional-data-engineer-topic-1-question-146/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 147 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 147
Topic #: 1

[All Professional Data Engineer Questions]

You are implementing several batch jobs that must be executed on a schedule. These jobs have many interdependent steps that must be executed in a specific order. Portions of the jobs involve executing shell scripts, running Hadoop jobs, and running queries in BigQuery. The jobs are expected to run for many minutes up to several hours. If the steps fail, they must be retried a fixed number of times. Which service should you use to manage the execution of these jobs? 

A. Cloud Scheduler

B. Cloud Dataflow

C. Cloud Functions

D. Cloud Composer

**Answer: D**

**Timestamp: March 15, 2020, 5:11 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16675-exam-professional-data-engineer-topic-1-question-147/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 148 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 148
Topic #: 1

[All Professional Data Engineer Questions]

You work for a shipping company that has distribution centers where packages move on delivery lines to route them properly. The company wants to add cameras to the delivery lines to detect and track any visual damage to the packages in transit. You need to create a way to automate the detection of damaged packages and flag them for human review in real time while the packages are in transit. Which solution should you choose? 

A. Use BigQuery machine learning to be able to train the model at scale, so you can analyze the packages in batches.

B. Train an AutoML model on your corpus of images, and build an API around that model to integrate with the package tracking applications.

C. Use the Cloud Vision API to detect for damage, and raise an alert through Cloud Functions. Integrate the package tracking applications with this function.

D. Use TensorFlow to create a model that is trained on your corpus of images. Create a Python notebook in Cloud Datalab that uses this model so you can analyze for damaged packages.

**Answer: B**

**Timestamp: March 15, 2020, 5:16 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16677-exam-professional-data-engineer-topic-1-question-148/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 149 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 149
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating your data warehouse to BigQuery. You have migrated all of your data into tables in a dataset. Multiple users from your organization will be using the data. They should only see certain tables based on their team membership. How should you set user permissions? 

A. Assign the users/groups data viewer access at the table level for each table

B. Create SQL views for each team in the same dataset in which the data resides, and assign the users/groups data viewer access to the SQL views

C. Create authorized views for each team in the same dataset in which the data resides, and assign the users/groups data viewer access to the authorized views

D. Create authorized views for each team in datasets created for each team. Assign the authorized views data viewer access to the dataset in which the data resides. Assign the users/groups data viewer access to the datasets in which the authorized views reside

**Answer: A**

**Timestamp: March 15, 2020, 5:19 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16678-exam-professional-data-engineer-topic-1-question-149/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 150 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 150
Topic #: 1

[All Professional Data Engineer Questions]

You want to build a managed Hadoop system as your data lake. The data transformation process is composed of a series of Hadoop jobs executed in sequence.To accomplish the design of separating storage from compute, you decided to use the Cloud Storage connector to store all input data, output data, and intermediary data. However, you noticed that one Hadoop job runs very slowly with Cloud Dataproc, when compared with the on-premises bare-metal Hadoop environment (8-core nodes with 100-GB RAM). Analysis shows that this particular Hadoop job is disk I/O intensive. You want to resolve the issue. What should you do? 

A. Allocate sufficient memory to the Hadoop cluster, so that the intermediary data of that particular Hadoop job can be held in memory

B. Allocate sufficient persistent disk space to the Hadoop cluster, and store the intermediate data of that particular Hadoop job on native HDFS

C. Allocate more CPU cores of the virtual machine instances of the Hadoop cluster so that the networking bandwidth for each instance can scale up

D. Allocate additional network interface card (NIC), and configure link aggregation in the operating system to use the combined throughput when working with Cloud Storage

**Answer: B**

**Timestamp: March 17, 2020, 2:58 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16868-exam-professional-data-engineer-topic-1-question-150/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 151 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 151
Topic #: 1

[All Professional Data Engineer Questions]

You work for an advertising company, and you've developed a Spark ML model to predict click-through rates at advertisement blocks. You've been developing everything at your on-premises data center, and now your company is migrating to Google Cloud. Your data center will be closing soon, so a rapid lift-and-shift migration is necessary. However, the data you've been using will be migrated to migrated to BigQuery. You periodically retrain your Spark ML models, so you need to migrate existing training pipelines to Google Cloud. What should you do? 

A. Use Vertex AI for training existing Spark ML models

B. Rewrite your models on TensorFlow, and start using Vertex AI

C. Use Dataproc for training existing Spark ML models, but start reading data directly from BigQuery

D. Spin up a Spark cluster on Compute Engine, and train Spark ML models on the data exported from BigQuery

**Answer: C**

**Timestamp: Sept. 3, 2022, 6:49 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79680-exam-professional-data-engineer-topic-1-question-151/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 152 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 152
Topic #: 1

[All Professional Data Engineer Questions]

You work for a global shipping company. You want to train a model on 40 TB of data to predict which ships in each geographic region are likely to cause delivery delays on any given day. The model will be based on multiple attributes collected from multiple sources. Telemetry data, including location in GeoJSON format, will be pulled from each ship and loaded every hour. You want to have a dashboard that shows how many and which ships are likely to cause delays within a region. You want to use a storage solution that has native functionality for prediction and geospatial processing. Which storage solution should you use? 

A. BigQuery

B. Cloud Bigtable

C. Cloud Datastore

D. Cloud SQL for PostgreSQL

**Answer: A**

**Timestamp: March 22, 2020, 8:05 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17216-exam-professional-data-engineer-topic-1-question-152/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 153 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 153
Topic #: 1

[All Professional Data Engineer Questions]

You operate an IoT pipeline built around Apache Kafka that normally receives around 5000 messages per second. You want to use Google Cloud Platform to create an alert as soon as the moving average over 1 hour drops below 4000 messages per second. What should you do? 

A. Consume the stream of data in Dataflow using Kafka IO. Set a sliding time window of 1 hour every 5 minutes. Compute the average when the window closes, and send an alert if the average is less than 4000 messages.

B. Consume the stream of data in Dataflow using Kafka IO. Set a fixed time window of 1 hour. Compute the average when the window closes, and send an alert if the average is less than 4000 messages.

C. Use Kafka Connect to link your Kafka message queue to Pub/Sub. Use a Dataflow template to write your messages from Pub/Sub to Bigtable. Use Cloud Scheduler to run a script every hour that counts the number of rows created in Bigtable in the last hour. If that number falls below 4000, send an alert.

D. Use Kafka Connect to link your Kafka message queue to Pub/Sub. Use a Dataflow template to write your messages from Pub/Sub to BigQuery. Use Cloud Scheduler to run a script every five minutes that counts the number of rows created in BigQuery in the last hour. If that number falls below 4000, send an alert.

**Answer: A**

**Timestamp: March 22, 2020, 8:12 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17218-exam-professional-data-engineer-topic-1-question-153/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 154 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 154
Topic #: 1

[All Professional Data Engineer Questions]

You plan to deploy Cloud SQL using MySQL. You need to ensure high availability in the event of a zone failure. What should you do? 

A. Create a Cloud SQL instance in one zone, and create a failover replica in another zone within the same region.

B. Create a Cloud SQL instance in one zone, and create a read replica in another zone within the same region.

C. Create a Cloud SQL instance in one zone, and configure an external read replica in a zone in a different region.

D. Create a Cloud SQL instance in a region, and configure automatic backup to a Cloud Storage bucket in the same region.

**Answer: A**

**Timestamp: March 15, 2020, 7:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16688-exam-professional-data-engineer-topic-1-question-154/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 155 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 155
Topic #: 1

[All Professional Data Engineer Questions]

Your company is selecting a system to centralize data ingestion and delivery. You are considering messaging and data integration systems to address the requirements. The key requirements are:✑ The ability to seek to a particular offset in a topic, possibly back to the start of all data ever captured✑ Support for publish/subscribe semantics on hundreds of topicsRetain per-key ordering -Which system should you choose? 

A. Apache Kafka

B. Cloud Storage

C. Dataflow

D. Firebase Cloud Messaging

**Answer: A**

**Timestamp: Sept. 6, 2022, 7:57 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/80517-exam-professional-data-engineer-topic-1-question-155/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 156 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 156
Topic #: 1

[All Professional Data Engineer Questions]

You are planning to migrate your current on-premises Apache Hadoop deployment to the cloud. You need to ensure that the deployment is as fault-tolerant and cost-effective as possible for long-running batch jobs. You want to use a managed service. What should you do? 

A. Deploy a Dataproc cluster. Use a standard persistent disk and 50% preemptible workers. Store data in Cloud Storage, and change references in scripts from hdfs:// to gs://

B. Deploy a Dataproc cluster. Use an SSD persistent disk and 50% preemptible workers. Store data in Cloud Storage, and change references in scripts from hdfs:// to gs://

C. Install Hadoop and Spark on a 10-node Compute Engine instance group with standard instances. Install the Cloud Storage connector, and store the data in Cloud Storage. Change references in scripts from hdfs:// to gs://

D. Install Hadoop and Spark on a 10-node Compute Engine instance group with preemptible instances. Store data in HDFS. Change references in scripts from hdfs:// to gs://

**Answer: A**

**Timestamp: March 22, 2020, 7:31 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17211-exam-professional-data-engineer-topic-1-question-156/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 157 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 157
Topic #: 1

[All Professional Data Engineer Questions]

Your team is working on a binary classification problem. You have trained a support vector machine (SVM) classifier with default parameters, and received an area under the Curve (AUC) of 0.87 on the validation set. You want to increase the AUC of the model. What should you do? 

A. Perform hyperparameter tuning

B. Train a classifier with deep neural networks, because neural networks would always beat SVMs

C. Deploy the model and measure the real-world AUC; it's always higher because of generalization

D. Scale predictions you get out of the model (tune a scaling factor as a hyperparameter) in order to get the highest AUC

**Answer: A**

**Timestamp: March 22, 2020, 7:33 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17212-exam-professional-data-engineer-topic-1-question-157/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 158 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 158
Topic #: 1

[All Professional Data Engineer Questions]

You need to deploy additional dependencies to all nodes of a Cloud Dataproc cluster at startup using an existing initialization action. Company security policies require that Cloud Dataproc nodes do not have access to the Internet so public initialization actions cannot fetch resources. What should you do? 

A. Deploy the Cloud SQL Proxy on the Cloud Dataproc master

B. Use an SSH tunnel to give the Cloud Dataproc cluster access to the Internet

C. Copy all dependencies to a Cloud Storage bucket within your VPC security perimeter

D. Use Resource Manager to add the service account used by the Cloud Dataproc cluster to the Network User role

**Answer: C**

**Timestamp: March 18, 2020, 1:46 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16899-exam-professional-data-engineer-topic-1-question-158/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 159 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 159
Topic #: 1

[All Professional Data Engineer Questions]

You need to choose a database for a new project that has the following requirements:✑ Fully managed✑ Able to automatically scale up✑ Transactionally consistent✑ Able to scale up to 6 TB✑ Able to be queried using SQLWhich database do you choose? 

A. Cloud SQL

B. Cloud Bigtable

C. Cloud Spanner

D. Cloud Datastore

**Answer: C**

**Timestamp: March 22, 2020, 7:42 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17213-exam-professional-data-engineer-topic-1-question-159/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 160 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 160
Topic #: 1

[All Professional Data Engineer Questions]

You work for a mid-sized enterprise that needs to move its operational system transaction data from an on-premises database to GCP. The database is about 20TB in size. Which database should you choose? 

A. Cloud SQL

B. Cloud Bigtable

C. Cloud Spanner

D. Cloud Datastore

**Answer: A**

**Timestamp: March 22, 2020, 7:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/17214-exam-professional-data-engineer-topic-1-question-160/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 161 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 161
Topic #: 1

[All Professional Data Engineer Questions]

You need to choose a database to store time series CPU and memory usage for millions of computers. You need to store this data in one-second interval samples. Analysts will be performing real-time, ad hoc analytics against the database. You want to avoid being charged for every query executed and ensure that the schema design will allow for future growth of the dataset. Which database and data model should you choose? 

A. Create a table in BigQuery, and append the new samples for CPU and memory to the table

B. Create a wide table in BigQuery, create a column for the sample value at each second, and update the row with the interval for each second

C. Create a narrow table in Bigtable with a row key that combines the Computer Engine computer identifier with the sample time at each second

D. Create a wide table in Bigtable with a row key that combines the computer identifier with the sample time at each minute, and combine the values for each second as column data.

**Answer: C**

**Timestamp: March 15, 2020, 7:41 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16689-exam-professional-data-engineer-topic-1-question-161/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 162 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 162
Topic #: 1

[All Professional Data Engineer Questions]

You want to archive data in Cloud Storage. Because some data is very sensitive, you want to use the `Trust No One` (TNO) approach to encrypt your data to prevent the cloud provider staff from decrypting your data. What should you do? 

A. Use gcloud kms keys create to create a symmetric key. Then use gcloud kms encrypt to encrypt each archival file with the key and unique additional authenticated data (AAD). Use gsutil cp to upload each encrypted file to the Cloud Storage bucket, and keep the AAD outside of Google Cloud.

B. Use gcloud kms keys create to create a symmetric key. Then use gcloud kms encrypt to encrypt each archival file with the key. Use gsutil cp to upload each encrypted file to the Cloud Storage bucket. Manually destroy the key previously used for encryption, and rotate the key once.

C. Specify customer-supplied encryption key (CSEK) in the .boto configuration file. Use gsutil cp to upload each archival file to the Cloud Storage bucket. Save the CSEK in Cloud Memorystore as permanent storage of the secret.

D. Specify customer-supplied encryption key (CSEK) in the .boto configuration file. Use gsutil cp to upload each archival file to the Cloud Storage bucket. Save the CSEK in a different project that only the security team can access.

**Answer: D**

**Timestamp: March 18, 2020, 2:11 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/16902-exam-professional-data-engineer-topic-1-question-162/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 163 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 163
Topic #: 1

[All Professional Data Engineer Questions]

You have data pipelines running on BigQuery, Dataflow, and Dataproc. You need to perform health checks and monitor their behavior, and then notify the team managing the pipelines if they fail. You also need to be able to work across multiple projects. Your preference is to use managed products or features of the platform. What should you do? 

A. Export the information to Cloud Monitoring, and set up an Alerting policy

B. Run a Virtual Machine in Compute Engine with Airflow, and export the information to Cloud Monitoring

C. Export the logs to BigQuery, and set up App Engine to read that information and send emails if you find a failure in the logs

D. Develop an App Engine application to consume logs using GCP API calls, and send emails if you find a failure in the logs

**Answer: A**

**Timestamp: Sept. 2, 2022, 6:03 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79472-exam-professional-data-engineer-topic-1-question-163/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 164 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 164
Topic #: 1

[All Professional Data Engineer Questions]

You are working on a linear regression model on BigQuery ML to predict a customer's likelihood of purchasing your company's products. Your model uses a city name variable as a key predictive component. In order to train and serve the model, your data must be organized in columns. You want to prepare your data using the least amount of coding while maintaining the predictable variables. What should you do? 

A. Create a new view with BigQuery that does not include a column with city information.

B. Use SQL in BigQuery to transform the state column using a one-hot encoding method, and make each city a column with binary values.

C. Use TensorFlow to create a categorical variable with a vocabulary list. Create the vocabulary file and upload that as part of your model to BigQuery ML.

D. Use Cloud Data Fusion to assign each city to a region that is labeled as 1, 2, 3, 4, or 5, and then use that number to represent the city in the model.

**Answer: B**

**Timestamp: Sept. 2, 2022, 6:25 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79478-exam-professional-data-engineer-topic-1-question-164/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 165 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 165
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large bank that operates in locations throughout North America. You are setting up a data storage system that will handle bank account transactions. You require ACID compliance and the ability to access data with SQL. Which solution is appropriate? 

A. Store transaction data in Cloud Spanner. Enable stale reads to reduce latency.

B. Store transaction in Cloud Spanner. Use locking read-write transactions.

C. Store transaction data in BigQuery. Disabled the query cache to ensure consistency.

D. Store transaction data in Cloud SQL. Use a federated query BigQuery for analysis.

**Answer: B**

**Timestamp: Sept. 3, 2022, 1:19 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79627-exam-professional-data-engineer-topic-1-question-165/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 166 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 166
Topic #: 1

[All Professional Data Engineer Questions]

A shipping company has live package-tracking data that is sent to an Apache Kafka stream in real time. This is then loaded into BigQuery. Analysts in your company want to query the tracking data in BigQuery to analyze geospatial trends in the lifecycle of a package. The table was originally created with ingest-date partitioning. Over time, the query processing time has increased. You need to implement a change that would improve query performance in BigQuery. What should you do? 

A. Implement clustering in BigQuery on the ingest date column.

B. Implement clustering in BigQuery on the package-tracking ID column.

C. Tier older data onto Cloud Storage files and create a BigQuery table using Cloud Storage as an external data source.

D. Re-create the table using data partitioning on the package delivery date.

**Answer: B**

**Timestamp: Sept. 4, 2022, 10:50 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/80145-exam-professional-data-engineer-topic-1-question-166/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 167 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 167
Topic #: 1

[All Professional Data Engineer Questions]

Your company currently runs a large on-premises cluster using Spark, Hive, and HDFS in a colocation facility. The cluster is designed to accommodate peak usage on the system; however, many jobs are batch in nature, and usage of the cluster fluctuates quite dramatically. Your company is eager to move to the cloud to reduce the overhead associated with on-premises infrastructure and maintenance and to benefit from the cost savings. They are also hoping to modernize their existing infrastructure to use more serverless offerings in order to take advantage of the cloud. Because of the timing of their contract renewal with the colocation facility, they have only 2 months for their initial migration. How would you recommend they approach their upcoming migration strategy so they can maximize their cost savings in the cloud while still executing the migration in time? 

A. Migrate the workloads to Dataproc plus HDFS; modernize later.

B. Migrate the workloads to Dataproc plus Cloud Storage; modernize later.

C. Migrate the Spark workload to Dataproc plus HDFS, and modernize the Hive workload for BigQuery.

D. Modernize the Spark workload for Dataflow and the Hive workload for BigQuery.

**Answer: B**

**Timestamp: Sept. 2, 2022, 6:57 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79492-exam-professional-data-engineer-topic-1-question-167/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 168 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 168
Topic #: 1

[All Professional Data Engineer Questions]

You work for a financial institution that lets customers register online. As new customers register, their user data is sent to Pub/Sub before being ingested intoBigQuery. For security reasons, you decide to redact your customers' Government issued Identification Number while allowing customer service representatives to view the original values when necessary. What should you do? 

A. Use BigQuery's built-in AEAD encryption to encrypt the SSN column. Save the keys to a new table that is only viewable by permissioned users.

B. Use BigQuery column-level security. Set the table permissions so that only members of the Customer Service user group can see the SSN column.

C. Before loading the data into BigQuery, use Cloud Data Loss Prevention (DLP) to replace input values with a cryptographic hash.

D. Before loading the data into BigQuery, use Cloud Data Loss Prevention (DLP) to replace input values with a cryptographic format-preserving encryption token.

**Answer: D**

**Timestamp: Sept. 2, 2022, 7:01 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79494-exam-professional-data-engineer-topic-1-question-168/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 169 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 169
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating a table to BigQuery and are deciding on the data model. Your table stores information related to purchases made across several store locations and includes information like the time of the transaction, items purchased, the store ID, and the city and state in which the store is located. You frequently query this table to see how many of each item were sold over the past 30 days and to look at purchasing trends by state, city, and individual store. How would you model this table for the best query performance? 

A. Partition by transaction time; cluster by state first, then city, then store ID.

B. Partition by transaction time; cluster by store ID first, then city, then state.

C. Top-level cluster by state first, then city, then store ID.

D. Top-level cluster by store ID first, then city, then state.

**Answer: A**

**Timestamp: Sept. 3, 2022, 7:10 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79685-exam-professional-data-engineer-topic-1-question-169/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 170 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 170
Topic #: 1

[All Professional Data Engineer Questions]

You are updating the code for a subscriber to a Pub/Sub feed. You are concerned that upon deployment the subscriber may erroneously acknowledge messages, leading to message loss. Your subscriber is not set up to retain acknowledged messages. What should you do to ensure that you can recover from errors after deployment? 

A. Set up the Pub/Sub emulator on your local machine. Validate the behavior of your new subscriber logic before deploying it to production.

B. Create a Pub/Sub snapshot before deploying new subscriber code. Use a Seek operation to re-deliver messages that became available after the snapshot was created.

C. Use Cloud Build for your deployment. If an error occurs after deployment, use a Seek operation to locate a timestamp logged by Cloud Build at the start of the deployment.

D. Enable dead-lettering on the Pub/Sub topic to capture messages that aren't successfully acknowledged. If an error occurs after deployment, re-deliver any messages captured by the dead-letter queue.

**Answer: B**

**Timestamp: Sept. 2, 2022, 7:38 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79515-exam-professional-data-engineer-topic-1-question-170/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 171 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 171
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large real estate firm and are preparing 6 TB of home sales data to be used for machine learning. You will use SQL to transform the data and useBigQuery ML to create a machine learning model. You plan to use the model for predictions against a raw dataset that has not been transformed. How should you set up your workflow in order to prevent skew at prediction time? 

A. When creating your model, use BigQuery's TRANSFORM clause to define preprocessing steps. At prediction time, use BigQuery's ML.EVALUATE clause without specifying any transformations on the raw input data.

B. When creating your model, use BigQuery's TRANSFORM clause to define preprocessing steps. Before requesting predictions, use a saved query to transform your raw input data, and then use ML.EVALUATE.

C. Use a BigQuery view to define your preprocessing logic. When creating your model, use the view as your model training data. At prediction time, use BigQuery's ML.EVALUATE clause without specifying any transformations on the raw input data.

D. Preprocess all data using Dataflow. At prediction time, use BigQuery's ML.EVALUATE clause without specifying any further transformations on the input data.

**Answer: A**

**Timestamp: Sept. 2, 2022, 7:44 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79520-exam-professional-data-engineer-topic-1-question-171/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 172 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 172
Topic #: 1

[All Professional Data Engineer Questions]

You are analyzing the price of a company's stock. Every 5 seconds, you need to compute a moving average of the past 30 seconds' worth of data. You are reading data from Pub/Sub and using DataFlow to conduct the analysis. How should you set up your windowed pipeline? 

A. Use a fixed window with a duration of 5 seconds. Emit results by setting the following trigger: AfterProcessingTime.pastFirstElementInPane().plusDelayOf (Duration.standardSeconds(30))

B. Use a fixed window with a duration of 30 seconds. Emit results by setting the following trigger: AfterWatermark.pastEndOfWindow().plusDelayOf (Duration.standardSeconds(5))

C. Use a sliding window with a duration of 5 seconds. Emit results by setting the following trigger: AfterProcessingTime.pastFirstElementInPane().plusDelayOf (Duration.standardSeconds(30))

D. Use a sliding window with a duration of 30 seconds and a period of 5 seconds. Emit results by setting the following trigger: AfterWatermark.pastEndOfWindow ()

**Answer: D**

**Timestamp: Sept. 2, 2022, 7:48 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79521-exam-professional-data-engineer-topic-1-question-172/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 173 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 173
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a pipeline that publishes application events to a Pub/Sub topic. Although message ordering is not important, you need to be able to aggregate events across disjoint hourly intervals before loading the results to BigQuery for analysis. What technology should you use to process and load this data toBigQuery while ensuring that it will scale with large volumes of events? 

A. Create a Cloud Function to perform the necessary data processing that executes using the Pub/Sub trigger every time a new message is published to the topic.

B. Schedule a Cloud Function to run hourly, pulling all available messages from the Pub/Sub topic and performing the necessary aggregations.

C. Schedule a batch Dataflow job to run hourly, pulling all available messages from the Pub/Sub topic and performing the necessary aggregations.

D. Create a streaming Dataflow job that reads continually from the Pub/Sub topic and performs the necessary aggregations using tumbling windows.

**Answer: D**

**Timestamp: Sept. 2, 2022, 7:51 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79524-exam-professional-data-engineer-topic-1-question-173/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 174 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 174
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large financial institution that is planning to use Dialogflow to create a chatbot for the company's mobile app. You have reviewed old chat logs and tagged each conversation for intent based on each customer's stated intention for contacting customer service. About 70% of customer requests are simple requests that are solved within 10 intents. The remaining 30% of inquiries require much longer, more complicated requests. Which intents should you automate first? 

A. Automate the 10 intents that cover 70% of the requests so that live agents can handle more complicated requests.

B. Automate the more complicated requests first because those require more of the agents' time.

C. Automate a blend of the shortest and longest intents to be representative of all intents.

D. Automate intents in places where common words such as 'payment' appear only once so the software isn't confused.

**Answer: A**

**Timestamp: Sept. 4, 2022, 10:50 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/80144-exam-professional-data-engineer-topic-1-question-174/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 175 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 175
Topic #: 1

[All Professional Data Engineer Questions]

Your company is implementing a data warehouse using BigQuery, and you have been tasked with designing the data model. You move your on-premises sales data warehouse with a star data schema to BigQuery but notice performance issues when querying the data of the past 30 days. Based on Google's recommended practices, what should you do to speed up the query without increasing storage costs? 

A. Denormalize the data.

B. Shard the data by customer ID.

C. Materialize the dimensional data in views.

D. Partition the data by transaction date.

**Answer: D**

**Timestamp: Sept. 2, 2022, 7:10 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79498-exam-professional-data-engineer-topic-1-question-175/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 176 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 176
Topic #: 1

[All Professional Data Engineer Questions]

You have uploaded 5 years of log data to Cloud Storage. A user reported that some data points in the log data are outside of their expected ranges, which indicates errors. You need to address this issue and be able to run the process again in the future while keeping the original data for compliance reasons. What should you do? 

A. Import the data from Cloud Storage into BigQuery. Create a new BigQuery table, and skip the rows with errors.

B. Create a Compute Engine instance and create a new copy of the data in Cloud Storage. Skip the rows with errors.

C. Create a Dataflow workflow that reads the data from Cloud Storage, checks for values outside the expected range, sets the value to an appropriate default, and writes the updated records to a new dataset in Cloud Storage.

D. Create a Dataflow workflow that reads the data from Cloud Storage, checks for values outside the expected range, sets the value to an appropriate default, and writes the updated records to the same dataset in Cloud Storage.

**Answer: C**

**Timestamp: Sept. 2, 2022, 7:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79501-exam-professional-data-engineer-topic-1-question-176/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 177 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 177
Topic #: 1

[All Professional Data Engineer Questions]

You want to rebuild your batch pipeline for structured data on Google Cloud. You are using PySpark to conduct data transformations at scale, but your pipelines are taking over twelve hours to run. To expedite development and pipeline run time, you want to use a serverless tool and SOL syntax. You have already moved your raw data into Cloud Storage. How should you build the pipeline on Google Cloud while meeting speed and processing requirements? 

A. Convert your PySpark commands into SparkSQL queries to transform the data, and then run your pipeline on Dataproc to write the data into BigQuery.

B. Ingest your data into Cloud SQL, convert your PySpark commands into SparkSQL queries to transform the data, and then use federated quenes from BigQuery for machine learning.

C. Ingest your data into BigQuery from Cloud Storage, convert your PySpark commands into BigQuery SQL queries to transform the data, and then write the transformations to a new table.

D. Use Apache Beam Python SDK to build the transformation pipelines, and write the data into BigQuery.

**Answer: C**

**Timestamp: Sept. 2, 2022, 8:30 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79540-exam-professional-data-engineer-topic-1-question-177/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 178 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 178
Topic #: 1

[All Professional Data Engineer Questions]

You are testing a Dataflow pipeline to ingest and transform text files. The files are compressed gzip, errors are written to a dead-letter queue, and you are usingSideInputs to join data. You noticed that the pipeline is taking longer to complete than expected; what should you do to expedite the Dataflow job? 

A. Switch to compressed Avro files.

B. Reduce the batch size.

C. Retry records that throw an error.

D. Use CoGroupByKey instead of the SideInput.

**Answer: D**

**Timestamp: Sept. 2, 2022, 9:02 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79547-exam-professional-data-engineer-topic-1-question-178/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 179 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 179
Topic #: 1

[All Professional Data Engineer Questions]

You are building a real-time prediction engine that streams files, which may contain PII (personal identifiable information) data, into Cloud Storage and eventually into BigQuery. You want to ensure that the sensitive data is masked but still maintains referential integrity, because names and emails are often used as join keys.How should you use the Cloud Data Loss Prevention API (DLP API) to ensure that the PII data is not accessible by unauthorized individuals? 

A. Create a pseudonym by replacing the PII data with cryptogenic tokens, and store the non-tokenized data in a locked-down button.

B. Redact all PII data, and store a version of the unredacted data in a locked-down bucket.

C. Scan every table in BigQuery, and mask the data it finds that has PII.

D. Create a pseudonym by replacing PII data with a cryptographic format-preserving token.

**Answer: D**

**Timestamp: Sept. 2, 2022, 9:18 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79550-exam-professional-data-engineer-topic-1-question-179/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 180 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 180
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating an application that tracks library books and information about each book, such as author or year published, from an on-premises data warehouse to BigQuery. In your current relational database, the author information is kept in a separate table and joined to the book information on a common key. Based on Google's recommended practice for schema design, how would you structure the data to ensure optimal speed of queries about the author of each book that has been borrowed? 

A. Keep the schema the same, maintain the different tables for the book and each of the attributes, and query as you are doing today.

B. Create a table that is wide and includes a column for each attribute, including the author's first name, last name, date of birth, etc.

C. Create a table that includes information about the books and authors, but nest the author fields inside the author column.

D. Keep the schema the same, create a view that joins all of the tables, and always query the view.

**Answer: C**

**Timestamp: Sept. 2, 2022, 9:22 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79552-exam-professional-data-engineer-topic-1-question-180/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 181 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 181
Topic #: 1

[All Professional Data Engineer Questions]

You need to give new website users a globally unique identifier (GUID) using a service that takes in data points and returns a GUID. This data is sourced from both internal and external systems via HTTP calls that you will make via microservices within your pipeline. There will be tens of thousands of messages per second and that can be multi-threaded. and you worry about the backpressure on the system. How should you design your pipeline to minimize that backpressure? 

A. Call out to the service via HTTP.

B. Create the pipeline statically in the class definition.

C. Create a new object in the startBundle method of DoFn.

D. Batch the job into ten-second increments.

**Answer: D**

**Timestamp: Sept. 4, 2022, 3:19 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79924-exam-professional-data-engineer-topic-1-question-181/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 182 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 182
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating your data warehouse to Google Cloud and decommissioning your on-premises data center. Because this is a priority for your company, you know that bandwidth will be made available for the initial data load to the cloud. The files being transferred are not large in number, but each file is 90 GB.Additionally, you want your transactional systems to continually update the warehouse on Google Cloud in real time. What tools should you use to migrate the data and ensure that it continues to write to your warehouse? 

A. Storage Transfer Service for the migration; Pub/Sub and Cloud Data Fusion for the real-time updates

B. BigQuery Data Transfer Service for the migration; Pub/Sub and Dataproc for the real-time updates

C. gsutil for the migration; Pub/Sub and Dataflow for the real-time updates

D. gsutil for both the migration and the real-time updates

**Answer: C**

**Timestamp: Sept. 2, 2022, 9:55 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79560-exam-professional-data-engineer-topic-1-question-182/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 183 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 183
Topic #: 1

[All Professional Data Engineer Questions]

You are using Bigtable to persist and serve stock market data for each of the major indices. To serve the trading application, you need to access only the most recent stock prices that are streaming in. How should you design your row key and tables to ensure that you can access the data with the simplest query? 

A. Create one unique table for all of the indices, and then use the index and timestamp as the row key design.

B. Create one unique table for all of the indices, and then use a reverse timestamp as the row key design.

C. For each index, have a separate table and use a timestamp as the row key design.

D. For each index, have a separate table and use a reverse timestamp as the row key design.

**Answer: A**

**Timestamp: Sept. 2, 2022, 10:25 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79580-exam-professional-data-engineer-topic-1-question-183/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 184 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 184
Topic #: 1

[All Professional Data Engineer Questions]

You are building a report-only data warehouse where the data is streamed into BigQuery via the streaming API. Following Google's best practices, you have both a staging and a production table for the data. How should you design your data loading to ensure that there is only one master dataset without affecting performance on either the ingestion or reporting pieces? 

A. Have a staging table that is an append-only model, and then update the production table every three hours with the changes written to staging.

B. Have a staging table that is an append-only model, and then update the production table every ninety minutes with the changes written to staging.

C. Have a staging table that moves the staged data over to the production table and deletes the contents of the staging table every three hours.

D. Have a staging table that moves the staged data over to the production table and deletes the contents of the staging table every thirty minutes.

**Answer: C**

**Timestamp: Sept. 2, 2022, 10:36 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79593-exam-professional-data-engineer-topic-1-question-184/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 185 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 185
Topic #: 1

[All Professional Data Engineer Questions]

You issue a new batch job to Dataflow. The job starts successfully, processes a few elements, and then suddenly fails and shuts down. You navigate to theDataflow monitoring interface where you find errors related to a particular DoFn in your pipeline. What is the most likely cause of the errors? 

A. Job validation

B. Exceptions in worker code

C. Graph or pipeline construction

D. Insufficient permissions

**Answer: B**

**Timestamp: Sept. 2, 2022, 10:47 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79599-exam-professional-data-engineer-topic-1-question-185/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 186 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 186
Topic #: 1

[All Professional Data Engineer Questions]

Your new customer has requested daily reports that show their net consumption of Google Cloud compute resources and who used the resources. You need to quickly and efficiently generate these daily reports. What should you do? 

A. Do daily exports of Cloud Logging data to BigQuery. Create views filtering by project, log type, resource, and user.

B. Filter data in Cloud Logging by project, resource, and user; then export the data in CSV format.

C. Filter data in Cloud Logging by project, log type, resource, and user, then import the data into BigQuery.

D. Export Cloud Logging data to Cloud Storage in CSV format. Cleanse the data using Dataprep, filtering by project, resource, and user.

**Answer: A**

**Timestamp: Sept. 2, 2022, 10:58 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79603-exam-professional-data-engineer-topic-1-question-186/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 187 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 187
Topic #: 1

[All Professional Data Engineer Questions]

The Development and External teams have the project viewer Identity and Access Management (IAM) role in a folder named Visualization. You want theDevelopment Team to be able to read data from both Cloud Storage and BigQuery, but the External Team should only be able to read data from BigQuery. What should you do? 

A. Remove Cloud Storage IAM permissions to the External Team on the acme-raw-data project.

B. Create Virtual Private Cloud (VPC) firewall rules on the acme-raw-data project that deny all ingress traffic from the External Team CIDR range.

C. Create a VPC Service Controls perimeter containing both projects and BigQuery as a restricted API. Add the External Team users to the perimeter's Access Level.

D. Create a VPC Service Controls perimeter containing both projects and Cloud Storage as a restricted API. Add the Development Team users to the perimeter's Access Level.

**Answer: D**

**Timestamp: Sept. 2, 2022, 11:02 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79604-exam-professional-data-engineer-topic-1-question-187/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 188 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 188
Topic #: 1

[All Professional Data Engineer Questions]

Your startup has a web application that currently serves customers out of a single region in Asia. You are targeting funding that will allow your startup to serve customers globally. Your current goal is to optimize for cost, and your post-funding goal is to optimize for global presence and performance. You must use a nativeJDBC driver. What should you do? 

A. Use Cloud Spanner to configure a single region instance initially, and then configure multi-region Cloud Spanner instances after securing funding.

B. Use a Cloud SQL for PostgreSQL highly available instance first, and Bigtable with US, Europe, and Asia replication after securing funding.

C. Use a Cloud SQL for PostgreSQL zonal instance first, and Bigtable with US, Europe, and Asia after securing funding.

D. Use a Cloud SQL for PostgreSQL zonal instance first, and Cloud SQL for PostgreSQL with highly available configuration after securing funding.

**Answer: A**

**Timestamp: Sept. 2, 2022, 11:06 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79606-exam-professional-data-engineer-topic-1-question-188/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 189 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 189
Topic #: 1

[All Professional Data Engineer Questions]

You need to migrate 1 PB of data from an on-premises data center to Google Cloud. Data transfer time during the migration should take only a few hours. You want to follow Google-recommended practices to facilitate the large data transfer over a secure connection. What should you do? 

A. Establish a Cloud Interconnect connection between the on-premises data center and Google Cloud, and then use the Storage Transfer Service.

B. Use a Transfer Appliance and have engineers manually encrypt, decrypt, and verify the data.

C. Establish a Cloud VPN connection, start gcloud compute scp jobs in parallel, and run checksums to verify the data.

D. Reduce the data into 3 TB batches, transfer the data using gsutil, and run checksums to verify the data.

**Answer: A**

**Timestamp: Sept. 2, 2022, 11:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79608-exam-professional-data-engineer-topic-1-question-189/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 190 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 190
Topic #: 1

[All Professional Data Engineer Questions]

You are loading CSV files from Cloud Storage to BigQuery. The files have known data quality issues, including mismatched data types, such as STRINGs andINT64s in the same column, and inconsistent formatting of values such as phone numbers or addresses. You need to create the data pipeline to maintain data quality and perform the required cleansing and transformation. What should you do? 

A. Use Data Fusion to transform the data before loading it into BigQuery.

B. Use Data Fusion to convert the CSV files to a self-describing data format, such as AVRO, before loading the data to BigQuery.

C. Load the CSV files into a staging table with the desired schema, perform the transformations with SQL, and then write the results to the final destination table.

D. Create a table with the desired schema, load the CSV files into the table, and perform the transformations in place using SQL.

**Answer: A**

**Timestamp: Sept. 2, 2022, 11:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79609-exam-professional-data-engineer-topic-1-question-190/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 191 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 191
Topic #: 1

[All Professional Data Engineer Questions]

You are developing a new deep learning model that predicts a customer's likelihood to buy on your ecommerce site. After running an evaluation of the model against both the original training data and new test data, you find that your model is overfitting the data. You want to improve the accuracy of the model when predicting new data. What should you do? 

A. Increase the size of the training dataset, and increase the number of input features.

B. Increase the size of the training dataset, and decrease the number of input features.

C. Reduce the size of the training dataset, and increase the number of input features.

D. Reduce the size of the training dataset, and decrease the number of input features.

**Answer: B**

**Timestamp: Sept. 3, 2022, 3:46 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79643-exam-professional-data-engineer-topic-1-question-191/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 192 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 192
Topic #: 1

[All Professional Data Engineer Questions]

You are implementing a chatbot to help an online retailer streamline their customer service. The chatbot must be able to respond to both text and voice inquiries.You are looking for a low-code or no-cade option, and you want to be able to easily train the chatbot to provide answers to keywords. What should you do? 

A. Use the Cloud Speech-to-Text API to build a Python application in App Engine.

B. Use the Cloud Speech-to-Text API to build a Python application in a Compute Engine instance.

C. Use Dialogflow for simple queries and the Cloud Speech-to-Text API for complex queries.

D. Use Dialogflow to implement the chatbot, defining the intents based on the most common queries collected.

**Answer: D**

**Timestamp: Sept. 2, 2022, 7:54 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79526-exam-professional-data-engineer-topic-1-question-192/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 193 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 193
Topic #: 1

[All Professional Data Engineer Questions]

An aerospace company uses a proprietary data format to store its flight data. You need to connect this new data source to BigQuery and stream the data intoBigQuery. You want to efficiently import the data into BigQuery while consuming as few resources as possible. What should you do? 

A. Write a shell script that triggers a Cloud Function that performs periodic ETL batch jobs on the new data source.

B. Use a standard Dataflow pipeline to store the raw data in BigQuery, and then transform the format later when the data is used.

C. Use Apache Hive to write a Dataproc job that streams the data into BigQuery in CSV format.

D. Use an Apache Beam custom connector to write a Dataflow pipeline that streams the data into BigQuery in Avro format.

**Answer: D**

**Timestamp: Sept. 3, 2022, 3:52 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79644-exam-professional-data-engineer-topic-1-question-193/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 194 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 194
Topic #: 1

[All Professional Data Engineer Questions]

An online brokerage company requires a high volume trade processing architecture. You need to create a secure queuing system that triggers jobs. The jobs will run in Google Cloud and call the company's Python API to execute trades. You need to efficiently implement a solution. What should you do? 

A. Use a Pub/Sub push subscription to trigger a Cloud Function to pass the data to the Python API.

B. Write an application hosted on a Compute Engine instance that makes a push subscription to the Pub/Sub topic.

C. Write an application that makes a queue in a NoSQL database.

D. Use Cloud Composer to subscribe to a Pub/Sub topic and call the Python API.

**Answer: A**

**Timestamp: Sept. 2, 2022, 7:58 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79529-exam-professional-data-engineer-topic-1-question-194/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 195 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 195
Topic #: 1

[All Professional Data Engineer Questions]

Your company wants to be able to retrieve large result sets of medical information from your current system, which has over 10 TBs in the database, and store the data in new tables for further query. The database must have a low-maintenance architecture and be accessible via SQL. You need to implement a cost-effective solution that can support data analytics for large result sets. What should you do? 

A. Use Cloud SQL, but first organize the data into tables. Use JOIN in queries to retrieve data.

B. Use BigQuery as a data warehouse. Set output destinations for caching large queries.

C. Use a MySQL cluster installed on a Compute Engine managed instance group for scalability.

D. Use Cloud Spanner to replicate the data across regions. Normalize the data in a series of tables.

**Answer: B**

**Timestamp: Sept. 3, 2022, 3:56 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79645-exam-professional-data-engineer-topic-1-question-195/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 196 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 196
Topic #: 1

[All Professional Data Engineer Questions]

You have 15 TB of data in your on-premises data center that you want to transfer to Google Cloud. Your data changes weekly and is stored in a POSIX-compliant source. The network operations team has granted you 500 Mbps bandwidth to the public internet. You want to follow Google-recommended practices to reliably transfer your data to Google Cloud on a weekly basis. What should you do? 

A. Use Cloud Scheduler to trigger the gsutil command. Use the -m parameter for optimal parallelism.

B. Use Transfer Appliance to migrate your data into a Google Kubernetes Engine cluster, and then configure a weekly transfer job.

C. Install Storage Transfer Service for on-premises data in your data center, and then configure a weekly transfer job.

D. Install Storage Transfer Service for on-premises data on a Google Cloud virtual machine, and then configure a weekly transfer job.

**Answer: C**

**Timestamp: Sept. 3, 2022, 3:57 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79646-exam-professional-data-engineer-topic-1-question-196/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 197 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 197
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a system that requires an ACID-compliant database. You must ensure that the system requires minimal human intervention in case of a failure.What should you do? 

A. Configure a Cloud SQL for MySQL instance with point-in-time recovery enabled.

B. Configure a Cloud SQL for PostgreSQL instance with high availability enabled.

C. Configure a Bigtable instance with more than one cluster.

D. Configure a BigQuery table with a multi-region configuration.

**Answer: B**

**Timestamp: Sept. 3, 2022, 3:57 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79647-exam-professional-data-engineer-topic-1-question-197/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 198 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 198
Topic #: 1

[All Professional Data Engineer Questions]

You are implementing workflow pipeline scheduling using open source-based tools and Google Kubernetes Engine (GKE). You want to use a Google managed service to simplify and automate the task. You also want to accommodate Shared VPC networking considerations. What should you do? 

A. Use Dataflow for your workflow pipelines. Use Cloud Run triggers for scheduling.

B. Use Dataflow for your workflow pipelines. Use shell scripts to schedule workflows.

C. Use Cloud Composer in a Shared VPC configuration. Place the Cloud Composer resources in the host project.

D. Use Cloud Composer in a Shared VPC configuration. Place the Cloud Composer resources in the service project.

**Answer: D**

**Timestamp: Sept. 3, 2022, 4 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79648-exam-professional-data-engineer-topic-1-question-198/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 199 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 199
Topic #: 1

[All Professional Data Engineer Questions]

You are using BigQuery and Data Studio to design a customer-facing dashboard that displays large quantities of aggregated data. You expect a high volume of concurrent users. You need to optimize the dashboard to provide quick visualizations with minimal latency. What should you do? 

A. Use BigQuery BI Engine with materialized views.

B. Use BigQuery BI Engine with logical views.

C. Use BigQuery BI Engine with streaming data.

D. Use BigQuery BI Engine with authorized views.

**Answer: A**

**Timestamp: Sept. 3, 2022, 4:02 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79649-exam-professional-data-engineer-topic-1-question-199/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 200 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 200
Topic #: 1

[All Professional Data Engineer Questions]

Government regulations in the banking industry mandate the protection of clients' personally identifiable information (PII). Your company requires PII to be access controlled, encrypted, and compliant with major data protection standards. In addition to using Cloud Data Loss Prevention (Cloud DLP), you want to followGoogle-recommended practices and use service accounts to control access to PII. What should you do? 

A. Assign the required Identity and Access Management (IAM) roles to every employee, and create a single service account to access project resources.

B. Use one service account to access a Cloud SQL database, and use separate service accounts for each human user.

C. Use Cloud Storage to comply with major data protection standards. Use one service account shared by all users.

D. Use Cloud Storage to comply with major data protection standards. Use multiple service accounts attached to IAM groups to grant the appropriate access to each group.

**Answer: D**

**Timestamp: Sept. 3, 2022, 4:04 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79650-exam-professional-data-engineer-topic-1-question-200/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 201 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 201
Topic #: 1

[All Professional Data Engineer Questions]

You need to migrate a Redis database from an on-premises data center to a Memorystore for Redis instance. You want to follow Google-recommended practices and perform the migration for minimal cost, time and effort. What should you do? 

A. Make an RDB backup of the Redis database, use the gsutil utility to copy the RDB file into a Cloud Storage bucket, and then import the RDB file into the Memorystore for Redis instance.

B. Make a secondary instance of the Redis database on a Compute Engine instance and then perform a live cutover.

C. Create a Dataflow job to read the Redis database from the on-premises data center and write the data to a Memorystore for Redis instance.

D. Write a shell script to migrate the Redis data and create a new Memorystore for Redis instance.

**Answer: A**

**Timestamp: Sept. 3, 2022, 4:12 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79651-exam-professional-data-engineer-topic-1-question-201/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 202 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 202
Topic #: 1

[All Professional Data Engineer Questions]

Your platform on your on-premises environment generates 100 GB of data daily, composed of millions of structured JSON text files. Your on-premises environment cannot be accessed from the public internet. You want to use Google Cloud products to query and explore the platform data. What should you do? 

A. Use Cloud Scheduler to copy data daily from your on-premises environment to Cloud Storage. Use the BigQuery Data Transfer Service to import data into BigQuery.

B. Use a Transfer Appliance to copy data from your on-premises environment to Cloud Storage. Use the BigQuery Data Transfer Service to import data into BigQuery.

C. Use Transfer Service for on-premises data to copy data from your on-premises environment to Cloud Storage. Use the BigQuery Data Transfer Service to import data into BigQuery.

D. Use the BigQuery Data Transfer Service dataset copy to transfer all data into BigQuery.

**Answer: C**

**Timestamp: Sept. 3, 2022, 4:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/79652-exam-professional-data-engineer-topic-1-question-202/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 203 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 203
Topic #: 1

[All Professional Data Engineer Questions]

A TensorFlow machine learning model on Compute Engine virtual machines (n2-standard-32) takes two days to complete training. The model has custom TensorFlow operations that must run partially on a CPU. You want to reduce the training time in a cost-effective manner. What should you do? 

A. Change the VM type to n2-highmem-32.

B. Change the VM type to e2-standard-32.

C. Train the model using a VM with a GPU hardware accelerator.

D. Train the model using a VM with a TPU hardware accelerator.

**Answer: C**

**Timestamp: Nov. 29, 2022, 2:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/89246-exam-professional-data-engineer-topic-1-question-203/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 204 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 204
Topic #: 1

[All Professional Data Engineer Questions]

You want to create a machine learning model using BigQuery ML and create an endpoint for hosting the model using Vertex AI. This will enable the processing of continuous streaming data in near-real time from multiple vendors. The data may contain invalid values. What should you do? 

A. Create a new BigQuery dataset and use streaming inserts to land the data from multiple vendors. Configure your BigQuery ML model to use the "ingestion" dataset as the framing data.

B. Use BigQuery streaming inserts to land the data from multiple vendors where your BigQuery dataset ML model is deployed.

C. Create a Pub/Sub topic and send all vendor data to it. Connect a Cloud Function to the topic to process the data and store it in BigQuery.

D. Create a Pub/Sub topic and send all vendor data to it. Use Dataflow to process and sanitize the Pub/Sub data and stream it to BigQuery.

**Answer: D**

**Timestamp: Nov. 30, 2022, 11:08 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/89456-exam-professional-data-engineer-topic-1-question-204/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 205 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 205
Topic #: 1

[All Professional Data Engineer Questions]

You have a data processing application that runs on Google Kubernetes Engine (GKE). Containers need to be launched with their latest available configurations from a container registry. Your GKE nodes need to have GPUs, local SSDs, and 8 Gbps bandwidth. You want to efficiently provision the data processing infrastructure and manage the deployment process. What should you do? 

A. Use Compute Engine startup scripts to pull container images, and use gcloud commands to provision the infrastructure.

B. Use Cloud Build to schedule a job using Terraform build to provision the infrastructure and launch with the most current container images.

C. Use GKE to autoscale containers, and use gcloud commands to provision the infrastructure.

D. Use Dataflow to provision the data pipeline, and use Cloud Scheduler to run the job.

**Answer: B**

**Timestamp: Nov. 30, 2022, 11:10 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/89458-exam-professional-data-engineer-topic-1-question-205/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 206 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 206
Topic #: 1

[All Professional Data Engineer Questions]

You need ads data to serve AI models and historical data for analytics. Longtail and outlier data points need to be identified. You want to cleanse the data in near-real time before running it through AI models. What should you do? 

A. Use Cloud Storage as a data warehouse, shell scripts for processing, and BigQuery to create views for desired datasets.

B. Use Dataflow to identify longtail and outlier data points programmatically, with BigQuery as a sink.

C. Use BigQuery to ingest, prepare, and then analyze the data, and then run queries to create views.

D. Use Cloud Composer to identify longtail and outlier data points, and then output a usable dataset to BigQuery.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:24 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129853-exam-professional-data-engineer-topic-1-question-206/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 207 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 207
Topic #: 1

[All Professional Data Engineer Questions]

You are collecting IoT sensor data from millions of devices across the world and storing the data in BigQuery. Your access pattern is based on recent data, filtered by location_id and device_version with the following query:You want to optimize your queries for cost and performance. How should you structure your data? 

A. Partition table data by create_date, location_id, and device_version.

B. Partition table data by create_date, cluster table data by location_id, and device_version.

C. Cluster table data by create_date, location_id, and device_version.

D. Cluster table data by create_date, partition by location_id, and device_version.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:29 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129854-exam-professional-data-engineer-topic-1-question-207/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 208 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 208
Topic #: 1

[All Professional Data Engineer Questions]

A live TV show asks viewers to cast votes using their mobile phones. The event generates a large volume of data during a 3-minute period. You are in charge of the "Voting infrastructure" and must ensure that the platform can handle the load and that all votes are processed. You must display partial results while voting is open. After voting closes, you need to count the votes exactly once while optimizing cost. What should you do? 

A. Create a Memorystore instance with a high availability (HA) configuration.

B. Create a Cloud SQL for PostgreSQL database with high availability (HA) configuration and multiple read replicas.

C. Write votes to a Pub/Sub topic and have Cloud Functions subscribe to it and write votes to BigQuery.

D. Write votes to a Pub/Sub topic and load into both Bigtable and BigQuery via a Dataflow pipeline. Query Bigtable for real-time results and BigQuery for later analysis. Shut down the Bigtable instance when voting concludes.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:30 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129855-exam-professional-data-engineer-topic-1-question-208/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 209 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 209
Topic #: 1

[All Professional Data Engineer Questions]

A shipping company has live package-tracking data that is sent to an Apache Kafka stream in real time. This is then loaded into BigQuery. Analysts in your company want to query the tracking data in BigQuery to analyze geospatial trends in the lifecycle of a package. The table was originally created with ingest-date partitioning. Over time, the query processing time has increased. You need to copy all the data to a new clustered table. What should you do? 

A. Re-create the table using data partitioning on the package delivery date.

B. Implement clustering in BigQuery on the package-tracking ID column.

C. Implement clustering in BigQuery on the ingest date column.

D. Tier older data onto Cloud Storage files and create a BigQuery table using Cloud Storage as an external data source.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:31 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129856-exam-professional-data-engineer-topic-1-question-209/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 210 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 210
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a data mesh on Google Cloud with multiple distinct data engineering teams building data products. The typical data curation design pattern consists of landing files in Cloud Storage, transforming raw data in Cloud Storage and BigQuery datasets, and storing the final curated data product in BigQuery datasets. You need to configure Dataplex to ensure that each team can access only the assets needed to build their data products. You also need to ensure that teams can easily share the curated data product. What should you do? 

A. 1. Create a single Dataplex virtual lake and create a single zone to contain landing, raw, and curated data.2. Provide each data engineering team access to the virtual lake.

B. 1. Create a single Dataplex virtual lake and create a single zone to contain landing, raw, and curated data.2. Build separate assets for each data product within the zone.3. Assign permissions to the data engineering teams at the zone level.

C. 1. Create a Dataplex virtual lake for each data product, and create a single zone to contain landing, raw, and curated data.2. Provide the data engineering teams with full access to the virtual lake assigned to their data product.

D. 1. Create a Dataplex virtual lake for each data product, and create multiple zones for landing, raw, and curated data.2. Provide the data engineering teams with full access to the virtual lake assigned to their data product.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:33 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129857-exam-professional-data-engineer-topic-1-question-210/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 211 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 211
Topic #: 1

[All Professional Data Engineer Questions]

You are using BigQuery with a multi-region dataset that includes a table with the daily sales volumes. This table is updated multiple times per day. You need to protect your sales table in case of regional failures with a recovery point objective (RPO) of less than 24 hours, while keeping costs to a minimum. What should you do? 

A. Schedule a daily export of the table to a Cloud Storage dual or multi-region bucket.

B. Schedule a daily copy of the dataset to a backup region.

C. Schedule a daily BigQuery snapshot of the table.

D. Modify ETL job to load the data into both the current and another backup region.

**Answer: A**

**Timestamp: Dec. 30, 2023, 9:34 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129858-exam-professional-data-engineer-topic-1-question-211/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 212 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 212
Topic #: 1

[All Professional Data Engineer Questions]

You are troubleshooting your Dataflow pipeline that processes data from Cloud Storage to BigQuery. You have discovered that the Dataflow worker nodes cannot communicate with one another. Your networking team relies on Google Cloud network tags to define firewall rules. You need to identify the issue while following Google-recommended networking security practices. What should you do? 

A. Determine whether your Dataflow pipeline has a custom network tag set.

B. Determine whether there is a firewall rule set to allow traffic on TCP ports 12345 and 12346 for the Dataflow network tag.

C. Determine whether there is a firewall rule set to allow traffic on TCP ports 12345 and 12346 on the subnet used by Dataflow workers.

D. Determine whether your Dataflow pipeline is deployed with the external IP address option enabled.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129859-exam-professional-data-engineer-topic-1-question-212/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 214 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 214
Topic #: 1

[All Professional Data Engineer Questions]

You have a Standard Tier Memorystore for Redis instance deployed in a production environment. You need to simulate a Redis instance failover in the most accurate disaster recovery situation, and ensure that the failover has no impact on production data. What should you do? 

A. Create a Standard Tier Memorystore for Redis instance in the development environment. Initiate a manual failover by using the limited-data-loss data protection mode.

B. Create a Standard Tier Memorystore for Redis instance in a development environment. Initiate a manual failover by using the force-data-loss data protection mode.

C. Increase one replica to Redis instance in production environment. Initiate a manual failover by using the force-data-loss data protection mode.

D. Initiate a manual failover by using the limited-data-loss data protection mode to the Memorystore for Redis instance in the production environment.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:39 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129861-exam-professional-data-engineer-topic-1-question-214/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 215 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 215
Topic #: 1

[All Professional Data Engineer Questions]

You are administering a BigQuery dataset that uses a customer-managed encryption key (CMEK). You need to share the dataset with a partner organization that does not have access to your CMEK. What should you do? 

A. Provide the partner organization a copy of your CMEKs to decrypt the data.

B. Export the tables to parquet files to a Cloud Storage bucket and grant the storageinsights.viewer role on the bucket to the partner organization.

C. Copy the tables you need to share to a dataset without CMEKs. Create an Analytics Hub listing for this dataset.

D. Create an authorized view that contains the CMEK to decrypt the data when accessed.

**Answer: C**

**Timestamp: Dec. 30, 2023, 9:40 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129862-exam-professional-data-engineer-topic-1-question-215/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 216 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 216
Topic #: 1

[All Professional Data Engineer Questions]

You are developing an Apache Beam pipeline to extract data from a Cloud SQL instance by using JdbcIO. You have two projects running in Google Cloud. The pipeline will be deployed and executed on Dataflow in Project A. The Cloud SQL. instance is running in Project B and does not have a public IP address. After deploying the pipeline, you noticed that the pipeline failed to extract data from the Cloud SQL instance due to connection failure. You verified that VPC Service Controls and shared VPC are not in use in these projects. You want to resolve this error while ensuring that the data does not go through the public internet. What should you do? 

A. Set up VPC Network Peering between Project A and Project B. Add a firewall rule to allow the peered subnet range to access all instances on the network.

B. Turn off the external IP addresses on the Dataflow worker. Enable Cloud NAT in Project A.

C. Add the external IP addresses of the Dataflow worker as authorized networks in the Cloud SQL instance.

D. Set up VPC Network Peering between Project A and Project B. Create a Compute Engine instance without external IP address in Project B on the peered subnet to serve as a proxy server to the Cloud SQL database.

**Answer: A**

**Timestamp: Dec. 30, 2023, 9:41 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129863-exam-professional-data-engineer-topic-1-question-216/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 217 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 217
Topic #: 1

[All Professional Data Engineer Questions]

You have a BigQuery table that contains customer data, including sensitive information such as names and addresses. You need to share the customer data with your data analytics and consumer support teams securely. The data analytics team needs to access the data of all the customers, but must not be able to access the sensitive data. The consumer support team needs access to all data columns, but must not be able to access customers that no longer have active contracts. You enforced these requirements by using an authorized dataset and policy tags. After implementing these steps, the data analytics team reports that they still have access to the sensitive columns. You need to ensure that the data analytics team does not have access to restricted data. What should you do? (Choose two.) 

A. Create two separate authorized datasets; one for the data analytics team and another for the consumer support team.

B. Ensure that the data analytics team members do not have the Data Catalog Fine-Grained Reader role for the policy tags.

C. Replace the authorized dataset with an authorized view. Use row-level security and apply filter_expression to limit data access.

D. Remove the bigquery.dataViewer role from the data analytics team on the authorized datasets.

E. Enforce access control in the policy tag taxonomy.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:42 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129864-exam-professional-data-engineer-topic-1-question-217/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 218 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 218
Topic #: 1

[All Professional Data Engineer Questions]

You have a Cloud SQL for PostgreSQL instance in Region’ with one read replica in Region2 and another read replica in Region3. An unexpected event in Region’ requires that you perform disaster recovery by promoting a read replica in Region2. You need to ensure that your application has the same database capacity available before you switch over the connections. What should you do? 

A. Enable zonal high availability on the primary instance. Create a new read replica in a new region.

B. Create a cascading read replica from the existing read replica in Region3.

C. Create two new read replicas from the new primary instance, one in Region3 and one in a new region.

D. Create a new read replica in Region1, promote the new read replica to be the primary instance, and enable zonal high availability.

**Answer: C**

**Timestamp: Dec. 30, 2023, 9:43 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129865-exam-professional-data-engineer-topic-1-question-218/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 219 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 219
Topic #: 1

[All Professional Data Engineer Questions]

You orchestrate ETL pipelines by using Cloud Composer. One of the tasks in the Apache Airflow directed acyclic graph (DAG) relies on a third-party service. You want to be notified when the task does not succeed. What should you do? 

A. Assign a function with notification logic to the on_retry_callback parameter for the operator responsible for the task at risk.

B. Configure a Cloud Monitoring alert on the sla_missed metric associated with the task at risk to trigger a notification.

C. Assign a function with notification logic to the on_failure_callback parameter tor the operator responsible for the task at risk.

D. Assign a function with notification logic to the sla_miss_callback parameter for the operator responsible for the task at risk.

**Answer: C**

**Timestamp: Dec. 30, 2023, 9:44 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129866-exam-professional-data-engineer-topic-1-question-219/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 220 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 220
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating your on-premises data warehouse to BigQuery. One of the upstream data sources resides on a MySQL. database that runs in your on-premises data center with no public IP addresses. You want to ensure that the data ingestion into BigQuery is done securely and does not go through the public internet. What should you do? 

A. Update your existing on-premises ETL tool to write to BigQuery by using the BigQuery Open Database Connectivity (ODBC) driver. Set up the proxy parameter in the simba.googlebigqueryodbc.ini file to point to your data center’s NAT gateway.

B. Use Datastream to replicate data from your on-premises MySQL database to BigQuery. Set up Cloud Interconnect between your on-premises data center and Google Cloud. Use Private connectivity as the connectivity method and allocate an IP address range within your VPC network to the Datastream connectivity configuration. Use Server-only as the encryption type when setting up the connection profile in Datastream.

C. Use Datastream to replicate data from your on-premises MySQL database to BigQuery. Use Forward-SSH tunnel as the connectivity method to establish a secure tunnel between Datastream and your on-premises MySQL database through a tunnel server in your on-premises data center. Use None as the encryption type when setting up the connection profile in Datastream.

D. Use Datastream to replicate data from your on-premises MySQL database to BigQuery. Gather Datastream public IP addresses of the Google Cloud region that will be used to set up the stream. Add those IP addresses to the firewall allowlist of your on-premises data center. Use IP Allowlisting as the connectivity method and Server-only as the encryption type when setting up the connection profile in Datastream.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:46 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129867-exam-professional-data-engineer-topic-1-question-220/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 221 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 221
Topic #: 1

[All Professional Data Engineer Questions]

You store and analyze your relational data in BigQuery on Google Cloud with all data that resides in US regions. You also have a variety of object stores across Microsoft Azure and Amazon Web Services (AWS), also in US regions. You want to query all your data in BigQuery daily with as little movement of data as possible. What should you do? 

A. Use BigQuery Data Transfer Service to load files from Azure and AWS into BigQuery.

B. Create a Dataflow pipeline to ingest files from Azure and AWS to BigQuery.

C. Load files from AWS and Azure to Cloud Storage with Cloud Shell gsutil rsync arguments.

D. Use the BigQuery Omni functionality and BigLake tables to query files in Azure and AWS.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:47 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129868-exam-professional-data-engineer-topic-1-question-221/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 222 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 222
Topic #: 1

[All Professional Data Engineer Questions]

You have a variety of files in Cloud Storage that your data science team wants to use in their models. Currently, users do not have a method to explore, cleanse, and validate the data in Cloud Storage. You are looking for a low code solution that can be used by your data science team to quickly cleanse and explore data within Cloud Storage. What should you do? 

A. Provide the data science team access to Dataflow to create a pipeline to prepare and validate the raw data and load data into BigQuery for data exploration.

B. Create an external table in BigQuery and use SQL to transform the data as necessary. Provide the data science team access to the external tables to explore the raw data.

C. Load the data into BigQuery and use SQL to transform the data as necessary. Provide the data science team access to staging tables to explore the raw data.

D. Provide the data science team access to Dataprep to prepare, validate, and explore the data within Cloud Storage.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:48 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129869-exam-professional-data-engineer-topic-1-question-222/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 223 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 223
Topic #: 1

[All Professional Data Engineer Questions]

You are building an ELT solution in BigQuery by using Dataform. You need to perform uniqueness and null value checks on your final tables. What should you do to efficiently integrate these checks into your pipeline? 

A. Build BigQuery user-defined functions (UDFs).

B. Create Dataplex data quality tasks.

C. Build Dataform assertions into your code.

D. Write a Spark-based stored procedure.

**Answer: C**

**Timestamp: Dec. 30, 2023, 9:49 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129870-exam-professional-data-engineer-topic-1-question-223/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 224 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 224
Topic #: 1

[All Professional Data Engineer Questions]

A web server sends click events to a Pub/Sub topic as messages. The web server includes an eventTimestamp attribute in the messages, which is the time when the click occurred. You have a Dataflow streaming job that reads from this Pub/Sub topic through a subscription, applies some transformations, and writes the result to another Pub/Sub topic for use by the advertising department. The advertising department needs to receive each message within 30 seconds of the corresponding click occurrence, but they report receiving the messages late. Your Dataflow job's system lag is about 5 seconds, and the data freshness is about 40 seconds. Inspecting a few messages show no more than 1 second lag between their eventTimestamp and publishTime. What is the problem and what should you do? 

A. The advertising department is causing delays when consuming the messages. Work with the advertising department to fix this.

B. Messages in your Dataflow job are taking more than 30 seconds to process. Optimize your job or increase the number of workers to fix this.

G. Messages in your Dataflow job are processed in less than 30 seconds, but your job cannot keep up with the backlog in the Pub/Sub subscription. Optimize your job or increase the number of workers to fix this.

D. The web server is not pushing messages fast enough to Pub/Sub. Work with the web server team to fix this.

**Answer: G**

**Timestamp: Dec. 30, 2023, 9:50 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129871-exam-professional-data-engineer-topic-1-question-224/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 225 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 225
Topic #: 1

[All Professional Data Engineer Questions]

Your organization stores customer data in an on-premises Apache Hadoop cluster in Apache Parquet format. Data is processed on a daily basis by Apache Spark jobs that run on the cluster. You are migrating the Spark jobs and Parquet data to Google Cloud. BigQuery will be used on future transformation pipelines so you need to ensure that your data is available in BigQuery. You want to use managed services, while minimizing ETL data processing changes and overhead costs. What should you do? 

A. Migrate your data to Cloud Storage and migrate the metadata to Dataproc Metastore (DPMS). Refactor Spark pipelines to write and read data on Cloud Storage, and run them on Dataproc Serverless.

B. Migrate your data to Cloud Storage and register the bucket as a Dataplex asset. Refactor Spark pipelines to write and read data on Cloud Storage, and run them on Dataproc Serverless.

C. Migrate your data to BigQuery. Refactor Spark pipelines to write and read data on BigQuery, and run them on Dataproc Serverless.

D. Migrate your data to BigLake. Refactor Spark pipelines to write and read data on Cloud Storage, and run them on Dataproc on Compute Engine.

**Answer: A**

**Timestamp: Dec. 30, 2023, 9:51 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129872-exam-professional-data-engineer-topic-1-question-225/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 226 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 226
Topic #: 1

[All Professional Data Engineer Questions]

Your organization has two Google Cloud projects, project A and project B. In project A, you have a Pub/Sub topic that receives data from confidential sources. Only the resources in project A should be able to access the data in that topic. You want to ensure that project B and any future project cannot access data in the project A topic. What should you do? 

A. Add firewall rules in project A so only traffic from the VPC in project A is permitted.

B. Configure VPC Service Controls in the organization with a perimeter around project A.

C. Use Identity and Access Management conditions to ensure that only users and service accounts in project A. can access resources in project A.

D. Configure VPC Service Controls in the organization with a perimeter around the VPC of project A.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:52 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129873-exam-professional-data-engineer-topic-1-question-226/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 227 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 227
Topic #: 1

[All Professional Data Engineer Questions]

You stream order data by using a Dataflow pipeline, and write the aggregated result to Memorystore. You provisioned a Memorystore for Redis instance with Basic Tier, 4 GB capacity, which is used by 40 clients for read-only access. You are expecting the number of read-only clients to increase significantly to a few hundred and you need to be able to support the demand. You want to ensure that read and write access availability is not impacted, and any changes you make can be deployed quickly. What should you do? 

A. Create a new Memorystore for Redis instance with Standard Tier. Set capacity to 4 GB and read replica to No read replicas (high availability only). Delete the old instance.

B. Create a new Memorystore for Redis instance with Standard Tier. Set capacity to 5 GB and create multiple read replicas. Delete the old instance.

C. Create a new Memorystore for Memcached instance. Set a minimum of three nodes, and memory per node to 4 GB. Modify the Dataflow pipeline and all clients to use the Memcached instance. Delete the old instance.

D. Create multiple new Memorystore for Redis instances with Basic Tier (4 GB capacity). Modify the Dataflow pipeline and new clients to use all instances.

**Answer: B**

**Timestamp: Dec. 30, 2023, 9:53 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129874-exam-professional-data-engineer-topic-1-question-227/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 228 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 228
Topic #: 1

[All Professional Data Engineer Questions]

You have a streaming pipeline that ingests data from Pub/Sub in production. You need to update this streaming pipeline with improved business logic. You need to ensure that the updated pipeline reprocesses the previous two days of delivered Pub/Sub messages. What should you do? (Choose two.) 

A. Use the Pub/Sub subscription clear-retry-policy flag

B. Use Pub/Sub Snapshot capture two days before the deployment.

C. Create a new Pub/Sub subscription two days before the deployment.

D. Use the Pub/Sub subscription retain-acked-messages flag.

E. Use Pub/Sub Seek with a timestamp.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:54 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129875-exam-professional-data-engineer-topic-1-question-228/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 229 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 229
Topic #: 1

[All Professional Data Engineer Questions]

You currently use a SQL-based tool to visualize your data stored in BigQuery. The data visualizations require the use of outer joins and analytic functions. Visualizations must be based on data that is no less than 4 hours old. Business users are complaining that the visualizations are too slow to generate. You want to improve the performance of the visualization queries while minimizing the maintenance overhead of the data preparation pipeline. What should you do? 

A. Create materialized views with the allow_non_incremental_definition option set to true for the visualization queries. Specify the max_staleness parameter to 4 hours and the enable_refresh parameter to true. Reference the materialized views in the data visualization tool.

B. Create views for the visualization queries. Reference the views in the data visualization tool.

C. Create a Cloud Function instance to export the visualization query results as parquet files to a Cloud Storage bucket. Use Cloud Scheduler to trigger the Cloud Function every 4 hours. Reference the parquet files in the data visualization tool.

D. Create materialized views for the visualization queries. Use the incremental updates capability of BigQuery materialized views to handle changed data automatically. Reference the materialized views in the data visualization tool.

**Answer: A**

**Timestamp: Dec. 30, 2023, 9:55 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129876-exam-professional-data-engineer-topic-1-question-229/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 230 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 230
Topic #: 1

[All Professional Data Engineer Questions]

You need to modernize your existing on-premises data strategy. Your organization currently uses:• Apache Hadoop clusters for processing multiple large data sets, including on-premises Hadoop Distributed File System (HDFS) for data replication.• Apache Airflow to orchestrate hundreds of ETL pipelines with thousands of job steps.You need to set up a new architecture in Google Cloud that can handle your Hadoop workloads and requires minimal changes to your existing orchestration processes. What should you do? 

A. Use Bigtable for your large workloads, with connections to Cloud Storage to handle any HDFS use cases. Orchestrate your pipelines with Cloud Composer.

B. Use Dataproc to migrate Hadoop clusters to Google Cloud, and Cloud Storage to handle any HDFS use cases. Orchestrate your pipelines with Cloud Composer.

C. Use Dataproc to migrate Hadoop clusters to Google Cloud, and Cloud Storage to handle any HDFS use cases. Convert your ETL pipelines to Dataflow.

D. Use Dataproc to migrate your Hadoop clusters to Google Cloud, and Cloud Storage to handle any HDFS use cases. Use Cloud Data Fusion to visually design and deploy your ETL pipelines.

**Answer: B**

**Timestamp: Jan. 3, 2024, 12:43 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130174-exam-professional-data-engineer-topic-1-question-230/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 231 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 231
Topic #: 1

[All Professional Data Engineer Questions]

You recently deployed several data processing jobs into your Cloud Composer 2 environment. You notice that some tasks are failing in Apache Airflow. On the monitoring dashboard, you see an increase in the total workers memory usage, and there were worker pod evictions. You need to resolve these errors. What should you do? (Choose two.) 

A. Increase the directed acyclic graph (DAG) file parsing interval.

B. Increase the Cloud Composer 2 environment size from medium to large.

C. Increase the maximum number of workers and reduce worker concurrency.

D. Increase the memory available to the Airflow workers.

E. Increase the memory available to the Airflow triggerer.

**Answer: C**

**Timestamp: Jan. 4, 2024, 5:09 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130340-exam-professional-data-engineer-topic-1-question-231/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 232 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 232
Topic #: 1

[All Professional Data Engineer Questions]

You are on the data governance team and are implementing security requirements to deploy resources. You need to ensure that resources are limited to only the europe-west3 region. You want to follow Google-recommended practices.What should you do? 

A. Set the constraints/gcp.resourceLocations organization policy constraint to in:europe-west3-locations.

B. Deploy resources with Terraform and implement a variable validation rule to ensure that the region is set to the europe-west3 region for all resources.

C. Set the constraints/gcp.resourceLocations organization policy constraint to in:eu-locations.

D. Create a Cloud Function to monitor all resources created and automatically destroy the ones created outside the europe-west3 region.

**Answer: A**

**Timestamp: Jan. 3, 2024, 12:47 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130175-exam-professional-data-engineer-topic-1-question-232/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 233 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 233
Topic #: 1

[All Professional Data Engineer Questions]

You are a BigQuery admin supporting a team of data consumers who run ad hoc queries and downstream reporting in tools such as Looker. All data and users are combined under a single organizational project. You recently noticed some slowness in query results and want to troubleshoot where the slowdowns are occurring. You think that there might be some job queuing or slot contention occurring as users run jobs, which slows down access to results. You need to investigate the query job information and determine where performance is being affected. What should you do? 

A. Use slot reservations for your project to ensure that you have enough query processing capacity and are able to allocate available slots to the slower queries.

B. Use Cloud Monitoring to view BigQuery metrics and set up alerts that let you know when a certain percentage of slots were used.

C. Use available administrative resource charts to determine how slots are being used and how jobs are performing over time. Run a query on the INFORMATION_SCHEMA to review query performance.

D. Use Cloud Logging to determine if any users or downstream consumers are changing or deleting access grants on tagged resources.

**Answer: C**

**Timestamp: Jan. 3, 2024, 12:52 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130176-exam-professional-data-engineer-topic-1-question-233/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 234 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 234
Topic #: 1

[All Professional Data Engineer Questions]

You migrated a data backend for an application that serves 10 PB of historical product data for analytics. Only the last known state for a product, which is about 10 GB of data, needs to be served through an API to the other applications. You need to choose a cost-effective persistent storage solution that can accommodate the analytics requirements and the API performance of up to 1000 queries per second (QPS) with less than 1 second latency. What should you do? 

A. 1. Store the historical data in BigQuery for analytics.2. Use a materialized view to precompute the last state of a product.3. Serve the last state data directly from BigQuery to the API.

B. 1. Store the products as a collection in Firestore with each product having a set of historical changes.2. Use simple and compound queries for analytics.3. Serve the last state data directly from Firestore to the API.

C. 1. Store the historical data in Cloud SQL for analytics.2. In a separate table, store the last state of the product after every product change.3. Serve the last state data directly from Cloud SQL to the API.

D. 1. Store the historical data in BigQuery for analytics.2. In a Cloud SQL table, store the last state of the product after every product change.3. Serve the last state data directly from Cloud SQL to the API.

**Answer: D**

**Timestamp: Jan. 3, 2024, 12:56 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130177-exam-professional-data-engineer-topic-1-question-234/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 235 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 235
Topic #: 1

[All Professional Data Engineer Questions]

You want to schedule a number of sequential load and transformation jobs. Data files will be added to a Cloud Storage bucket by an upstream process. There is no fixed schedule for when the new data arrives. Next, a Dataproc job is triggered to perform some transformations and write the data to BigQuery. You then need to run additional transformation jobs in BigQuery. The transformation jobs are different for every table. These jobs might take hours to complete. You need to determine the most efficient and maintainable workflow to process hundreds of tables and provide the freshest data to your end users. What should you do? 

A. 1. Create an Apache Airflow directed acyclic graph (DAG) in Cloud Composer with sequential tasks by using the Cloud Storage, Dataproc, and BigQuery operators.2. Use a single shared DAG for all tables that need to go through the pipeline.3. Schedule the DAG to run hourly.

B. 1. Create an Apache Airflow directed acyclic graph (DAG) in Cloud Composer with sequential tasks by using the Cloud Storage, Dataproc, and BigQuery operators.2. Create a separate DAG for each table that needs to go through the pipeline.3. Schedule the DAGs to run hourly.

C. 1. Create an Apache Airflow directed acyclic graph (DAG) in Cloud Composer with sequential tasks by using the Dataproc and BigQuery operators.2. Use a single shared DAG for all tables that need to go through the pipeline.3. Use a Cloud Storage object trigger to launch a Cloud Function that triggers the DAG.

D. 1. Create an Apache Airflow directed acyclic graph (DAG) in Cloud Composer with sequential tasks by using the Dataproc and BigQuery operators.2. Create a separate DAG for each table that needs to go through the pipeline.3. Use a Cloud Storage object trigger to launch a Cloud Function that triggers the DAG.

**Answer: D**

**Timestamp: Jan. 3, 2024, 1:24 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130178-exam-professional-data-engineer-topic-1-question-235/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 236 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 236
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying a MySQL database workload onto Cloud SQL. The database must be able to scale up to support several readers from various geographic regions. The database must be highly available and meet low RTO and RPO requirements, even in the event of a regional outage. You need to ensure that interruptions to the readers are minimal during a database failover. What should you do? 

A. Create a highly available Cloud SQL instance in region Create a highly available read replica in region B. Scale up read workloads by creating cascading read replicas in multiple regions. Backup the Cloud SQL instances to a multi-regional Cloud Storage bucket. Restore the Cloud SQL backup to a new instance in another region when Region A is down.

B. Create a highly available Cloud SQL instance in region A. Scale up read workloads by creating read replicas in multiple regions. Promote one of the read replicas when region A is down.

C. Create a highly available Cloud SQL instance in region A. Create a highly available read replica in region B. Scale up read workloads by creating cascading read replicas in multiple regions. Promote the read replica in region B when region A is down.

D. Create a highly available Cloud SQL instance in region A. Scale up read workloads by creating read replicas in the same region. Failover to the standby Cloud SQL instance when the primary instance fails.

**Answer: C**

**Timestamp: Jan. 3, 2024, 1:41 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130179-exam-professional-data-engineer-topic-1-question-236/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 237 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 237
Topic #: 1

[All Professional Data Engineer Questions]

You are planning to load some of your existing on-premises data into BigQuery on Google Cloud. You want to either stream or batch-load data, depending on your use case. Additionally, you want to mask some sensitive data before loading into BigQuery. You need to do this in a programmatic way while keeping costs to a minimum. What should you do? 

A. Use Cloud Data Fusion to design your pipeline, use the Cloud DLP plug-in to de-identify data within your pipeline, and then move the data into BigQuery.

B. Use the BigQuery Data Transfer Service to schedule your migration. After the data is populated in BigQuery, use the connection to the Cloud Data Loss Prevention (Cloud DLP) API to de-identify the necessary data.

C. Create your pipeline with Dataflow through the Apache Beam SDK for Python, customizing separate options within your code for streaming, batch processing, and Cloud DLP. Select BigQuery as your data sink.

D. Set up Datastream to replicate your on-premise data on BigQuery.

**Answer: C**

**Timestamp: Jan. 3, 2024, 1:42 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130180-exam-professional-data-engineer-topic-1-question-237/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 238 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 238
Topic #: 1

[All Professional Data Engineer Questions]

You want to encrypt the customer data stored in BigQuery. You need to implement per-user crypto-deletion on data stored in your tables. You want to adopt native features in Google Cloud to avoid custom solutions. What should you do? 

A. Implement Authenticated Encryption with Associated Data (AEAD) BigQuery functions while storing your data in BigQuery.

B. Create a customer-managed encryption key (CMEK) in Cloud KMS. Associate the key to the table while creating the table.

C. Create a customer-managed encryption key (CMEK) in Cloud KMS. Use the key to encrypt data before storing in BigQuery.

D. Encrypt your data during ingestion by using a cryptographic library supported by your ETL pipeline.

**Answer: A**

**Timestamp: Jan. 3, 2024, 1:46 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130181-exam-professional-data-engineer-topic-1-question-238/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 239 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 239
Topic #: 1

[All Professional Data Engineer Questions]

The data analyst team at your company uses BigQuery for ad-hoc queries and scheduled SQL pipelines in a Google Cloud project with a slot reservation of 2000 slots. However, with the recent introduction of hundreds of new non time-sensitive SQL pipelines, the team is encountering frequent quota errors. You examine the logs and notice that approximately 1500 queries are being triggered concurrently during peak time. You need to resolve the concurrency issue. What should you do? 

A. Increase the slot capacity of the project with baseline as 0 and maximum reservation size as 3000.

B. Update SQL pipelines to run as a batch query, and run ad-hoc queries as interactive query jobs.

C. Increase the slot capacity of the project with baseline as 2000 and maximum reservation size as 3000.

D. Update SQL pipelines and ad-hoc queries to run as interactive query jobs.

**Answer: B**

**Timestamp: Jan. 3, 2024, 1:55 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130182-exam-professional-data-engineer-topic-1-question-239/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 240 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 240
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a data mesh on Google Cloud by using Dataplex to manage data in BigQuery and Cloud Storage. You want to simplify data asset permissions. You are creating a customer virtual lake with two user groups:• Data engineers, which require full data lake access• Analytic users, which require access to curated dataYou need to assign access rights to these two groups. What should you do? 

A. 1. Grant the dataplex.dataOwner role to the data engineer group on the customer data lake.2. Grant the dataplex.dataReader role to the analytic user group on the customer curated zone.

B. 1. Grant the dataplex.dataReader role to the data engineer group on the customer data lake.2. Grant the dataplex.dataOwner to the analytic user group on the customer curated zone.

C. 1. Grant the bigquery.dataOwner role on BigQuery datasets and the storage.objectCreator role on Cloud Storage buckets to data engineers.2. Grant the bigquery.dataViewer role on BigQuery datasets and the storage.objectViewer role on Cloud Storage buckets to analytic users.

D. 1. Grant the bigquery.dataViewer role on BigQuery datasets and the storage.objectViewer role on Cloud Storage buckets to data engineers.2. Grant the bigquery.dataOwner role on BigQuery datasets and the storage.objectEditor role on Cloud Storage buckets to analytic users.

**Answer: A**

**Timestamp: Jan. 3, 2024, 2:05 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130183-exam-professional-data-engineer-topic-1-question-240/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 241 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 241
Topic #: 1

[All Professional Data Engineer Questions]

You are designing the architecture of your application to store data in Cloud Storage. Your application consists of pipelines that read data from a Cloud Storage bucket that contains raw data, and write the data to a second bucket after processing. You want to design an architecture with Cloud Storage resources that are capable of being resilient if a Google Cloud regional failure occurs. You want to minimize the recovery point objective (RPO) if a failure occurs, with no impact on applications that use the stored data. What should you do? 

A. Adopt multi-regional Cloud Storage buckets in your architecture.

B. Adopt two regional Cloud Storage buckets, and update your application to write the output on both buckets.

C. Adopt a dual-region Cloud Storage bucket, and enable turbo replication in your architecture.

D. Adopt two regional Cloud Storage buckets, and create a daily task to copy from one bucket to the other.

**Answer: C**

**Timestamp: Jan. 3, 2024, 2:06 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130184-exam-professional-data-engineer-topic-1-question-241/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 242 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 242
Topic #: 1

[All Professional Data Engineer Questions]

You have designed an Apache Beam processing pipeline that reads from a Pub/Sub topic. The topic has a message retention duration of one day, and writes to a Cloud Storage bucket. You need to select a bucket location and processing strategy to prevent data loss in case of a regional outage with an RPO of 15 minutes. What should you do? 

A. 1. Use a dual-region Cloud Storage bucket.2. Monitor Dataflow metrics with Cloud Monitoring to determine when an outage occurs.3. Seek the subscription back in time by 15 minutes to recover the acknowledged messages.4. Start the Dataflow job in a secondary region.

B. 1. Use a multi-regional Cloud Storage bucket.2. Monitor Dataflow metrics with Cloud Monitoring to determine when an outage occurs.3. Seek the subscription back in time by 60 minutes to recover the acknowledged messages.4. Start the Dataflow job in a secondary region.

C. 1. Use a regional Cloud Storage bucket.2. Monitor Dataflow metrics with Cloud Monitoring to determine when an outage occurs.3. Seek the subscription back in time by one day to recover the acknowledged messages.4. Start the Dataflow job in a secondary region and write in a bucket in the same region.

D. 1. Use a dual-region Cloud Storage bucket with turbo replication enabled.2. Monitor Dataflow metrics with Cloud Monitoring to determine when an outage occurs.3. Seek the subscription back in time by 60 minutes to recover the acknowledged messages.4. Start the Dataflow job in a secondary region.

**Answer: D**

**Timestamp: Jan. 3, 2024, 2:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130186-exam-professional-data-engineer-topic-1-question-242/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 243 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 243
Topic #: 1

[All Professional Data Engineer Questions]

You are preparing data that your machine learning team will use to train a model using BigQueryML. They want to predict the price per square foot of real estate. The training data has a column for the price and a column for the number of square feet. Another feature column called ‘feature1’ contains null values due to missing data. You want to replace the nulls with zeros to keep more data points. Which query should you use? 

A.

B.

C.

D.

**Answer: C**

**Timestamp: Jan. 4, 2024, 10:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130349-exam-professional-data-engineer-topic-1-question-243/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 244 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 244
Topic #: 1

[All Professional Data Engineer Questions]

Different teams in your organization store customer and performance data in BigQuery. Each team needs to keep full control of their collected data, be able to query data within their projects, and be able to exchange their data with other teams. You need to implement an organization-wide solution, while minimizing operational tasks and costs. What should you do? 

A. Ask each team to create authorized views of their data. Grant the biquery.jobUser role to each team.

B. Create a BigQuery scheduled query to replicate all customer data into team projects.

C. Ask each team to publish their data in Analytics Hub. Direct the other teams to subscribe to them.

D. Enable each team to create materialized views of the data they need to access in their projects.

**Answer: C**

**Timestamp: Dec. 30, 2023, 6:24 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129902-exam-professional-data-engineer-topic-1-question-244/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 245 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 245
Topic #: 1

[All Professional Data Engineer Questions]

You are developing a model to identify the factors that lead to sales conversions for your customers. You have completed processing your data. You want to continue through the model development lifecycle. What should you do next? 

A. Use your model to run predictions on fresh customer input data.

B. Monitor your model performance, and make any adjustments needed.

C. Delineate what data will be used for testing and what will be used for training the model.

D. Test and evaluate your model on your curated data to determine how well the model performs.

**Answer: C**

**Timestamp: Dec. 30, 2023, 6:23 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129901-exam-professional-data-engineer-topic-1-question-245/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 246 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 246
Topic #: 1

[All Professional Data Engineer Questions]

You have one BigQuery dataset which includes customers’ street addresses. You want to retrieve all occurrences of street addresses from the dataset. What should you do? 

A. Write a SQL query in BigQuery by using REGEXP_CONTAINS on all tables in your dataset to find rows where the word “street” appears.

B. Create a deep inspection job on each table in your dataset with Cloud Data Loss Prevention and create an inspection template that includes the STREET_ADDRESS infoType.

C. Create a discovery scan configuration on your organization with Cloud Data Loss Prevention and create an inspection template that includes the STREET_ADDRESS infoType.

D. Create a de-identification job in Cloud Data Loss Prevention and use the masking transformation.

**Answer: B**

**Timestamp: Jan. 3, 2024, 2:26 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130188-exam-professional-data-engineer-topic-1-question-246/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 247 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 247
Topic #: 1

[All Professional Data Engineer Questions]

Your company operates in three domains: airlines, hotels, and ride-hailing services. Each domain has two teams: analytics and data science, which create data assets in BigQuery with the help of a central data platform team. However, as each domain is evolving rapidly, the central data platform team is becoming a bottleneck. This is causing delays in deriving insights from data, and resulting in stale data when pipelines are not kept up to date. You need to design a data mesh architecture by using Dataplex to eliminate the bottleneck. What should you do? 

A. 1. Create one lake for each team. Inside each lake, create one zone for each domain.2. Attach each of the BigQuery datasets created by the individual teams as assets to the respective zone.3. Have the central data platform team manage all zones’ data assets.

B. 1. Create one lake for each team. Inside each lake, create one zone for each domain.2. Attach each of the BigQuery datasets created by the individual teams as assets to the respective zone.3. Direct each domain to manage their own zone’s data assets.

C. 1. Create one lake for each domain. Inside each lake, create one zone for each team.2. Attach each of the BigQuery datasets created by the individual teams as assets to the respective zone.3. Direct each domain to manage their own lake’s data assets.

D. 1. Create one lake for each domain. Inside each lake, create one zone for each team.2. Attach each of the BigQuery datasets created by the individual teams as assets to the respective zone.3. Have the central data platform team manage all lakes’ data assets.

**Answer: C**

**Timestamp: Jan. 3, 2024, 2:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130189-exam-professional-data-engineer-topic-1-question-247/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 248 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 248
Topic #: 1

[All Professional Data Engineer Questions]

dataset.inventory_vm sample records:You have an inventory of VM data stored in the BigQuery table. You want to prepare the data for regular reporting in the most cost-effective way. You need to exclude VM rows with fewer than 8 vCPU in your report. What should you do? 

A. Create a view with a filter to drop rows with fewer than 8 vCPU, and use the UNNEST operator.

B. Create a materialized view with a filter to drop rows with fewer than 8 vCPU, and use the WITH common table expression.

C. Create a view with a filter to drop rows with fewer than 8 vCPU, and use the WITH common table expression.

D. Use Dataflow to batch process and write the result to another BigQuery table.

**Answer: A**

**Timestamp: Jan. 3, 2024, 2:39 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130191-exam-professional-data-engineer-topic-1-question-248/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 249 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 249
Topic #: 1

[All Professional Data Engineer Questions]

Your team is building a data lake platform on Google Cloud. As a part of the data foundation design, you are planning to store all the raw data in Cloud Storage. You are expecting to ingest approximately 25 GB of data a day and your billing department is worried about the increasing cost of storing old data. The current business requirements are:• The old data can be deleted anytime.• There is no predefined access pattern of the old data.• The old data should be available instantly when accessed.• There should not be any charges for data retrieval.What should you do to optimize for cost? 

A. Create the bucket with the Autoclass storage class feature.

B. Create an Object Lifecycle Management policy to modify the storage class for data older than 30 days to nearline, 90 days to coldline, and 365 days to archive storage class. Delete old data as needed.

C. Create an Object Lifecycle Management policy to modify the storage class for data older than 30 days to coldline, 90 days to nearline, and 365 days to archive storage class. Delete old data as needed.

D. Create an Object Lifecycle Management policy to modify the storage class for data older than 30 days to nearline, 45 days to coldline, and 60 days to archive storage class. Delete old data as needed.

**Answer: A**

**Timestamp: Jan. 5, 2024, 12:36 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130353-exam-professional-data-engineer-topic-1-question-249/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 250 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 250
Topic #: 1

[All Professional Data Engineer Questions]

Your company's data platform ingests CSV file dumps of booking and user profile data from upstream sources into Cloud Storage. The data analyst team wants to join these datasets on the email field available in both the datasets to perform analysis. However, personally identifiable information (PII) should not be accessible to the analysts. You need to de-identify the email field in both the datasets before loading them into BigQuery for analysts. What should you do? 

A. 1. Create a pipeline to de-identify the email field by using recordTransformations in Cloud Data Loss Prevention (Cloud DLP) with masking as the de-identification transformations type.2. Load the booking and user profile data into a BigQuery table.

B. 1. Create a pipeline to de-identify the email field by using recordTransformations in Cloud DLP with format-preserving encryption with FFX as the de-identification transformation type.2. Load the booking and user profile data into a BigQuery table.

C. 1. Load the CSV files from Cloud Storage into a BigQuery table, and enable dynamic data masking.2. Create a policy tag with the email mask as the data masking rule.3. Assign the policy to the email field in both tables. A4. Assign the Identity and Access Management bigquerydatapolicy.maskedReader role for the BigQuery tables to the analysts.

D. 1. Load the CSV files from Cloud Storage into a BigQuery table, and enable dynamic data masking.2. Create a policy tag with the default masking value as the data masking rule.3. Assign the policy to the email field in both tables.4. Assign the Identity and Access Management bigquerydatapolicy.maskedReader role for the BigQuery tables to the analysts

**Answer: B**

**Timestamp: Jan. 3, 2024, 3:35 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130198-exam-professional-data-engineer-topic-1-question-250/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 251 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 251
Topic #: 1

[All Professional Data Engineer Questions]

You have important legal hold documents in a Cloud Storage bucket. You need to ensure that these documents are not deleted or modified. What should you do? 

A. Set a retention policy. Lock the retention policy.

B. Set a retention policy. Set the default storage class to Archive for long-term digital preservation.

C. Enable the Object Versioning feature. Add a lifecycle rule.

D. Enable the Object Versioning feature. Create a copy in a bucket in a different region.

**Answer: A**

**Timestamp: Jan. 3, 2024, 4:16 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130202-exam-professional-data-engineer-topic-1-question-251/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 252 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 252
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a data warehouse in BigQuery to analyze sales data for a telecommunication service provider. You need to create a data model for customers, products, and subscriptions. All customers, products, and subscriptions can be updated monthly, but you must maintain a historical record of all data. You plan to use the visualization layer for current and historical reporting. You need to ensure that the data model is simple, easy-to-use, and cost-effective. What should you do? 

A. Create a normalized model with tables for each entity. Use snapshots before updates to track historical data.

B. Create a normalized model with tables for each entity. Keep all input files in a Cloud Storage bucket to track historical data.

C. Create a denormalized model with nested and repeated fields. Update the table and use snapshots to track historical data.

D. Create a denormalized, append-only model with nested and repeated fields. Use the ingestion timestamp to track historical data.

**Answer: D**

**Timestamp: Jan. 3, 2024, 4:20 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130203-exam-professional-data-engineer-topic-1-question-252/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 253 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 253
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying a batch pipeline in Dataflow. This pipeline reads data from Cloud Storage, transforms the data, and then writes the data into BigQuery. The security team has enabled an organizational constraint in Google Cloud, requiring all Compute Engine instances to use only internal IP addresses and no external IP addresses. What should you do? 

A. Ensure that your workers have network tags to access Cloud Storage and BigQuery. Use Dataflow with only internal IP addresses.

B. Ensure that the firewall rules allow access to Cloud Storage and BigQuery. Use Dataflow with only internal IPs.

C. Create a VPC Service Controls perimeter that contains the VPC network and add Dataflow, Cloud Storage, and BigQuery as allowed services in the perimeter. Use Dataflow with only internal IP addresses.

D. Ensure that Private Google Access is enabled in the subnetwork. Use Dataflow with only internal IP addresses.

**Answer: D**

**Timestamp: Jan. 3, 2024, 4:27 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130204-exam-professional-data-engineer-topic-1-question-253/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 254 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 254
Topic #: 1

[All Professional Data Engineer Questions]

You are running a Dataflow streaming pipeline, with Streaming Engine and Horizontal Autoscaling enabled. You have set the maximum number of workers to 1000. The input of your pipeline is Pub/Sub messages with notifications from Cloud Storage. One of the pipeline transforms reads CSV files and emits an element for every CSV line. The job performance is low, the pipeline is using only 10 workers, and you notice that the autoscaler is not spinning up additional workers. What should you do to improve performance? 

A. Enable Vertical Autoscaling to let the pipeline use larger workers.

B. Change the pipeline code, and introduce a Reshuffle step to prevent fusion.

C. Update the job to increase the maximum number of workers.

D. Use Dataflow Prime, and enable Right Fitting to increase the worker resources.

**Answer: B**

**Timestamp: Jan. 3, 2024, 4:34 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130205-exam-professional-data-engineer-topic-1-question-254/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 255 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 255
Topic #: 1

[All Professional Data Engineer Questions]

You have an Oracle database deployed in a VM as part of a Virtual Private Cloud (VPC) network. You want to replicate and continuously synchronize 50 tables to BigQuery. You want to minimize the need to manage infrastructure. What should you do? 

A. Deploy Apache Kafka in the same VPC network, use Kafka Connect Oracle Change Data Capture (CDC), and Dataflow to stream the Kafka topic to BigQuery.

B. Create a Pub/Sub subscription to write to BigQuery directly. Deploy the Debezium Oracle connector to capture changes in the Oracle database, and sink to the Pub/Sub topic.

C. Deploy Apache Kafka in the same VPC network, use Kafka Connect Oracle change data capture (CDC), and the Kafka Connect Google BigQuery Sink Connector.

D. Create a Datastream service from Oracle to BigQuery, use a private connectivity configuration to the same VPC network, and a connection profile to BigQuery.

**Answer: D**

**Timestamp: Jan. 3, 2024, 4:38 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130206-exam-professional-data-engineer-topic-1-question-255/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 256 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 256
Topic #: 1

[All Professional Data Engineer Questions]

You are deploying an Apache Airflow directed acyclic graph (DAG) in a Cloud Composer 2 instance. You have incoming files in a Cloud Storage bucket that the DAG processes, one file at a time. The Cloud Composer instance is deployed in a subnetwork with no Internet access. Instead of running the DAG based on a schedule, you want to run the DAG in a reactive way every time a new file is received. What should you do? 

A. 1. Enable Private Google Access in the subnetwork, and set up Cloud Storage notifications to a Pub/Sub topic.2. Create a push subscription that points to the web server URL.

B. 1. Enable the Cloud Composer API, and set up Cloud Storage notifications to trigger a Cloud Function.2. Write a Cloud Function instance to call the DAG by using the Cloud Composer API and the web server URL.3. Use VPC Serverless Access to reach the web server URL.

C. 1. Enable the Airflow REST API, and set up Cloud Storage notifications to trigger a Cloud Function instance.2. Create a Private Service Connect (PSC) endpoint.3. Write a Cloud Function that connects to the Cloud Composer cluster through the PSC endpoint.

D. 1. Enable the Airflow REST API, and set up Cloud Storage notifications to trigger a Cloud Function instance.2. Write a Cloud Function instance to call the DAG by using the Airflow REST API and the web server URL.3. Use VPC Serverless Access to reach the web server URL.

**Answer: C**

**Timestamp: Jan. 3, 2024, 4:56 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130209-exam-professional-data-engineer-topic-1-question-256/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 257 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 257
Topic #: 1

[All Professional Data Engineer Questions]

You are planning to use Cloud Storage as part of your data lake solution. The Cloud Storage bucket will contain objects ingested from external systems. Each object will be ingested once, and the access patterns of individual objects will be random. You want to minimize the cost of storing and retrieving these objects. You want to ensure that any cost optimization efforts are transparent to the users and applications. What should you do? 

A. Create a Cloud Storage bucket with Autoclass enabled.

B. Create a Cloud Storage bucket with an Object Lifecycle Management policy to transition objects from Standard to Coldline storage class if an object age reaches 30 days.

C. Create a Cloud Storage bucket with an Object Lifecycle Management policy to transition objects from Standard to Coldline storage class if an object is not live.

D. Create two Cloud Storage buckets. Use the Standard storage class for the first bucket, and use the Coldline storage class for the second bucket. Migrate objects from the first bucket to the second bucket after 30 days.

**Answer: A**

**Timestamp: Jan. 3, 2024, 5:09 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130210-exam-professional-data-engineer-topic-1-question-257/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 258 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 258
Topic #: 1

[All Professional Data Engineer Questions]

You have several different file type data sources, such as Apache Parquet and CSV. You want to store the data in Cloud Storage. You need to set up an object sink for your data that allows you to use your own encryption keys. You want to use a GUI-based solution. What should you do? 

A. Use Storage Transfer Service to move files into Cloud Storage.

B. Use Cloud Data Fusion to move files into Cloud Storage.

C. Use Dataflow to move files into Cloud Storage.

D. Use BigQuery Data Transfer Service to move files into BigQuery.

**Answer: B**

**Timestamp: Jan. 3, 2024, 5:12 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130211-exam-professional-data-engineer-topic-1-question-258/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 259 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 259
Topic #: 1

[All Professional Data Engineer Questions]

Your business users need a way to clean and prepare data before using the data for analysis. Your business users are less technically savvy and prefer to work with graphical user interfaces to define their transformations. After the data has been transformed, the business users want to perform their analysis directly in a spreadsheet. You need to recommend a solution that they can use. What should you do? 

A. Use Dataprep to clean the data, and write the results to BigQuery. Analyze the data by using Connected Sheets.

B. Use Dataprep to clean the data, and write the results to BigQuery. Analyze the data by using Looker Studio.

C. Use Dataflow to clean the data, and write the results to BigQuery. Analyze the data by using Connected Sheets.

D. Use Dataflow to clean the data, and write the results to BigQuery. Analyze the data by using Looker Studio.

**Answer: A**

**Timestamp: Jan. 3, 2024, 5:26 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130212-exam-professional-data-engineer-topic-1-question-259/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 260 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 260
Topic #: 1

[All Professional Data Engineer Questions]

You have two projects where you run BigQuery jobs:• One project runs production jobs that have strict completion time SLAs. These are high priority jobs that must have the required compute resources available when needed. These jobs generally never go below a 300 slot utilization, but occasionally spike up an additional 500 slots.• The other project is for users to run ad-hoc analytical queries. This project generally never uses more than 200 slots at a time. You want these ad-hoc queries to be billed based on how much data users scan rather than by slot capacity.You need to ensure that both projects have the appropriate compute resources available. What should you do? 

A. Create a single Enterprise Edition reservation for both projects. Set a baseline of 300 slots. Enable autoscaling up to 700 slots.

B. Create two reservations, one for each of the projects. For the SLA project, use an Enterprise Edition with a baseline of 300 slots and enable autoscaling up to 500 slots. For the ad-hoc project, configure on-demand billing.

C. Create two Enterprise Edition reservations, one for each of the projects. For the SLA project, set a baseline of 300 slots and enable autoscaling up to 500 slots. For the ad-hoc project, set a reservation baseline of 0 slots and set the ignore idle slots flag to False.

D. Create two Enterprise Edition reservations, one for each of the projects. For the SLA project, set a baseline of 800 slots. For the ad-hoc project, enable autoscaling up to 200 slots.

**Answer: B**

**Timestamp: Jan. 3, 2024, 5:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130213-exam-professional-data-engineer-topic-1-question-260/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 261 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 261
Topic #: 1

[All Professional Data Engineer Questions]

You want to migrate your existing Teradata data warehouse to BigQuery. You want to move the historical data to BigQuery by using the most efficient method that requires the least amount of programming, but local storage space on your existing data warehouse is limited. What should you do? 

A. Use BigQuery Data Transfer Service by using the Java Database Connectivity (JDBC) driver with FastExport connection.

B. Create a Teradata Parallel Transporter (TPT) export script to export the historical data, and import to BigQuery by using the bq command-line tool.

C. Use BigQuery Data Transfer Service with the Teradata Parallel Transporter (TPT) tbuild utility.

D. Create a script to export the historical data, and upload in batches to Cloud Storage. Set up a BigQuery Data Transfer Service instance from Cloud Storage to BigQuery.

**Answer: A**

**Timestamp: Dec. 30, 2023, 7:32 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129906-exam-professional-data-engineer-topic-1-question-261/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 262 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 262
Topic #: 1

[All Professional Data Engineer Questions]

You are on the data governance team and are implementing security requirements. You need to encrypt all your data in BigQuery by using an encryption key managed by your team. You must implement a mechanism to generate and store encryption material only on your on-premises hardware security module (HSM). You want to rely on Google managed solutions. What should you do? 

A. Create the encryption key in the on-premises HSM, and import it into a Cloud Key Management Service (Cloud KMS) key. Associate the created Cloud KMS key while creating the BigQuery resources.

B. Create the encryption key in the on-premises HSM and link it to a Cloud External Key Manager (Cloud EKM) key. Associate the created Cloud KMS key while creating the BigQuery resources.

C. Create the encryption key in the on-premises HSM, and import it into Cloud Key Management Service (Cloud HSM) key. Associate the created Cloud HSM key while creating the BigQuery resources.

D. Create the encryption key in the on-premises HSM. Create BigQuery resources and encrypt data while ingesting them into BigQuery.

**Answer: B**

**Timestamp: Jan. 3, 2024, 5:44 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130214-exam-professional-data-engineer-topic-1-question-262/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 263 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 263
Topic #: 1

[All Professional Data Engineer Questions]

You maintain ETL pipelines. You notice that a streaming pipeline running on Dataflow is taking a long time to process incoming data, which causes output delays. You also noticed that the pipeline graph was automatically optimized by Dataflow and merged into one step. You want to identify where the potential bottleneck is occurring. What should you do? 

A. Insert a Reshuffle operation after each processing step, and monitor the execution details in the Dataflow console.

B. Insert output sinks after each key processing step, and observe the writing throughput of each block.

C. Log debug information in each ParDo function, and analyze the logs at execution time.

D. Verify that the Dataflow service accounts have appropriate permissions to write the processed data to the output sinks.

**Answer: A**

**Timestamp: Jan. 3, 2024, 6:09 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130215-exam-professional-data-engineer-topic-1-question-263/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 264 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 264
Topic #: 1

[All Professional Data Engineer Questions]

You are running your BigQuery project in the on-demand billing model and are executing a change data capture (CDC) process that ingests data. The CDC process loads 1 GB of data every 10 minutes into a temporary table, and then performs a merge into a 10 TB target table. This process is very scan intensive and you want to explore options to enable a predictable cost model. You need to create a BigQuery reservation based on utilization information gathered from BigQuery Monitoring and apply the reservation to the CDC process. What should you do? 

A. Create a BigQuery reservation for the dataset.

B. Create a BigQuery reservation for the job.

C. Create a BigQuery reservation for the service account running the job.

D. Create a BigQuery reservation for the project.

**Answer: D**

**Timestamp: Jan. 5, 2024, 2:59 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130360-exam-professional-data-engineer-topic-1-question-264/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 265 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 265
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a fault-tolerant architecture to store data in a regional BigQuery dataset. You need to ensure that your application is able to recover from a corruption event in your tables that occurred within the past seven days. You want to adopt managed services with the lowest RPO and most cost-effective solution. What should you do? 

A. Access historical data by using time travel in BigQuery.

B. Export the data from BigQuery into a new table that excludes the corrupted data

C. Create a BigQuery table snapshot on a daily basis.

D. Migrate your data to multi-region BigQuery buckets.

**Answer: A**

**Timestamp: Jan. 5, 2024, 3 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130361-exam-professional-data-engineer-topic-1-question-265/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 266 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 266
Topic #: 1

[All Professional Data Engineer Questions]

You are building a streaming Dataflow pipeline that ingests noise level data from hundreds of sensors placed near construction sites across a city. The sensors measure noise level every ten seconds, and send that data to the pipeline when levels reach above 70 dBA. You need to detect the average noise level from a sensor when data is received for a duration of more than 30 minutes, but the window ends when no data has been received for 15 minutes. What should you do? 

A. Use session windows with a 15-minute gap duration.

B. Use session windows with a 30-minute gap duration.

C. Use hopping windows with a 15-minute window, and a thirty-minute period.

D. Use tumbling windows with a 15-minute window and a fifteen-minute .withAllowedLateness operator.

**Answer: A**

**Timestamp: Jan. 3, 2024, 6:23 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130217-exam-professional-data-engineer-topic-1-question-266/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 267 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 267
Topic #: 1

[All Professional Data Engineer Questions]

You are creating a data model in BigQuery that will hold retail transaction data. Your two largest tables, sales_transaction_header and sales_transaction_line, have a tightly coupled immutable relationship. These tables are rarely modified after load and are frequently joined when queried. You need to model the sales_transaction_header and sales_transaction_line tables to improve the performance of data analytics queries. What should you do? 

A. Create a sales_transaction table that holds the sales_transaction_header information as rows and the sales_transaction_line rows as nested and repeated fields.

B. Create a sales_transaction table that holds the sales_transaction_header and sales_transaction_line information as rows, duplicating the sales_transaction_header data for each line.

C. Create a sales_transaction table that stores the sales_transaction_header and sales_transaction_line data as a JSON data type.

D. Create separate sales_transaction_header and sales_transaction_line tables and, when querying, specify the sales_transaction_line first in the WHERE clause.

**Answer: A**

**Timestamp: Jan. 3, 2024, 6:27 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130218-exam-professional-data-engineer-topic-1-question-267/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 268 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 268
Topic #: 1

[All Professional Data Engineer Questions]

You created a new version of a Dataflow streaming data ingestion pipeline that reads from Pub/Sub and writes to BigQuery. The previous version of the pipeline that runs in production uses a 5-minute window for processing. You need to deploy the new version of the pipeline without losing any data, creating inconsistencies, or increasing the processing latency by more than 10 minutes. What should you do? 

A. Update the old pipeline with the new pipeline code.

B. Snapshot the old pipeline, stop the old pipeline, and then start the new pipeline from the snapshot.

C. Drain the old pipeline, then start the new pipeline.

D. Cancel the old pipeline, then start the new pipeline.

**Answer: C**

**Timestamp: Jan. 3, 2024, 6:31 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130219-exam-professional-data-engineer-topic-1-question-268/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 269 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 269
Topic #: 1

[All Professional Data Engineer Questions]

Your organization's data assets are stored in BigQuery, Pub/Sub, and a PostgreSQL instance running on Compute Engine. Because there are multiple domains and diverse teams using the data, teams in your organization are unable to discover existing data assets. You need to design a solution to improve data discoverability while keeping development and configuration efforts to a minimum. What should you do? 

A. Use Data Catalog to automatically catalog BigQuery datasets. Use Data Catalog APIs to manually catalog Pub/Sub topics and PostgreSQL tables.

B. Use Data Catalog to automatically catalog BigQuery datasets and Pub/Sub topics. Use Data Catalog APIs to manually catalog PostgreSQL tables.

C. Use Data Catalog to automatically catalog BigQuery datasets and Pub/Sub topics. Use custom connectors to manually catalog PostgreSQL tables.

D. Use customer connectors to manually catalog BigQuery datasets, Pub/Sub topics, and PostgreSQL tables.

**Answer: B**

**Timestamp: Jan. 5, 2024, 6:08 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130424-exam-professional-data-engineer-topic-1-question-269/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 270 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 270
Topic #: 1

[All Professional Data Engineer Questions]

You need to create a SQL pipeline. The pipeline runs an aggregate SQL transformation on a BigQuery table every two hours and appends the result to another existing BigQuery table. You need to configure the pipeline to retry if errors occur. You want the pipeline to send an email notification after three consecutive failures. What should you do? 

A. Use the BigQueryUpsertTableOperator in Cloud Composer, set the retry parameter to three, and set the email_on_failure parameter to true.

B. Use the BigQueryInsertJobOperator in Cloud Composer, set the retry parameter to three, and set the email_on_failure parameter to true.

C. Create a BigQuery scheduled query to run the SQL transformation with schedule options that repeats every two hours, and enable email notifications.

D. Create a BigQuery scheduled query to run the SQL transformation with schedule options that repeats every two hours, and enable notification to Pub/Sub topic. Use Pub/Sub and Cloud Functions to send an email after three failed executions.

**Answer: D**

**Timestamp: Jan. 3, 2024, 6:43 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130220-exam-professional-data-engineer-topic-1-question-270/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 271 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 271
Topic #: 1

[All Professional Data Engineer Questions]

You are monitoring your organization’s data lake hosted on BigQuery. The ingestion pipelines read data from Pub/Sub and write the data into tables on BigQuery. After a new version of the ingestion pipelines is deployed, the daily stored data increased by 50%. The volumes of data in Pub/Sub remained the same and only some tables had their daily partition data size doubled. You need to investigate and fix the cause of the data increase. What should you do? 

A. 1. Check for duplicate rows in the BigQuery tables that have the daily partition data size doubled.2. Schedule daily SQL jobs to deduplicate the affected tables.3. Share the deduplication script with the other operational teams to reuse if this occurs to other tables.

B. 1. Check for code errors in the deployed pipelines.2. Check for multiple writing to pipeline BigQuery sink.3. Check for errors in Cloud Logging during the day of the release of the new pipelines.4. If no errors, restore the BigQuery tables to their content before the last release by using time travel.

C. 1. Check for duplicate rows in the BigQuery tables that have the daily partition data size doubled.2. Check the BigQuery Audit logs to find job IDs.3. Use Cloud Monitoring to determine when the identified Dataflow jobs started and the pipeline code version.4. When more than one pipeline ingests data into a table, stop all versions except the latest one.

D. 1. Roll back the last deployment.2. Restore the BigQuery tables to their content before the last release by using time travel.3. Restart the Dataflow jobs and replay the messages by seeking the subscription to the timestamp of the release.

**Answer: C**

**Timestamp: Jan. 5, 2024, 6:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130427-exam-professional-data-engineer-topic-1-question-271/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 272 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 272
Topic #: 1

[All Professional Data Engineer Questions]

You have a BigQuery dataset named “customers”. All tables will be tagged by using a Data Catalog tag template named “gdpr”. The template contains one mandatory field, “has_sensitive_data”, with a boolean value. All employees must be able to do a simple search and find tables in the dataset that have either true or false in the “has_sensitive_data’ field. However, only the Human Resources (HR) group should be able to see the data inside the tables for which “has_sensitive data” is true. You give the all employees group the bigquery.metadataViewer and bigquery.connectionUser roles on the dataset. You want to minimize configuration overhead. What should you do next? 

A. Create the “gdpr” tag template with private visibility. Assign the bigquery.dataViewer role to the HR group on the tables that contain sensitive data.

B. Create the “gdpr” tag template with private visibility. Assign the datacatalog.tagTemplateViewer role on this tag to the all employees group, and assign the bigquery.dataViewer role to the HR group on the tables that contain sensitive data.

C. Create the “gdpr” tag template with public visibility. Assign the bigquery.dataViewer role to the HR group on the tables that contain sensitive data.

D. Create the “gdpr” tag template with public visibility. Assign the datacatalog.tagTemplateViewer role on this tag to the all employees group, and assign the bigquery.dataViewer role to the HR group on the tables that contain sensitive data.

**Answer: C**

**Timestamp: Jan. 3, 2024, 6:55 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130221-exam-professional-data-engineer-topic-1-question-272/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 273 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 273
Topic #: 1

[All Professional Data Engineer Questions]

You are creating the CI/CD cycle for the code of the directed acyclic graphs (DAGs) running in Cloud Composer. Your team has two Cloud Composer instances: one instance for development and another instance for production. Your team is using a Git repository to maintain and develop the code of the DAGs. You want to deploy the DAGs automatically to Cloud Composer when a certain tag is pushed to the Git repository. What should you do? 

A. 1. Use Cloud Build to copy the code of the DAG to the Cloud Storage bucket of the development instance for DAG testing.2. If the tests pass, use Cloud Build to copy the code to the bucket of the production instance.

B. 1. Use Cloud Build to build a container with the code of the DAG and the KubernetesPodOperator to deploy the code to the Google Kubernetes Engine (GKE) cluster of the development instance for testing.2. If the tests pass, use the KubernetesPodOperator to deploy the container to the GKE cluster of the production instance.

C. 1. Use Cloud Build to build a container and the KubernetesPodOperator to deploy the code of the DAG to the Google Kubernetes Engine (GKE) cluster of the development instance for testing.2. If the tests pass, copy the code to the Cloud Storage bucket of the production instance.

D. 1. Use Cloud Build to copy the code of the DAG to the Cloud Storage bucket of the development instance for DAG testing.2. If the tests pass, use Cloud Build to build a container with the code of the DAG and the KubernetesPodOperator to deploy the container to the Google Kubernetes Engine (GKE) cluster of the production instance.

**Answer: A**

**Timestamp: Jan. 7, 2024, 5:11 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130514-exam-professional-data-engineer-topic-1-question-273/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 274 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 274
Topic #: 1

[All Professional Data Engineer Questions]

You have a BigQuery table that ingests data directly from a Pub/Sub subscription. The ingested data is encrypted with a Google-managed encryption key. You need to meet a new organization policy that requires you to use keys from a centralized Cloud Key Management Service (Cloud KMS) project to encrypt data at rest. What should you do? 

A. Use Cloud KMS encryption key with Dataflow to ingest the existing Pub/Sub subscription to the existing BigQuery table.

B. Create a new BigQuery table by using customer-managed encryption keys (CMEK), and migrate the data from the old BigQuery table.

C. Create a new Pub/Sub topic with CMEK and use the existing BigQuery table by using Google-managed encryption key.

D. Create a new BigQuery table and Pub/Sub topic by using customer-managed encryption keys (CMEK), and migrate the data from the old BigQuery table.

**Answer: B**

**Timestamp: Jan. 7, 2024, 5:14 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130515-exam-professional-data-engineer-topic-1-question-274/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 275 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 275
Topic #: 1

[All Professional Data Engineer Questions]

You created an analytics environment on Google Cloud so that your data scientist team can explore data without impacting the on-premises Apache Hadoop solution. The data in the on-premises Hadoop Distributed File System (HDFS) cluster is in Optimized Row Columnar (ORC) formatted files with multiple columns of Hive partitioning. The data scientist team needs to be able to explore the data in a similar way as they used the on-premises HDFS cluster with SQL on the Hive query engine. You need to choose the most cost-effective storage and processing solution. What should you do? 

A. Import the ORC files to Bigtable tables for the data scientist team.

B. Import the ORC files to BigQuery tables for the data scientist team.

C. Copy the ORC files on Cloud Storage, then deploy a Dataproc cluster for the data scientist team.

D. Copy the ORC files on Cloud Storage, then create external BigQuery tables for the data scientist team.

**Answer: D**

**Timestamp: Jan. 7, 2024, 5:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130517-exam-professional-data-engineer-topic-1-question-275/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 276 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 276
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a Dataflow pipeline for a batch processing job. You want to mitigate multiple zonal failures at job submission time. What should you do? 

A. Submit duplicate pipelines in two different zones by using the --zone flag.

B. Set the pipeline staging location as a regional Cloud Storage bucket.

C. Specify a worker region by using the --region flag.

D. Create an Eventarc trigger to resubmit the job in case of zonal failure when submitting the job.

**Answer: C**

**Timestamp: Jan. 3, 2024, 7:21 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130223-exam-professional-data-engineer-topic-1-question-276/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 277 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 277
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a real-time system for a ride hailing app that identifies areas with high demand for rides to effectively reroute available drivers to meet the demand. The system ingests data from multiple sources to Pub/Sub, processes the data, and stores the results for visualization and analysis in real-time dashboards. The data sources include driver location updates every 5 seconds and app-based booking events from riders. The data processing involves real-time aggregation of supply and demand data for the last 30 seconds, every 2 seconds, and storing the results in a low-latency system for visualization. What should you do? 

A. Group the data by using a tumbling window in a Dataflow pipeline, and write the aggregated data to Memorystore.

B. Group the data by using a hopping window in a Dataflow pipeline, and write the aggregated data to Memorystore.

C. Group the data by using a session window in a Dataflow pipeline, and write the aggregated data to BigQuery.

D. Group the data by using a hopping window in a Dataflow pipeline, and write the aggregated data to BigQuery.

**Answer: B**

**Timestamp: Jan. 4, 2024, 5:14 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130262-exam-professional-data-engineer-topic-1-question-277/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 278 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 278
Topic #: 1

[All Professional Data Engineer Questions]

Your car factory is pushing machine measurements as messages into a Pub/Sub topic in your Google Cloud project. A Dataflow streaming job, that you wrote with the Apache Beam SDK, reads these messages, sends acknowledgment to Pub/Sub, applies some custom business logic in a DoFn instance, and writes the result to BigQuery. You want to ensure that if your business logic fails on a message, the message will be sent to a Pub/Sub topic that you want to monitor for alerting purposes. What should you do? 

A. Enable retaining of acknowledged messages in your Pub/Sub pull subscription. Use Cloud Monitoring to monitor the subscription/num_retained_acked_messages metric on this subscription.

B. Use an exception handling block in your Dataflow’s DoFn code to push the messages that failed to be transformed through a side output and to a new Pub/Sub topic. Use Cloud Monitoring to monitor the topic/num_unacked_messages_by_region metric on this new topic.

C. Enable dead lettering in your Pub/Sub pull subscription, and specify a new Pub/Sub topic as the dead letter topic. Use Cloud Monitoring to monitor the subscription/dead_letter_message_count metric on your pull subscription.

D. Create a snapshot of your Pub/Sub pull subscription. Use Cloud Monitoring to monitor the snapshot/num_messages metric on this snapshot.

**Answer: B**

**Timestamp: Jan. 4, 2024, 5:24 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130263-exam-professional-data-engineer-topic-1-question-278/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 279 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 279
Topic #: 1

[All Professional Data Engineer Questions]

You want to store your team’s shared tables in a single dataset to make data easily accessible to various analysts. You want to make this data readable but unmodifiable by analysts. At the same time, you want to provide the analysts with individual workspaces in the same project, where they can create and store tables for their own use, without the tables being accessible by other analysts. What should you do? 

A. Give analysts the BigQuery Data Viewer role at the project level. Create one other dataset, and give the analysts the BigQuery Data Editor role on that dataset.

B. Give analysts the BigQuery Data Viewer role at the project level. Create a dataset for each analyst, and give each analyst the BigQuery Data Editor role at the project level.

C. Give analysts the BigQuery Data Viewer role on the shared dataset. Create a dataset for each analyst, and give each analyst the BigQuery Data Editor role at the dataset level for their assigned dataset.

D. Give analysts the BigQuery Data Viewer role on the shared dataset. Create one other dataset and give the analysts the BigQuery Data Editor role on that dataset.

**Answer: C**

**Timestamp: Jan. 4, 2024, 5:26 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130264-exam-professional-data-engineer-topic-1-question-279/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 281 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 281
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large ecommerce company. You store your customer's order data in Bigtable. You have a garbage collection policy set to delete the data after 30 days and the number of versions is set to 1. When the data analysts run a query to report total customer spending, the analysts sometimes see customer data that is older than 30 days. You need to ensure that the analysts do not see customer data older than 30 days while minimizing cost and overhead. What should you do? 

A. Set the expiring values of the column families to 29 days and keep the number of versions to 1.

B. Use a timestamp range filter in the query to fetch the customer's data for a specific range.

C. Schedule a job daily to scan the data in the table and delete data older than 30 days.

D. Set the expiring values of the column families to 30 days and set the number of versions to 2.

**Answer: B**

**Timestamp: Jan. 4, 2024, 6:28 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130269-exam-professional-data-engineer-topic-1-question-281/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 282 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 282
Topic #: 1

[All Professional Data Engineer Questions]

You are using a Dataflow streaming job to read messages from a message bus that does not support exactly-once delivery. Your job then applies some transformations, and loads the result into BigQuery. You want to ensure that your data is being streamed into BigQuery with exactly-once delivery semantics. You expect your ingestion throughput into BigQuery to be about 1.5 GB per second. What should you do? 

A. Use the BigQuery Storage Write API and ensure that your target BigQuery table is regional.

B. Use the BigQuery Storage Write API and ensure that your target BigQuery table is multiregional.

C. Use the BigQuery Streaming API and ensure that your target BigQuery table is regional.

D. Use the BigQuery Streaming API and ensure that your target BigQuery table is multiregional.

**Answer: B**

**Timestamp: Jan. 3, 2024, 3:06 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130157-exam-professional-data-engineer-topic-1-question-282/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 283 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 283
Topic #: 1

[All Professional Data Engineer Questions]

You have created an external table for Apache Hive partitioned data that resides in a Cloud Storage bucket, which contains a large number of files. You notice that queries against this table are slow. You want to improve the performance of these queries. What should you do? 

A. Change the storage class of the Hive partitioned data objects from Coldline to Standard.

B. Create an individual external table for each Hive partition by using a common table name prefix. Use wildcard table queries to reference the partitioned data.

C. Upgrade the external table to a BigLake table. Enable metadata caching for the table.

D. Migrate the Hive partitioned data objects to a multi-region Cloud Storage bucket.

**Answer: C**

**Timestamp: Jan. 7, 2024, 4:17 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130510-exam-professional-data-engineer-topic-1-question-283/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 284 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 284
Topic #: 1

[All Professional Data Engineer Questions]

You have a network of 1000 sensors. The sensors generate time series data: one metric per sensor per second, along with a timestamp. You already have 1 TB of data, and expect the data to grow by 1 GB every day. You need to access this data in two ways. The first access pattern requires retrieving the metric from one specific sensor stored at a specific timestamp, with a median single-digit millisecond latency. The second access pattern requires running complex analytic queries on the data, including joins, once a day. How should you store this data? 

A. Store your data in BigQuery. Concatenate the sensor ID and timestamp, and use it as the primary key.

B. Store your data in Bigtable. Concatenate the sensor ID and timestamp and use it as the row key. Perform an export to BigQuery every day.

C. Store your data in Bigtable. Concatenate the sensor ID and metric, and use it as the row key. Perform an export to BigQuery every day.

D. Store your data in BigQuery. Use the metric as a primary key.

**Answer: B**

**Timestamp: Jan. 4, 2024, 7:37 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130273-exam-professional-data-engineer-topic-1-question-284/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 285 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 285
Topic #: 1

[All Professional Data Engineer Questions]

You have 100 GB of data stored in a BigQuery table. This data is outdated and will only be accessed one or two times a year for analytics with SQL. For backup purposes, you want to store this data to be immutable for 3 years. You want to minimize storage costs. What should you do? 

A. 1. Create a BigQuery table clone.2. Query the clone when you need to perform analytics.

B. 1. Create a BigQuery table snapshot.2. Restore the snapshot when you need to perform analytics.

C. 1. Perform a BigQuery export to a Cloud Storage bucket with archive storage class.2. Enable versioning on the bucket.3. Create a BigQuery external table on the exported files.

D. 1. Perform a BigQuery export to a Cloud Storage bucket with archive storage class.2. Set a locked retention policy on the bucket.3. Create a BigQuery external table on the exported files.

**Answer: D**

**Timestamp: Jan. 7, 2024, 4:26 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130511-exam-professional-data-engineer-topic-1-question-285/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 286 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 286
Topic #: 1

[All Professional Data Engineer Questions]

You have thousands of Apache Spark jobs running in your on-premises Apache Hadoop cluster. You want to migrate the jobs to Google Cloud. You want to use managed services to run your jobs instead of maintaining a long-lived Hadoop cluster yourself. You have a tight timeline and want to keep code changes to a minimum. What should you do? 

A. Move your data to BigQuery. Convert your Spark scripts to a SQL-based processing approach.

B. Rewrite your jobs in Apache Beam. Run your jobs in Dataflow.

C. Copy your data to Compute Engine disks. Manage and run your jobs directly on those instances.

D. Move your data to Cloud Storage. Run your jobs on Dataproc.

**Answer: D**

**Timestamp: Jan. 4, 2024, 10:41 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130287-exam-professional-data-engineer-topic-1-question-286/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 287 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 287
Topic #: 1

[All Professional Data Engineer Questions]

You are administering shared BigQuery datasets that contain views used by multiple teams in your organization. The marketing team is concerned about the variability of their monthly BigQuery analytics spend using the on-demand billing model. You need to help the marketing team establish a consistent BigQuery analytics spend each month. What should you do? 

A. Create a BigQuery Enterprise reservation with a baseline of 250 slots and autoscaling set to 500 for the marketing team, and bill them back accordingly.

B. Establish a BigQuery quota for the marketing team, and limit the maximum number of bytes scanned each day.

C. Create a BigQuery reservation with a baseline of 500 slots with no autoscaling for the marketing team, and bill them back accordingly.

D. Create a BigQuery Standard pay-as-you go reservation with a baseline of 0 slots and autoscaling set to 500 for the marketing team, and bill them back accordingly.

**Answer: C**

**Timestamp: Jan. 4, 2024, 11:08 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130289-exam-professional-data-engineer-topic-1-question-287/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 288 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 288
Topic #: 1

[All Professional Data Engineer Questions]

You are part of a healthcare organization where data is organized and managed by respective data owners in various storage services. As a result of this decentralized ecosystem, discovering and managing data has become difficult. You need to quickly identify and implement a cost-optimized solution to assist your organization with the following:• Data management and discovery• Data lineage tracking• Data quality validationHow should you build the solution? 

A. Use BigLake to convert the current solution into a data lake architecture.

B. Build a new data discovery tool on Google Kubernetes Engine that helps with new source onboarding and data lineage tracking.

C. Use BigQuery to track data lineage, and use Dataprep to manage data and perform data quality validation.

D. Use Dataplex to manage data, track data lineage, and perform data quality validation.

**Answer: D**

**Timestamp: Jan. 4, 2024, 11:10 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130291-exam-professional-data-engineer-topic-1-question-288/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 289 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 289
Topic #: 1

[All Professional Data Engineer Questions]

You have data located in BigQuery that is used to generate reports for your company. You have noticed some weekly executive report fields do not correspond to format according to company standards. For example, report errors include different telephone formats and different country code identifiers. This is a frequent issue, so you need to create a recurring job to normalize the data. You want a quick solution that requires no coding. What should you do? 

A. Use Cloud Data Fusion and Wrangler to normalize the data, and set up a recurring job.

B. Use Dataflow SQL to create a job that normalizes the data, and that after the first run of the job, schedule the pipeline to execute recurrently.

C. Create a Spark job and submit it to Dataproc Serverless.

D. Use BigQuery and GoogleSQL to normalize the data, and schedule recurring queries in BigQuery.

**Answer: A**

**Timestamp: Jan. 4, 2024, 11:12 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130292-exam-professional-data-engineer-topic-1-question-289/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 290 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 290
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a messaging system by using Pub/Sub to process clickstream data with an event-driven consumer app that relies on a push subscription. You need to configure the messaging system that is reliable enough to handle temporary downtime of the consumer app. You also need the messaging system to store the input messages that cannot be consumed by the subscriber. The system needs to retry failed messages gradually, avoiding overloading the consumer app, and store the failed messages after a maximum of 10 retries in a topic. How should you configure the Pub/Sub subscription? 

A. Increase the acknowledgement deadline to 10 minutes.

B. Use immediate redelivery as the subscription retry policy, and configure dead lettering to a different topic with maximum delivery attempts set to 10.

C. Use exponential backoff as the subscription retry policy, and configure dead lettering to the same source topic with maximum delivery attempts set to 10.

D. Use exponential backoff as the subscription retry policy, and configure dead lettering to a different topic with maximum delivery attempts set to 10.

**Answer: D**

**Timestamp: Jan. 4, 2024, 11:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130293-exam-professional-data-engineer-topic-1-question-290/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 291 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 291
Topic #: 1

[All Professional Data Engineer Questions]

You designed a data warehouse in BigQuery to analyze sales data. You want a self-serving, low-maintenance, and cost- effective solution to share the sales dataset to other business units in your organization. What should you do? 

A. Create an Analytics Hub private exchange, and publish the sales dataset.

B. Enable the other business units’ projects to access the authorized views of the sales dataset.

C. Create and share views with the users in the other business units.

D. Use the BigQuery Data Transfer Service to create a schedule that copies the sales dataset to the other business units’ projects.

**Answer: A**

**Timestamp: Jan. 4, 2024, 11:22 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130296-exam-professional-data-engineer-topic-1-question-291/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 292 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 292
Topic #: 1

[All Professional Data Engineer Questions]

You have terabytes of customer behavioral data streaming from Google Analytics into BigQuery daily. Your customers’ information, such as their preferences, is hosted on a Cloud SQL for MySQL database. Your CRM database is hosted on a Cloud SQL for PostgreSQL instance. The marketing team wants to use your customers’ information from the two databases and the customer behavioral data to create marketing campaigns for yearly active customers. You need to ensure that the marketing team can run the campaigns over 100 times a day on typical days and up to 300 during sales. At the same time, you want to keep the load on the Cloud SQL databases to a minimum. What should you do? 

A. Create BigQuery connections to both Cloud SQL databases. Use BigQuery federated queries on the two databases and the Google Analytics data on BigQuery to run these queries.

B. Create a job on Apache Spark with Dataproc Serverless to query both Cloud SQL databases and the Google Analytics data on BigQuery for these queries.

C. Create streams in Datastream to replicate the required tables from both Cloud SQL databases to BigQuery for these queries.

D. Create a Dataproc cluster with Trino to establish connections to both Cloud SQL databases and BigQuery, to execute the queries.

**Answer: C**

**Timestamp: Jan. 4, 2024, 11:33 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130298-exam-professional-data-engineer-topic-1-question-292/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 293 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 293
Topic #: 1

[All Professional Data Engineer Questions]

Your organization is modernizing their IT services and migrating to Google Cloud. You need to organize the data that will be stored in Cloud Storage and BigQuery. You need to enable a data mesh approach to share the data between sales, product design, and marketing departments. What should you do? 

A. 1. Create a project for storage of the data for each of your departments.2. Enable each department to create Cloud Storage buckets and BigQuery datasets.3. Create user groups for authorized readers for each bucket and dataset.4. Enable the IT team to administer the user groups to add or remove users as the departments’ request.

B. 1. Create multiple projects for storage of the data for each of your departments’ applications.2. Enable each department to create Cloud Storage buckets and BigQuery datasets.3. Publish the data that each department shared in Analytics Hub.4. Enable all departments to discover and subscribe to the data they need in Analytics Hub.

C. 1. Create a project for storage of the data for your organization.2. Create a central Cloud Storage bucket with three folders to store the files for each department.3. Create a central BigQuery dataset with tables prefixed with the department name.4. Give viewer rights for the storage project for the users of your departments.

D. 1. Create multiple projects for storage of the data for each of your departments’ applications.2. Enable each department to create Cloud Storage buckets and BigQuery datasets.3. In Dataplex, map each department to a data lake and the Cloud Storage buckets, and map the BigQuery datasets to zones.4. Enable each department to own and share the data of their data lakes.

**Answer: D**

**Timestamp: Jan. 4, 2024, 11:37 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130301-exam-professional-data-engineer-topic-1-question-293/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 294 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 294
Topic #: 1

[All Professional Data Engineer Questions]

You work for a large ecommerce company. You are using Pub/Sub to ingest the clickstream data to Google Cloud for analytics. You observe that when a new subscriber connects to an existing topic to analyze data, they are unable to subscribe to older data. For an upcoming yearly sale event in two months, you need a solution that, once implemented, will enable any new subscriber to read the last 30 days of data. What should you do? 

A. Create a new topic, and publish the last 30 days of data each time a new subscriber connects to an existing topic.

B. Set the topic retention policy to 30 days.

C. Set the subscriber retention policy to 30 days.

D. Ask the source system to re-push the data to Pub/Sub, and subscribe to it.

**Answer: B**

**Timestamp: Jan. 4, 2024, 11:45 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130307-exam-professional-data-engineer-topic-1-question-294/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 295 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 295
Topic #: 1

[All Professional Data Engineer Questions]

You are designing the architecture to process your data from Cloud Storage to BigQuery by using Dataflow. The network team provided you with the Shared VPC network and subnetwork to be used by your pipelines. You need to enable the deployment of the pipeline on the Shared VPC network. What should you do? 

A. Assign the compute.networkUser role to the Dataflow service agent.

B. Assign the compute.networkUser role to the service account that executes the Dataflow pipeline.

C. Assign the dataflow.admin role to the Dataflow service agent.

D. Assign the dataflow.admin role to the service account that executes the Dataflow pipeline.

**Answer: B**

**Timestamp: Jan. 4, 2024, 11:50 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130309-exam-professional-data-engineer-topic-1-question-295/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 296 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 296
Topic #: 1

[All Professional Data Engineer Questions]

Your infrastructure team has set up an interconnect link between Google Cloud and the on-premises network. You are designing a high-throughput streaming pipeline to ingest data in streaming from an Apache Kafka cluster hosted on- premises. You want to store the data in BigQuery, with as minimal latency as possible. What should you do? 

A. Setup a Kafka Connect bridge between Kafka and Pub/Sub. Use a Google-provided Dataflow template to read the data from Pub/Sub, and write the data to BigQuery.

B. Use a proxy host in the VPC in Google Cloud connecting to Kafka. Write a Dataflow pipeline, read data from the proxy host, and write the data to BigQuery.

C. Use Dataflow, write a pipeline that reads the data from Kafka, and writes the data to BigQuery.

D. Setup a Kafka Connect bridge between Kafka and Pub/Sub. Write a Dataflow pipeline, read the data from Pub/Sub, and write the data to BigQuery.

**Answer: C**

**Timestamp: Dec. 30, 2023, 9:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129909-exam-professional-data-engineer-topic-1-question-296/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 297 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 297
Topic #: 1

[All Professional Data Engineer Questions]

You migrated your on-premises Apache Hadoop Distributed File System (HDFS) data lake to Cloud Storage. The data scientist team needs to process the data by using Apache Spark and SQL. Security policies need to be enforced at the column level. You need a cost-effective solution that can scale into a data mesh. What should you do? 

A. 1. Deploy a long-living Dataproc cluster with Apache Hive and Ranger enabled.2. Configure Ranger for column level security.3. Process with Dataproc Spark or Hive SQL.

B. 1. Define a BigLake table.2. Create a taxonomy of policy tags in Data Catalog.3. Add policy tags to columns.4. Process with the Spark-BigQuery connector or BigQuery SQL.

C. 1. Load the data to BigQuery tables.2. Create a taxonomy of policy tags in Data Catalog.3. Add policy tags to columns.4. Process with the Spark-BigQuery connector or BigQuery SQL.

D. 1. Apply an Identity and Access Management (IAM) policy at the file level in Cloud Storage.2. Define a BigQuery external table for SQL processing.3. Use Dataproc Spark to process the Cloud Storage files.

**Answer: B**

**Timestamp: Jan. 4, 2024, 12:15 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130313-exam-professional-data-engineer-topic-1-question-297/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 298 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 298
Topic #: 1

[All Professional Data Engineer Questions]

One of your encryption keys stored in Cloud Key Management Service (Cloud KMS) was exposed. You need to re- encrypt all of your CMEK-protected Cloud Storage data that used that key, and then delete the compromised key. You also want to reduce the risk of objects getting written without customer-managed encryption key (CMEK) protection in the future. What should you do? 

A. Rotate the Cloud KMS key version. Continue to use the same Cloud Storage bucket.

B. Create a new Cloud KMS key. Set the default CMEK key on the existing Cloud Storage bucket to the new one.

C. Create a new Cloud KMS key. Create a new Cloud Storage bucket. Copy all objects from the old bucket to the new one bucket while specifying the new Cloud KMS key in the copy command.

D. Create a new Cloud KMS key. Create a new Cloud Storage bucket configured to use the new key as the default CMEK key. Copy all objects from the old bucket to the new bucket without specifying a key.

**Answer: D**

**Timestamp: Dec. 30, 2023, 9:18 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129911-exam-professional-data-engineer-topic-1-question-298/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 299 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 299
Topic #: 1

[All Professional Data Engineer Questions]

You have an upstream process that writes data to Cloud Storage. This data is then read by an Apache Spark job that runs on Dataproc. These jobs are run in the us-central1 region, but the data could be stored anywhere in the United States. You need to have a recovery process in place in case of a catastrophic single region failure. You need an approach with a maximum of 15 minutes of data loss (RPO=15 mins). You want to ensure that there is minimal latency when reading the data. What should you do? 

A. 1. Create two regional Cloud Storage buckets, one in the us-central1 region and one in the us-south1 region.2. Have the upstream process write data to the us-central1 bucket. Use the Storage Transfer Service to copy data hourly from the us-central1 bucket to the us-south1 bucket.3. Run the Dataproc cluster in a zone in the us-central1 region, reading from the bucket in that region.4. In case of regional failure, redeploy your Dataproc clusters to the us-south1 region and read from the bucket in that region instead.

B. 1. Create a Cloud Storage bucket in the US multi-region.2. Run the Dataproc cluster in a zone in the us-central1 region, reading data from the US multi-region bucket.3. In case of a regional failure, redeploy the Dataproc cluster to the us-central2 region and continue reading from the same bucket.

C. 1. Create a dual-region Cloud Storage bucket in the us-central1 and us-south1 regions.2. Enable turbo replication.3. Run the Dataproc cluster in a zone in the us-central1 region, reading from the bucket in the us-south1 region.4. In case of a regional failure, redeploy your Dataproc cluster to the us-south1 region and continue reading from the same bucket.

D. 1. Create a dual-region Cloud Storage bucket in the us-central1 and us-south1 regions.2. Enable turbo replication.3. Run the Dataproc cluster in a zone in the us-central1 region, reading from the bucket in the same region.4. In case of a regional failure, redeploy the Dataproc clusters to the us-south1 region and read from the same bucket.

**Answer: D**

**Timestamp: Jan. 4, 2024, 2:34 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130328-exam-professional-data-engineer-topic-1-question-299/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 300 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 300
Topic #: 1

[All Professional Data Engineer Questions]

You currently have transactional data stored on-premises in a PostgreSQL database. To modernize your data environment, you want to run transactional workloads and support analytics needs with a single database. You need to move to Google Cloud without changing database management systems, and minimize cost and complexity. What should you do? 

A. Migrate and modernize your database with Cloud Spanner.

B. Migrate your workloads to AlloyDB for PostgreSQL.

C. Migrate to BigQuery to optimize analytics.

D. Migrate your PostgreSQL database to Cloud SQL for PostgreSQL.

**Answer: B**

**Timestamp: Jan. 4, 2024, 12:51 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130318-exam-professional-data-engineer-topic-1-question-300/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 301 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 301
Topic #: 1

[All Professional Data Engineer Questions]

You are architecting a data transformation solution for BigQuery. Your developers are proficient with SQL and want to use the ELT development technique. In addition, your developers need an intuitive coding environment and the ability to manage SQL as code. You need to identify a solution for your developers to build these pipelines. What should you do? 

A. Use Dataform to build, manage, and schedule SQL pipelines.

B. Use Dataflow jobs to read data from Pub/Sub, transform the data, and load the data to BigQuery.

C. Use Data Fusion to build and execute ETL pipelines.

D. Use Cloud Composer to load data and run SQL pipelines by using the BigQuery job operators.

**Answer: A**

**Timestamp: Dec. 30, 2023, 9:51 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129913-exam-professional-data-engineer-topic-1-question-301/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 302 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 302
Topic #: 1

[All Professional Data Engineer Questions]

You work for a farming company. You have one BigQuery table named sensors, which is about 500 MB and contains the list of your 5000 sensors, with columns for id, name, and location. This table is updated every hour. Each sensor generates one metric every 30 seconds along with a timestamp, which you want to store in BigQuery. You want to run an analytical query on the data once a week for monitoring purposes. You also want to minimize costs. What data model should you use? 

A. 1. Create a metrics column in the sensors table.2. Set RECORD type and REPEATED mode for the metrics column.3. Use an UPDATE statement every 30 seconds to add new metrics.

B. 1. Create a metrics column in the sensors table.2. Set RECORD type and REPEATED mode for the metrics column.3. Use an INSERT statement every 30 seconds to add new metrics.

C. 1. Create a metrics table partitioned by timestamp.2. Create a sensorId column in the metrics table, that points to the id column in the sensors table.3. Use an INSERT statement every 30 seconds to append new metrics to the metrics table.4. Join the two tables, if needed, when running the analytical query.

D. 1. Create a metrics table partitioned by timestamp.2. Create a sensorId column in the metrics table, which points to the id column in the sensors table.3. Use an UPDATE statement every 30 seconds to append new metrics to the metrics table.4. Join the two tables, if needed, when running the analytical query.

**Answer: C**

**Timestamp: Jan. 4, 2024, 1:54 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130327-exam-professional-data-engineer-topic-1-question-302/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 303 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 303
Topic #: 1

[All Professional Data Engineer Questions]

You are managing a Dataplex environment with raw and curated zones. A data engineering team is uploading JSON and CSV files to a bucket asset in the curated zone but the files are not being automatically discovered by Dataplex. What should you do to ensure that the files are discovered by Dataplex? 

A. Move the JSON and CSV files to the raw zone.

B. Enable auto-discovery of files for the curated zone.

C. Use the bg command-line tool to load the JSON and CSV files into BigQuery tables.

D. Grant object level access to the CSV and JSON files in Cloud Storage.

**Answer: A**

**Timestamp: Jan. 4, 2024, 1:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130326-exam-professional-data-engineer-topic-1-question-303/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 304 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 304
Topic #: 1

[All Professional Data Engineer Questions]

You have a table that contains millions of rows of sales data, partitioned by date. Various applications and users query this data many times a minute. The query requires aggregating values by using AVG, MAX, and SUM, and does not require joining to other tables. The required aggregations are only computed over the past year of data, though you need to retain full historical data in the base tables. You want to ensure that the query results always include the latest data from the tables, while also reducing computation cost, maintenance overhead, and duration. What should you do? 

A. Create a materialized view to aggregate the base table data. Include a filter clause to specify the last one year of partitions.

B. Create a materialized view to aggregate the base table data. Configure a partition expiration on the base table to retain only the last one year of partitions.

C. Create a view to aggregate the base table data. Include a filter clause to specify the last year of partitions.

D. Create a new table that aggregates the base table data. Include a filter clause to specify the last year of partitions. Set up a scheduled query to recreate the new table every hour.

**Answer: A**

**Timestamp: Jan. 4, 2024, 1:41 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130325-exam-professional-data-engineer-topic-1-question-304/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 305 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 305
Topic #: 1

[All Professional Data Engineer Questions]

Your organization uses a multi-cloud data storage strategy, storing data in Cloud Storage, and data in Amazon Web Services’ (AWS) S3 storage buckets. All data resides in US regions. You want to query up-to-date data by using BigQuery, regardless of which cloud the data is stored in. You need to allow users to query the tables from BigQuery without giving direct access to the data in the storage buckets. What should you do? 

A. Setup a BigQuery Omni connection to the AWS S3 bucket data. Create BigLake tables over the Cloud Storage and S3 data and query the data using BigQuery directly.

B. Set up a BigQuery Omni connection to the AWS S3 bucket data. Create external tables over the Cloud Storage and S3 data and query the data using BigQuery directly.

C. Use the Storage Transfer Service to copy data from the AWS S3 buckets to Cloud Storage buckets. Create BigLake tables over the Cloud Storage data and query the data using BigQuery directly.

D. Use the Storage Transfer Service to copy data from the AWS S3 buckets to Cloud Storage buckets. Create external tables over the Cloud Storage data and query the data using BigQuery directly.

**Answer: A**

**Timestamp: Dec. 30, 2023, 10:03 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/129916-exam-professional-data-engineer-topic-1-question-305/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 306 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 306
Topic #: 1

[All Professional Data Engineer Questions]

You are preparing an organization-wide dataset. You need to preprocess customer data stored in a restricted bucket in Cloud Storage. The data will be used to create consumer analyses. You need to comply with data privacy requirements.What should you do? 

A. Use Dataflow and the Cloud Data Loss Prevention API to mask sensitive data. Write the processed data in BigQuery.

B. Use customer-managed encryption keys (CMEK) to directly encrypt the data in Cloud Storage. Use federated queries from BigQuery. Share the encryption key by following the principle of least privilege.

C. Use the Cloud Data Loss Prevention API and Dataflow to detect and remove sensitive fields from the data in Cloud Storage. Write the filtered data in BigQuery.

D. Use Dataflow and Cloud KMS to encrypt sensitive fields and write the encrypted data in BigQuery. Share the encryption key by following the principle of least privilege.

**Answer: A**

**Timestamp: Jan. 4, 2024, 1:21 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130321-exam-professional-data-engineer-topic-1-question-306/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 307 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 307
Topic #: 1

[All Professional Data Engineer Questions]

You need to connect multiple applications with dynamic public IP addresses to a Cloud SQL instance. You configured users with strong passwords and enforced the SSL connection to your Cloud SQL instance. You want to use Cloud SQL public IP and ensure that you have secured connections. What should you do? 

A. Add CIDR 0.0.0.0/0 network to Authorized Network. Use Identity and Access Management (IAM) to add users.

B. Add all application networks to Authorized Network and regularly update them.

C. Leave the Authorized Network empty. Use Cloud SQL Auth proxy on all applications.

D. Add CIDR 0.0.0.0/0 network to Authorized Network. Use Cloud SQL Auth proxy on all applications.

**Answer: C**

**Timestamp: Jan. 4, 2024, 1:13 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130320-exam-professional-data-engineer-topic-1-question-307/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 308 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 308
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating a large number of files from a public HTTPS endpoint to Cloud Storage. The files are protected from unauthorized access using signed URLs. You created a TSV file that contains the list of object URLs and started a transfer job by using Storage Transfer Service. You notice that the job has run for a long time and eventually failed. Checking the logs of the transfer job reveals that the job was running fine until one point, and then it failed due to HTTP 403 errors on the remaining files. You verified that there were no changes to the source system. You need to fix the problem to resume the migration process. What should you do? 

A. Set up Cloud Storage FUSE, and mount the Cloud Storage bucket on a Compute Engine instance. Remove the completed files from the TSV file. Use a shell script to iterate through the TSV file and download the remaining URLs to the FUSE mount point.

B. Renew the TLS certificate of the HTTPS endpoint. Remove the completed files from the TSV file and rerun the Storage Transfer Service job.

C. Create a new TSV file for the remaining files by generating signed URLs with a longer validity period. Split the TSV file into multiple smaller files and submit them as separate Storage Transfer Service jobs in parallel.

D. Update the file checksums in the TSV file from using MD5 to SHA256. Remove the completed files from the TSV file and rerun the Storage Transfer Service job.

**Answer: C**

**Timestamp: Jan. 4, 2024, 1:05 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/130319-exam-professional-data-engineer-topic-1-question-308/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 309 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 309
Topic #: 1

[All Professional Data Engineer Questions]

You work for an airline and you need to store weather data in a BigQuery table. Weather data will be used as input to a machine learning model. The model only uses the last 30 days of weather data. You want to avoid storing unnecessary data and minimize costs. What should you do? 

A. Create a BigQuery table where each record has an ingestion timestamp. Run a scheduled query to delete all the rows with an ingestion timestamp older than 30 days.

B. Create a BigQuery table partitioned by datetime value of the weather date. Set up partition expiration to 30 days.

C. Create a BigQuery table partitioned by ingestion time. Set up partition expiration to 30 days.

D. Create a BigQuery table with a datetime column for the day the weather data refers to. Run a scheduled query to delete rows with a datetime value older than 30 days.

**Answer: B**

**Timestamp: Jan. 26, 2024, 12:30 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/132182-exam-professional-data-engineer-topic-1-question-309/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 310 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 310
Topic #: 1

[All Professional Data Engineer Questions]

You need to look at BigQuery data from a specific table multiple times a day. The underlying table you are querying is several petabytes in size, but you want to filter your data and provide simple aggregations to downstream users. You want to run queries faster and get up-to-date insights quicker. What should you do? 

A. Run a scheduled query to pull the necessary data at specific intervals dally.

B. Use a cached query to accelerate time to results.

C. Limit the query columns being pulled in the final result.

D. Create a materialized view based off of the query being run.

**Answer: D**

**Timestamp: Jan. 26, 2024, 12:53 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/132186-exam-professional-data-engineer-topic-1-question-310/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 311 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 311
Topic #: 1

[All Professional Data Engineer Questions]

Your chemical company needs to manually check documentation for customer order. You use a pull subscription in Pub/Sub so that sales agents get details from the order. You must ensure that you do not process orders twice with different sales agents and that you do not add more complexity to this workflow. What should you do? 

A. Use a Deduplicate PTransform in Dataflow before sending the messages to the sales agents.

B. Create a transactional database that monitors the pending messages.

C. Use Pub/Sub exactly-once delivery in your pull subscription.

D. Create a new Pub/Sub push subscription to monitor the orders processed in the agent's system.

**Answer: C**

**Timestamp: Jan. 26, 2024, 5:50 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/132198-exam-professional-data-engineer-topic-1-question-311/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 312 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 312
Topic #: 1

[All Professional Data Engineer Questions]

You are migrating your on-premises data warehouse to BigQuery. As part of the migration, you want to facilitate cross-team collaboration to get the most value out of the organization’s data. You need to design an architecture that would allow teams within the organization to securely publish, discover, and subscribe to read-only data in a self-service manner. You need to minimize costs while also maximizing data freshness. What should you do? 

A. Use Analytics Hub to facilitate data sharing.

B. Create authorized datasets to publish shared data in the subscribing team's project.

C. Create a new dataset for sharing in each individual team’s project. Grant the subscribing team the bigquery.dataViewer role on the dataset.

D. Use BigQuery Data Transfer Service to copy datasets to a centralized BigQuery project for sharing.

**Answer: A**

**Timestamp: Dec. 16, 2024, 3:30 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/153019-exam-professional-data-engineer-topic-1-question-312/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 313 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 313
Topic #: 1

[All Professional Data Engineer Questions]

You want to migrate an Apache Spark 3 batch job from on-premises to Google Cloud. You need to minimally change the job so that the job reads from Cloud Storage and writes the result to BigQuery. Your job is optimized for Spark, where each executor has 8 vCPU and 16 GB memory, and you want to be able to choose similar settings. You want to minimize installation and management effort to run your job. What should you do? 

A. Execute the job as part of a deployment in a new Google Kubernetes Engine cluster.

B. Execute the job from a new Compute Engine VM.

C. Execute the job in a new Dataproc cluster.

D. Execute as a Dataproc Serverless job.

**Answer: D**

**Timestamp: Dec. 7, 2024, 2:45 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/152659-exam-professional-data-engineer-topic-1-question-313/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 314 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 314
Topic #: 1

[All Professional Data Engineer Questions]

You are configuring networking for a Dataflow job. The data pipeline uses custom container images with the libraries that are required for the transformation logic preinstalled. The data pipeline reads the data from Cloud Storage and writes the data to BigQuery. You need to ensure cost-effective and secure communication between the pipeline and Google APIs and services. What should you do? 

A. Disable external IP addresses from worker VMs and enable Private Google Access.

B. Leave external IP addresses assigned to worker VMs while enforcing firewall rules.

C. Disable external IP addresses and establish a Private Service Connect endpoint IP address.

D. Enable Cloud NAT to provide outbound internet connectivity while enforcing firewall rules.

**Answer: A**

**Timestamp: Dec. 24, 2024, 8:29 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/153398-exam-professional-data-engineer-topic-1-question-314/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 315 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 315
Topic #: 1

[All Professional Data Engineer Questions]

You are using Workflows to call an API that returns a 1KB JSON response, apply some complex business logic on this response, wait for the logic to complete, and then perform a load from a Cloud Storage file to BigQuery. The Workflows standard library does not have sufficient capabilities to perform your complex logic, and you want to use Python's standard library instead. You want to optimize your workflow for simplicity and speed of execution. What should you do? 

A. Create a Cloud Composer environment and run the logic in Cloud Composer.

B. Create a Dataproc cluster, and use PySpark to apply the logic on your JSON file.

C. Invoke a Cloud Function instance that uses Python to apply the logic on your JSON file.

D. Invoke a subworkflow in Workflows to apply the logic on your JSON file.

**Answer: C**

**Timestamp: Dec. 16, 2024, 3:39 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/153020-exam-professional-data-engineer-topic-1-question-315/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 316 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 316
Topic #: 1

[All Professional Data Engineer Questions]

You are administering a BigQuery on-demand environment. Your business intelligence tool is submitting hundreds of queries each day that aggregate a large (50 TB) sales history fact table at the day and month levels. These queries have a slow response time and are exceeding cost expectations. You need to decrease response time, lower query costs, and minimize maintenance. What should you do? 

A. Build authorized views on top of the sales table to aggregate data at the day and month level.

B. Enable BI Engine and add your sales table as a preferred table.

C. Build materialized views on top of the sales table to aggregate data at the day and month level.

D. Create a scheduled query to build sales day and sales month aggregate tables on an hourly basis.

**Answer: C**

**Timestamp: Dec. 19, 2024, 12:12 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/153174-exam-professional-data-engineer-topic-1-question-316/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 317 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 317
Topic #: 1

[All Professional Data Engineer Questions]

You have several different unstructured data sources, within your on-premises data center as well as in the cloud. The data is in various formats, such as Apache Parquet and CSV. You want to centralize this data in Cloud Storage. You need to set up an object sink for your data that allows you to use your own encryption keys. You want to use a GUI-based solution. What should you do? 

A. Use BigQuery Data Transfer Service to move files into BigQuery.

B. Use Storage Transfer Service to move files into Cloud Storage

C. Use Dataflow to move files into Cloud Storage

D. Use Cloud Data Fusion to move files into Cloud Storage.

**Answer: D**

**Timestamp: Dec. 14, 2024, 2:24 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/152975-exam-professional-data-engineer-topic-1-question-317/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 318 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 318
Topic #: 1

[All Professional Data Engineer Questions]

You are using BigQuery with a regional dataset that includes a table with the daily sales volumes. This table is updated multiple times per day. You need to protect your sales table in case of regional failures with a recovery point objective (RPO) of less than 24 hours, while keeping costs to a minimum. What should you do? 

A. Schedule a daily export of the table to a Cloud Storage dual or multi-region bucket.

B. Schedule a daily copy of the dataset to a backup region.

C. Schedule a daily BigQuery snapshot of the table.

D. Modify ETL job to load the data into both the current and another backup region.

**Answer: A**

**Timestamp: Dec. 4, 2024, 5:57 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/152516-exam-professional-data-engineer-topic-1-question-318/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 319 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 319
Topic #: 1

[All Professional Data Engineer Questions]

You are preparing an organization-wide dataset. You need to preprocess customer data stored in a restricted bucket in Cloud Storage. The data will be used to create consumer analyses. You need to follow data privacy requirements, including protecting certain sensitive data elements, while also retaining all of the data for potential future use cases. What should you do? 

A. Use the Cloud Data Loss Prevention API and Dataflow to detect and remove sensitive fields from the data in Cloud Storage. Write the filtered data in BigQuery.

B. Use customer-managed encryption keys (CMEK) to directly encrypt the data in Cloud Storage. Use federated queries from BigQuery. Share the encryption key by following the principle of least privilege.

C. Use Dataflow and the Cloud Data Loss Prevention API to mask sensitive data. Write the processed data in BigQuery.

D. Use Dataflow and Cloud KMS to encrypt sensitive fields and write the encrypted data in BigQuery. Share the encryption key by following the principle of least privilege.

**Answer: C**

**Timestamp: Dec. 4, 2024, 5:49 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/152515-exam-professional-data-engineer-topic-1-question-319/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 320 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 320
Topic #: 1

[All Professional Data Engineer Questions]

Your company uses Looker Studio connected to BigQuery for reporting. Users are experiencing slow dashboard load times due to complex queries on a large table. The queries involve aggregations and filtering on several columns. You need to optimize query performance to decrease the dashboard load times. What should you do? 

A. Configure Looker Studio to use a shorter data refresh interval to ensure fresh data is always displayed.

B. Create a materialized view in BigQuery that pre-calculates the aggregations and filters used in the Looker Studio dashboards.

C. Implement row-level security in BigQuery to restrict data access and reduce the amount of data processed by the queries.

D. Use BigQuery BI Engine to accelerate query performance by caching frequently accessed data.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382512-exam-professional-data-engineer-topic-1-question-320/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 322 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 322
Topic #: 1

[All Professional Data Engineer Questions]

Your company is planning to migrate a large on-premises data warehouse to BigQuery. The data is currently stored in a proprietary, vendor-specific format. You need to perform a batch migration of this data to BigQuery. What should you do? 

A. Use the bq command-line tool to load the data directly from the on-premises data warehouse.

B. Export the data to CSV files, upload the files to Cloud Storage, then load the files into BigQuery.

C. Use the BigQuery Data Transfer Service.

D. Use Datastream to replicate the data in real time.

**Answer: C**

**Timestamp: Jan. 16, 2026, 8:16 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382521-exam-professional-data-engineer-topic-1-question-322/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 327 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 327
Topic #: 1

[All Professional Data Engineer Questions]

Your company wants to implement a Retrieval-Augmented Generation (RAG) system to allow employees to query an extensive knowledge base of internal documents, such as policy manuals and project reports. You need to prepare this unstructured text for embedding to be used in the RAG system. What should you do to ensure the system can retrieve the most relevant information? 

A. Use Cloud Data Loss Prevention (Cloud DLP) to scan and redact sensitive information within the documents before processing.

B. Store the documents as compressed files in a traditional relational database to enable more efficient storage and retrieval.

C. Convert the unstructured documents into high-dimensional numerical vectors that capture the semantic meaning and relationships of the text.

D. Index each word from the documents into a search engine to enable keyword-based search.

**Answer: C**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382511-exam-professional-data-engineer-topic-1-question-327/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 328 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 328
Topic #: 1

[All Professional Data Engineer Questions]

You need to load a dataset with multiple terabytes of clickstream data into BigQuery. The data arrives each day as compressed JSON files in a Cloud Storage bucket. You need a low-cost, programmatic, and scalable solution to load the data into BigQuery. What should you do? 

A. Create an external table in BigQuery pointing to the Cloud Storage bucket and run the INSERT INTO ... SELECT * FROM external_table command.

B. Use the BigQuery Data Transfer Service from Cloud Storage.

C. Create a Cloud Run function to run a Python script to read and parse each JSON file, and use the BigQuery streaming insert API.

D. Use Cloud Data Fusion to create a pipeline to load the JSON files into BigQuery.

**Answer: B**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382506-exam-professional-data-engineer-topic-1-question-328/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 329 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 329
Topic #: 1

[All Professional Data Engineer Questions]

Your Cloud Storage data lake has raw, processed, and historical data in different buckets. Data older than two years is rarely accessed, and all data must be retained for no longer than seven years. You are concerned about rising storage costs. How should you control costs for the historical data bucket? 

A. Write a script on a Compute Engine instance, triggered daily by Cloud Scheduler, to scan all objects and delete any older than seven years.

B. Configure an Object Lifecycle Management rule to transition objects older than two years to the Archive storage class and eventually delete them after seven years.

C. Enable the Autoclass feature on your Cloud Storage buckets and select Opt-in to object transitions to Coldline and Archive storage classes.

D. Replicate the buckets to a different region with lower storage costs and configure an Object Lifecycle Management rule to delete objects after seven years.

**Answer: B**

**Timestamp: Jan. 16, 2026, 8:16 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382515-exam-professional-data-engineer-topic-1-question-329/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 330 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 330
Topic #: 1

[All Professional Data Engineer Questions]

Your data science team needs to perform interactive SQL queries on large datasets stored in Apache Parquet format within a Cloud Storage bucket. The team is familiar with Apache Hive and wants to leverage existing HiveQL queries. You need to provide an environment for the team to run their interactive HiveQL queries directly against the data in Cloud Storage. You want to keep operational overhead to a minimum. What should you do? 

A. Install and configure an Apache Hadoop and Hive cluster manually on a group of Compute Engine instances.

B. Load the Parquet data into a BigQuery native table and use the BigQuery Connector for Hive to run the queries.

C. Configure BigQuery with an external table definition pointing to the Parquet files.

D. Deploy a Dataproc cluster with Hive services enabled.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382509-exam-professional-data-engineer-topic-1-question-330/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 331 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 331
Topic #: 1

[All Professional Data Engineer Questions]

You analyze user clickstream data to personalize content recommendations. The data arrives continuously and needs to be processed with low latency, including transformations such as sessionization (grouping clicks by user within a time window) and aggregation of user activity. You need to identify a scalable solution to handle millions of events each second and be resilient to late-arriving data. What should you do? 

A. Use Firebase Realtime Database for ingestion and storage, and Cloud Run functions for processing and analytics.

B. Use Cloud Data Fusion for ingestion and transformation, and Cloud SQL for storage and analytics.

C. Use Pub/Sub for ingestion, Dataflow with Apache Beam for processing, and BigQuery for storage and analytics.

D. Use Cloud Storage for ingestion, Dataproc with Apache Spark for batch processing, and BigQuery for storage and analytics.

**Answer: C**

**Timestamp: Jan. 16, 2026, 8:16 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382516-exam-professional-data-engineer-topic-1-question-331/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 332 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 332
Topic #: 1

[All Professional Data Engineer Questions]

You are designing BigQuery tables for large volumes of clickstream event data. Your data analyst team will most frequently query by specific event date ranges and filter by the user ID UUID. You want to optimize table structure for query cost and performance. What should you do? 

A. Partition the table by the user ID column and cluster the table by the event date column.

B. Create an ingestion-time partitioned table and cluster it by the user ID column.

C. Cluster the table by both the event date and the user ID columns.

D. Partition the table by the event date column and cluster the table by user ID column.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:16 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382520-exam-professional-data-engineer-topic-1-question-332/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 334 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 334
Topic #: 1

[All Professional Data Engineer Questions]

You need to orchestrate a pipeline with several Google Cloud services: a batch Dataflow job, then a BigQuery query job followed by a Vertex AI batch prediction. The logic is sequential. You want a lightweight, serverless orchestration solution with minimal operational overhead. What service should you use? 

A. Select Cloud Composer.

B. Select Compute Engine with cron.

C. Select Dataproc with Apache Oozie.

D. Select Cloud Workflows.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382513-exam-professional-data-engineer-topic-1-question-334/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 335 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 335
Topic #: 1

[All Professional Data Engineer Questions]

You have a data analyst team member who needs to analyze data by using BigQuery. The data analyst wants to create a data pipeline that would load 200 CSV files with an average size of 15MB from a Cloud Storage bucket into BigQuery daily. The data needs to be ingested and transformed before being accessed in BigQuery for analysis. You need to recommend a fully managed, no-code solution for the data analyst. What should you do? 

A. Create a Cloud Run function and schedule it to run daily using Cloud Scheduler to load the data into BigQuery.

B. Use the BigQuery Data Transfer Service to load files from Cloud Storage to BigQuery, create a BigQuery job which transforms the data using BigQuery SQL and schedule it to run daily.

C. Build a custom Apache Beam pipeline and run it on Dataflow to load the file from Cloud Storage to BigQuery and schedule it to run daily using Cloud Composer.

D. Create a pipeline by using BigQuery pipelines and schedule it to load the data into BigQuery daily.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382508-exam-professional-data-engineer-topic-1-question-335/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 336 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 336
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a stateful data processing pipeline that reads data from a Cloud Storage bucket and writes transformed data to a BigQuery table. The pipeline must be highly available and resilient to zonal failures within the us-central1 region. You need to configure a Dataflow pipeline ensuring minimal disruption during a zonal outage. What should you do? 

A. Launch the Dataflow job with the --region=us-central1 parameter.

B. Deploy the Dataflow job to a single zone within us-central1 and configure it to use a regional persistent disk to store its state.

C. Deploy the Dataflow job to a single zone within us-central1 and use a multi-regional Cloud Storage bucket to store its state.

D. Launch the Dataflow job with the --zone=us-central1a parameter.

**Answer: A**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382510-exam-professional-data-engineer-topic-1-question-336/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 337 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 337
Topic #: 1

[All Professional Data Engineer Questions]

Your team has created several BigQuery curated datasets containing anonymized industry benchmark data. You want to make these datasets easily discoverable and accessible for querying by external partner companies within their own Google Cloud projects. You need a secure and scalable solution. What should you do? 

A. Publish the datasets as listings within BigQuery sharing (Analytics Hub).

B. Export the datasets to partner-specific Cloud Storage buckets.

C. Create authorized views for each dataset and grant access to each partner.

D. Grant the roles/bigquery.dataViewer IAM role to the partner group email addresses on the datasets.

**Answer: A**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382507-exam-professional-data-engineer-topic-1-question-337/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 338 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 338
Topic #: 1

[All Professional Data Engineer Questions]

Your organization stores highly personal data in BigQuery and needs to comply with strict data privacy regulations. You need to ensure that sensitive data values are rendered unreadable whenever an employee leaves the organization. What should you do? 

A. Use column-level access controls with policy tags and revoke viewer permissions when employees leave the organization.

B. Use dynamic data masking and revoke viewer permissions when employees leave the organization.

C. Use customer-managed encryption keys (CMEK) and delete keys when employees leave the organization.

D. Use AEAD functions and delete keys when employees leave the organization.

**Answer: D**

**Timestamp: Jan. 16, 2026, 8:15 a.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/382514-exam-professional-data-engineer-topic-1-question-338/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 339 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 339
Topic #: 1

[All Professional Data Engineer Questions]

You monitor and optimize the BigQuery instance for your team. You notice that a particular daily report that uses a large JOIN operation is consistently slow. You want to examine the query's execution plan to identify potential performance bottlenecks within the JOIN as quickly as possible. What should you do? 

A. Use the bg query --dry_run command to review the estimated number of bytes read and review query syntax.

B. Run a query on the INFORMATION_SCHEMA.JOBS_BY_PROJECT view filtering by the job_ID and analyze total_bytes_processed.

C. Review the BigQuery audit logs in Cloud Logging.

D. Leverage BigQuery's Query History view and analyze the execution graph.

**Answer: D**

**Timestamp: March 18, 2026, 7:47 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/392923-exam-professional-data-engineer-topic-1-question-339/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 340 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 340
Topic #: 1

[All Professional Data Engineer Questions]

Your company stores vital operational sales data in a BigQuery dataset in us-central1. Your company requires a disaster recovery plan to restore this data to us-east1 with a recovery point objective (RPO) of 24 hours and a recovery time objective (RTO) of 4 hours if us-central1 experiences an outage. You need to implement the disaster recovery plan while keeping costs and complexity to a minimum. What should you do? 

A. Set up continuous queries and Pub/Sub to stream data changes from BigQuery tables in us-central1 to us-east1.

B. Manually export data to a CSV file in a multi-regional Cloud Storage bucket daily and use bq load to restore to us-east1.

C. Configure BigQuery cross-region dataset replication from ns-central1 to us-east1.

D. Take daily BigQuery table snapshots in us-central1.

**Answer: C**

**Timestamp: March 18, 2026, 7:47 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/392922-exam-professional-data-engineer-topic-1-question-340/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 342 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 342
Topic #: 1

[All Professional Data Engineer Questions]

You are developing a fraud detection model using BigQuery ML. You have a raw transaction dataset and need to create new features such as the average_transaction_amount_last_24_hours and time_since_last_transaction. These features require aggregation and time-window calculations on the existing data. The goal is to ensure that these features are consistently applied during both model training and prediction without manual intervention. You need to prepare these features efficiently for your model. What should you do? 

A. Implement a Cloud Run function that triggers on new transactions, calculates the features, and inserts them into a feature store before model serving.

B. Export the BigQuery data to Cloud Storage, perform feature engineering using a custom Python script in a Dataflow job, and then re-import the engineered features into BigQuery.

C. Use the TRANSFORM clause within the CREATE MODEL statement, leveraging SQL functions for aggregations and time-based calculations.

D. Create a separate BigQuery table containing pre-computed features using complex SQL queries and join this table with the raw data during model training and serving.

**Answer: C**

**Timestamp: March 11, 2026, 12:37 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385072-exam-professional-data-engineer-topic-1-question-342/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 343 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 343
Topic #: 1

[All Professional Data Engineer Questions]

Your organization has thousands of images stored in Cloud Storage. The organization's data analysts need to categorize these images upon analyzing the image content and store the results in a structured format for integration with other BigQuery datasets. You need a solution that allows the analysts to perform this task with the least amount of coding. What should you do? 

A. Use the Gemini 2.5 Pro model in Vertex AI to analyze the images and store the results in BigQuery.

B. Use the ML.UNDERSTAND_TEXT function along with object tables to analyze the images, and store the JSON output in a Cloud Storage bucket.

C. Use Vertex AI Vision API to analyze the images and store the results in BigQuery.

D. Use the ML.GENERATE_TEXT function along with object tables to analyze the images and store the JSON output in a BigQuery table.

**Answer: D**

**Timestamp: March 14, 2026, 12:12 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385220-exam-professional-data-engineer-topic-1-question-343/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 344 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 344
Topic #: 1

[All Professional Data Engineer Questions]

You are building a system to process financial transactions. The system must handle a high throughput of concurrent user operations and each operation requires low-latency reads and writes to individual records. You need to identify a storage solution that guarantees ACID compliance for the processed transactions. You want a Google Cloud managed service. What should you do? 

A. Select Bigtable.

B. Select BigQuery.

C. Select Cloud Storage.

D. Select Spanner.

**Answer: D**

**Timestamp: March 14, 2026, 12:41 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385221-exam-professional-data-engineer-topic-1-question-344/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 345 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 345
Topic #: 1

[All Professional Data Engineer Questions]

You are preparing data to serve a sales demand prediction model. The training data undergoes several pre-processing steps, including scaling numerical features and one-hot encoding categorical features. The model is deployed on Vertex AI Endpoints. You need to prevent training-serving skew and ensure accurate predictions in production. You want a solution that is easy to implement.What should you do? 

A. Implement a custom handler within the Vertex AI Endpoint to automatically perform data transformations before the model makes a prediction.

B. Replicate the exact same pre-processing logic in the inference pipeline that was used during model training.

C. Store the raw, unprocessed data in a separate Cloud Storage bucket exclusively for serving.

D. Ensure the serving data is a smaller, random sample of the training data.

**Answer: B**

**Timestamp: March 14, 2026, 12:48 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385222-exam-professional-data-engineer-topic-1-question-345/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 346 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 346
Topic #: 1

[All Professional Data Engineer Questions]

Your retail company is concerned about their BigQuery analytics spend. The company runs several queries that require the use of the same aggregation for the store ID and real-time sales volume. You need to implement the optimal solution that minimizes analytics spend and returns faster results. What should you do? 

A. Create a new table from a CSV file with the repeated aggregation for the other queries to reference for faster processing.

B. Create a materialized view to minimize repetitive computations.

C. Use join acceleration with primary and foreign keys to increase query joining to live data.

D. Leverage partitioning to minimize the number of bytes read.

**Answer: B**

**Timestamp: March 14, 2026, 12:50 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385223-exam-professional-data-engineer-topic-1-question-346/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 347 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 347
Topic #: 1

[All Professional Data Engineer Questions]

You are defining the data governance strategy for a new BigQuery table with medical and financial data. You want a scalable solution that ensures the clinical researchers can access patient medical data without financial information, while allowing the accounting team to access only financial data with minimal patient identifiers. What should you do? 

A. Implement column-level security policies in BigQuery tables with IAM permissions.

B. Create separate tables for personally identifiable information (PII), financial data, and anonymized medical data. Use IAM permissions to control access to each table.

C. Implement row-level security policies in BigQuery tables with IAM permissions.

D. Create separate datasets with authorized views exposing only approved data.

**Answer: A**

**Timestamp: March 14, 2026, 1:07 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385225-exam-professional-data-engineer-topic-1-question-347/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 348 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 348
Topic #: 1

[All Professional Data Engineer Questions]

You are designing a data lake on Google Cloud to store vast amounts of customer interaction data from various sources, such as websites, mobile apps, and social media. You need to ensure that this data, which arrives in different formats, is consistently cataloged and easy for data analysts to discover and use. You also want to perform basic data quality checks and transformations before the data is consumed by downstream applications. You need an automated and managed data governance solution. What should you do? 

A. Use Cloud Storage as the central repository. Use Vertex AI to classify and process the data and perform data quality checks.

B. Stream all the data directly into BigQuery, where it is automatically cataloged and governed.

C. Use Cloud Storage and BigQuery as repositories. Use Dataplex Universal Catalog for metadata discovery, data quality checks, and transformations.

D. Use Cloud Storage as the central repository. Use a Cloud Run function to catalog, transform the data, and perform data quality checks.

**Answer: C**

**Timestamp: March 14, 2026, 12:53 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385224-exam-professional-data-engineer-topic-1-question-348/)

----------------------------------------

## Exam Professional Data Engineer topic 1 question 349 discussion

Actual exam question from

Google's
Professional Data Engineer

Question #: 349
Topic #: 1

[All Professional Data Engineer Questions]

You are using Dataflow to build a streaming data pipeline to analyze user website click activity from Pub/Sub. You need to calculate the number of clicks for each user site visit. A site visit is defined as a period of activity followed by 30 minutes of inactivity for a specific user. What should you do? 

A. Use tumbling windows with a 30-minute window.

B. Use hopping windows with a 30-minute window, and a 1-minute period.

C. Use hopping windows with a 30-minute window, and a 30-minute period.

D. Use session windows with a 30-minute gap duration.

**Answer: D**

**Timestamp: March 14, 2026, 1:10 p.m.**

[View on ExamTopics](https://www.examtopics.com/discussions/google/view/385226-exam-professional-data-engineer-topic-1-question-349/)

----------------------------------------

