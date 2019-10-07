bash /mapreduce-test/start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /mapreduce-test/mapreduce-test-data/access.log /lab1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../BigDataAsn/mapper1.py -mapper ../BigDataAsn/mapper1.py \
-file ../BigDataAsn/reducer2.py -reducer ../BigDataAsn/reducer2.py \
-input /lab1/input/* -output /lab1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /lab1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab1/output/
bash /mapreduce-test/stop.sh
