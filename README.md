PilotData-hadoop
================



# Hadoop on Amazon Setup

## EMR

Boostrap Action for HDFS 2.4 Caching

Configure Hadoop	

s3://elasticmapreduce/bootstrap-actions/configure-hadoop	

--hdfs-key-value, dfs.datanode.max.locked.memory=2000000000

## HDP Parameters

Image: KMeansMPI-Tachyon-Redis-HDP2.1-0.61

[root@ip-10-17-49-38 scripts]# python yarn-utils.py  -c 16 -m 21 -d 1 -k False
 Using cores=16 memory=21GB disks=1 hbase=False
 Profile: cores=16 memory=20480MB reserved=1GB usableMem=20GB disks=1
 Num Container=3
 Container Ram=6656MB
 Used Ram=19GB
 Unused Ram=1GB
 yarn.scheduler.minimum-allocation-mb=6656
 yarn.scheduler.maximum-allocation-mb=19968
 yarn.nodemanager.resource.memory-mb=19968
 mapreduce.map.memory.mb=6656
 mapreduce.map.java.opts=-Xmx5324m
 mapreduce.reduce.memory.mb=6656
 mapreduce.reduce.java.opts=-Xmx5324m
 yarn.app.mapreduce.am.resource.mb=6656
 yarn.app.mapreduce.am.command-opts=-Xmx5324m
 mapreduce.task.io.sort.mb=2662


Startup cluster

    * modify conf files
        * slaves file
        * update host: python create_config.py 
        * sync with other machines: synch.sh
        
    * start cluster
         /root/pilotdata-hadoop/ec2/create_dirs.sh
        sudo su -l hdfs -c "hdfs namenode -format"
        su -l hdfs -c "/usr/lib/hadoop/sbin/hadoop-daemon.sh start namenode"
        
        
    * start datanodes:
        
        /root/pilotdata-hadoop/ec2/create_dirs.sh
        sudo su -l hdfs -c "/usr/lib/hadoop/sbin/hadoop-daemon.sh start datanode"


    * Prepare HDFS Users

        sudo su -l hdfs -c "hadoop fs -mkdir /user/"
        [ec2-user@ip-10-17-48-170 ~]$ sudo su -l hdfs -c "hadoop fs -mkdir /user/ec2-user"
        sudo su -l hdfs -c "hadoop fs -chown ec2-user /user/ec2-user"

Experiments: