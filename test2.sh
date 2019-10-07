read-p'Start Time':start
read-p'End Time':end

bash /mapreduce-test/start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /lab2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /mapreduce-test/mapreduce-test-data/access.log /lab2/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../Lab1Mapreduce/mapper2.py -mapper ../Lab1Mapreduce/mapper2.py \
-file ../Lab1Mapreduce/reducer2.py -reducer ../Lab1Mapreduce/reducer2.py \
-input /lab1/input/* -output /lab1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /lab1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /lab2/output/
bash /mapreduce-test/stop.sh
