#!/bin/bash

#/etc/hadoop/conf/update_config.sh
#su -l hdfs -c "hdfs namenode -format"
su -l hdfs -c "/usr/lib/hadoop/sbin/hadoop-daemon.sh start namenode"


for i in `cat /etc/hadoop/conf/slaves`; do
    ssh $i "su -l hdfs -c '/usr/lib/hadoop/sbin/hadoop-daemon.sh start datanode'"
done
