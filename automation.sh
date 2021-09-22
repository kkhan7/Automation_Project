#! /bin/sh
while sudo apt update -y
do
apt install ${package} -y
done


# use timestamp=$(date '+%d%m%Y-%H%M%S') ) to name  the  tar
aws s3 \
cp /tmp/${automation}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${automation}-httpd-logs-${timestamp}.tar


# Installing awscli 
sudo apt update
sudo apt install awscli

chmod  +x  /root/Automation_Project/automation.sh
#switch to root user with sudo su
sudo  su
./root/Automation_Project/automation.sh

# or run with sudo privileges
sudo ./root/Automation_Project/automation.sh


# Become the root user
sudo su

# Move to /root directory
cd /root

#Clone learner's repository
git clone  http://github/username/Automation_Project
cd Automation_Project

#Grading of Task 2
#Checkout Tag Automation-v0.1  in new branch 'grader'
git checkout Automation-v0.1 -b grader 

#make script executable
chmod +x automation.sh
./automation.sh

# for more verbose  output
bash -x ./automation.sh

#Grading of Task 3
git checkout main
bash -x ./automation.sh
