 This must be run on CentOS/RHEL 7.x machine.  Ansible will be used to provision the infrastructure and to deploy the
 application on said infrastructure.

 1. Install required packages with the commands below
 
    yum -y install epel-release python-pip ansible git
    
    pip install --upgrade pip
    
    pip install boto boto3
    
    pip install awscli --upgrade --user
    
    export PATH=$PATH:~/.local/bin
    
 
 2. Configure AWS CLI
 
    aws configure
 
    Provide your aws_access_key_id & aws_secret_access_key when prompted, the region and output can be left blank.
    
    Examples can be found here :-
    https://docs.aws.amazon.com/cli/latest/reference/configure/.   
    

 3. clone this repository to a directory called chuckwired
 
    git clone https://github.com/noobianz/chuckwired.git chuckwired
   
   
 2. change directory to chuckwired
 
    cd chuckwired
 
 3. Ansible requires the ssh key used to create the EC2 instance so it can provision the instance.
    Copy your aws .pem file into the chuckwired directory and set the permissions on it to 0600.
    
    chmod 600 <FILENAME>.pem
 
    then edit the playbook.yml file and add the name of your keypair to the keypair variable.
    
    keypair: your_key_pair
 
 4. Execute the run.sh script
 
    ./run.sh
 
    This script will execute three ansible playbooks.
    
    1. playbook.yml will provision an EC2 Instance
    2. install.yml will install docker/docker-compose & git software packages and clone the chuckwire repository
    3. install.yml will also start three containers running the chuckwired software on ports 8080 - 8082
    4. monitor.yml runs a monitoring script the docker host, if a container is down a message is written to /var/log/messages
       on the docker host.
    
