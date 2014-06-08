#!/usr/bin/python

import os, string, sys
import urllib




def process_xml(hostname, filename):
    if os.path.exists(filename+".template")==False:
        print "No template file found:%s"%filename+".template"
        return
    content = open(filename+".template", "r").readlines()
    new_content = []
    for line in content:
        new_content.append(line.replace("MASTER_HOSTNAME", hostname))

    f = open(filename, "w") 
    f.writelines(new_content)
    f.close()  



hostname = urllib.urlopen("http://169.254.169.254/latest/meta-data/hostname").read()
if hostname==None:
    sys.exit(-1)

print "set hostname in Hadoop config: " + hostname
process_xml(hostname, "core-site.xml") 
process_xml(hostname, "hdfs-site.xml") 
process_xml(hostname, "yarn-site.xml") 
