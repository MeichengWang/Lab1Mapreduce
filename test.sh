#!/bin/sh
bash /mapreduce-test/start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /mapreduce-test/mapreduce-test-data/access.log /lab1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file /Lab1Mapreduce/mapper.py -mapper /Lab1Mapreduce/mapper.py \
-file /Lab1Mapreduce/reducer.py -reducer /Lab1Mapreduce/reducer.py \
-input /lab1/input/* -output /lab1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /lab1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/output/
bash /mapreduce-test/stop.sh
