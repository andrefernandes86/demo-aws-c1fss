# demo-aws-c1fss

-------------
Requirements:
-------------
__AWS_Requirements: 

- A new Scanner Stack has to be deployed in your AWS Account:

  https://cloudone.trendmicro.com/filestorage/deployment

- Enable the S3 Buckets automatic protection:

  https://github.com/trendmicro/cloudone-filestorage-plugins/tree/master/deployment/aws-python-storage-stack-automation
  
  
- Create 3 new S3 Buckets with the following Naming Convention / Tags

  -- $MyName-UploadedFiles (Add the tag [Tag = FSSMonitored	| Value = Yes]

  -- $MyName-MaliciousFiles 

  -- $MyName-NormalFiles
  

- Enable the Post-Scan Actions:

  https://github.com/trendmicro/cloudone-filestorage-plugins/tree/master/post-scan-actions/aws-python-promote-or-quarantine
  Note: Replace "fss-promote" with "$MyName-NormalFiles" and "fss-quarantine" with "$MyName-MaliciousFiles"

__C1_Requirements: 

- Generate one C1 API Key (to be used during c1fss deployment)

  https://cloudone.trendmicro.com/management/api-keys


__Client_Requirements: Create a docker container using the Dockerfile available on this repo.

------------
Demo
------------

Using the Docker Container..

1_ Clone this Repositoty "git clone .."

2_ Build a new docker image using the Dockerfile as a reference "docker build -t c1fss-aws ."

3_ Run the new container and follow the activation steps "docker run -it c1fss-aws bash"

3.1_ After getting access to the container, authenticate in your AWS Account (AWS CONFIGURE).

4_ After you authenticate in your AWS Account, the Docker container will prompt you with some options that can be used to demonstrate different scenarios

5_ These are the options available:

5.1 - 1_ Preparing the demo environment.. (This option will check the prompt you to confirm the S3 Bucket Names you've created for this demo and will check if these directories are ready (no files). If the script finds any file, they will be deleted)

5.2 - 2_ Checking the demo environment.. (This option can be used to check the status of all S3 Buckets. It will list any file available on each S3 Buckets)

5.3 - 3_ Uploading a malicious file (eicar.com) to a S3 Bucket (As the name says, this option will simulate a malicious file being uploaded to the S3 Bucket ($MyName-UploadedFiles). It's expected that this file will be moved to the $MyName-MaliciousFiles after a few seconds. You can use the option "5" to check the results and if/when the malicious file is moved to the $MyName-MaliciousFiles)

5.4 - 4_ Uploading a normal file (document.txt) to a S3 Bucket (As the name says, this option will simulate a normal file being uploaded to the $MyName-NormalFiles. It's expected that this file will be moved to the $MyName-NormalFiles after a few seconds. You can use the option "5" to check the results and if/when the normal file is moved to the $MyName-NormalFiles)

5.5 - 5_ Checking the results (Post-Scan Action) (This option can be used to check the status of all StorageAccounts. It will list any file available on each S3 Bucket)

5.6 - 6_ Exit from menu (This option will cleanup the demo environment, making the environment ready for the next demo).

