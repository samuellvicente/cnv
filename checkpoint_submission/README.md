# How to run

###Dependencies:
* Java 7 JDK
* AWS Java SDK (eventually)


1. Edit the location of the dependencies in the start of the build.sh script;

   1.1 Search for the follow lines:
   * export AWS_SDK="$PWD/aws-java-sdk-1.11.751"
   * source java-config-aws.sh
   
   1.2 Edit the java variables in the "java-config-aws.sh" script or one of the other templates.

2. Set the *.sh scripts as executable using your system permisions;
    (chmod 755 in linux)
    At least the auto_run.sh script needs to have permissions to be executed.

3. Running the server:

    3.1 Edit the /etc/rc.local file, add the path to the auto_run.sh script at the end to be executed;
        Mark the /etc/rc.local file as executable;
        
    OR
    
   3.2  Run auto_run.sh to setup, compile and run the WebServer;


# Architecture

More information in the report.

###WebServer:

Relevant Classes:
* ThreadLocalRequestInfo: Holds a thread local global variable of class RequestInfo that gathers all info about the request and its metrics,if the solver class is instrumented. 
* ICountCNV: On the instrument class we increment directly in that thread local variable to avoid sync problems between threads and to access elsewhere in the code in that thread.
* WebServer: ConcurrentLinkedDeque that stores requestInfo that is added to when thread finishes dealing with the request.

###Load Balancer: 
* AWS Classic Load Balancer

###Auto-Scaler: 
* AWS Auto-scaling group

###Metrics Storage System: 
* Local storage in the instance of each webserver.

Relevant Classes:
* TempStorage: Runnable class that writes to file. Reads file, empties RequestInfo queue from Webserver and writes again.
* WebServer: Has a SingleThreadScheduledExecutor that fires every 10s responsible of reading the RequestInfo queue that saves the context of each thread and writing it to a stats.backup file.

Load Balancer
Load Balancer name: LBcheck
Scheme: internet-facing
Port Configuration: 80 (HTTP) forwarding to 8000 (HTTP)
 Configure Health CheckEdit health check
Ping Target:    HTTP:8000/sudoku?n1=9&n2=9&s=BFS&un=0&i=SUDOKU_PUZZLE_9x9_101&board=[[2,7,3,8,6,5,4,9,1],[9,5,8,4,7,1,2,3,6],[6,1,4,2,9,3,7,5,8],[5,6,1,3,8,7,9,2,4],[3,4,9,6,5,2,1,8,7],[7,8,2,1,4,9,3,6,5],[1,3,7,5,2,6,8,4,9],[4,2,5,9,1,8,6,7,3],[8,9,6,7,3,4,5,1,2]]
Timeout:    10 seconds
Interval:   30 seconds
Unhealthy threshold:    2
Healthy threshold:  10
 Add EC2 InstancesEdit instances
Cross-Zone Load Balancing:  Enabled
Connection Draining:    Enabled, 300 seconds
Instances:  
 VPC InformationEdit subnets
VPC:    vpc-32353748
Subnets:    subnet-a9199fe4
 Security groupsEdit security groups
Security groups:    sg-087c9750048a6c42c
Stickiness: Disabled







#### System Configurations


Load-Balancer:



Auto-Scaler:



Launch Group Configuration

AMI - ami-00cc2ab25e7cf3f77
Instance Type - t2.micro
Name CNV-Launch-Check
Purchasing option On demand
EBS Optimized No
Monitoring Yes
IAM role None
Tenancy Shared tenancy (multi-tenant hardware)
Kernel ID Use default
RAM Disk ID Use default
User data
IP Address Type Only assign a public IP address to instances launched in the default VPC and subnet. (default)

Storage:
Volume Type; Device; Snapshot; Size (GiB); Volume Type; IOPS; Throughput; Delete on Termination; Encrypted; 
Root; /dev/xvda; snap-07b7ddad038f4289a; 8; gp2; N/A; N/A ; Yes; No; 

Security group rules:
Type; Protocol; Port Range; Source;
HTTP TCP 80 0.0.0.0/0 
Custom TCP Rule TCP 8000 0.0.0.0/0 
SSH TCP 22 0.0.0.0/0




Auto Scaling Group

 Auto Scaling Group DetailsEdit details
Group name CNV-AutoScaler-Check
Group size  1
Minimum Group Size  1
Maximum Group Size  10
Subnet(s)  subnet-a9199fe4
Load Balancers  LBcheck
Target Groups
Health Check Type  ELB
Health Check Grace Period  300
Detailed Monitoring  Yes
Instance Protection  None
Service-Linked Role  AWSServiceRoleForAutoScaling


 Scaling PoliciesEdit scaling policies

Increase Group Size
With alarm = awsec2-CNV-AutoScaler-Check-CPU-Utilization; Add 10,20 percent of group with minimum adjustment of 1 and 60 seconds for instances to warm up

Decrease Group Size
With alarm = awsec2-CNV-AutoScaler-Check-High-CPU-Utilization; Remove 10,20 percent of group with minimum adjustment of 1