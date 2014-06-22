#!/bin/bash


(cd /etc/hadoop/conf/ && /etc/hadoop/conf/update_config.sh)

for i in `cat /etc/hadoop/conf/slaves`; do
   ssh $i /root/pilotdata-hadoop/ec2/create_dirs.sh
done


su -l hdfs -c "hdfs namenode -format"
su -l hdfs -c "/usr/lib/hadoop/sbin/hadoop-daemon.sh start namenode"


for i in `cat /etc/hadoop/conf/slaves`; do
    ssh $i "su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start datanode'"
done
