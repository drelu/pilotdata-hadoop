#!/bin/sh

#
# Users and Groups
#

# User which will own the HDFS services.
export HDFS_USER=hdfs ;

# User which will own the YARN services.
export YARN_USER=yarn ;

# User which will own the MapReduce services.
export MAPRED_USER=mapred ;

# User which will own the Pig services.
export PIG_USER=pig ;

# User which will own the Hive services.
export HIVE_USER=hive ;

# User which will own the Templeton services.
export WEBHCAT_USER=hcat ;

# User which will own the HBase services.
export HBASE_USER=hbase ;

# User which will own the ZooKeeper services.
export ZOOKEEPER_USER=zookeeper ;

# User which will own the Oozie services.
export OOZIE_USER=oozie


# A common group shared by services.
export HADOOP_GROUP=hadoop ;
