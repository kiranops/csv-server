Part 1

1. Check if its container is running : 
   docker run infracloudio/csvserver:latest

2. Below issue occured:
   2021/04/19 12:51:59 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

3. gencsv.sh script to generate the inputFile with 10 or more entries
   
##################### gencsv.sh Script ###################################
   #!/bin/bash

   count=1
   default_count=10

   echo > ./inputFile

   while [ $count -le $default_count ]
   do

	random=$(shuf -i 1-1000 -n2 | sort -n)
	first=$(echo $random | cut -f1 -d ' ')
	second=$(echo  $random | cut -f2 -d ' ')

	echo "$first, $second" >> ./inputFile
	count=$(( $count + 1 ))

   done

   sed -i '1d' ./inputFile  

##########################################################################

4. Running the container:
   docker run -d -v path/inputFile:/csvserver/inputFile infracloudio/csvserver:latest

5. Finding the port of container by accessing container:
   Accessing container : docker exec -it <container_id> /bin/bash
   Checking Port of csvserver service : netstat -tunlp 

6. Running container again with 9393 port access and CSVSERVER_BORDER  environment variable in detached mode
  
   docker run -d -v /opt/infra-cloud/csvserver/solution/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest


 
