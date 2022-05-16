# demo-aws-c1fss

-------------
Requirements:
-------------
__AWS_Requirements: 

- Create 3 new S3 Buckets with the following Naming Convention / Tags

  -- $MyName-UploadedFiles (Add the tag [Tag = FSSMonitored	| Value = Yes]

  -- $MyName-MaliciousFiles 

  -- $MyName-NormalFiles
  
  
- A new Scanner Stack has to be deployed in your AWS Account:

  https://cloudone.trendmicro.com/filestorage/deployment

- Enable the S3 Buckets automatic protection:

  https://github.com/trendmicro/cloudone-filestorage-plugins/tree/master/deployment/aws-python-storage-stack-automation

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



