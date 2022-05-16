# demo-aws-c1fss

## 1st Step
- A new Scanner Stack has to be deployed in your AWS Account:

  https://cloudone.trendmicro.com/filestorage/deployment

- Enable the S3 Buckets automatic protection:

  https://github.com/trendmicro/cloudone-filestorage-plugins/tree/master/deployment/aws-python-storage-stack-automation


- Create 3 new S3 Buckets:

  -- $MyName-UploadedFiles (Add the tag [Tag = FSSMonitored	| Value = Yes]

  -- $MyName-MaliciousFiles 

  -- $MyName-NormalFiles


- Enable the Post-Scan Actions:

  https://github.com/trendmicro/cloudone-filestorage-plugins/tree/master/post-scan-actions/aws-python-promote-or-quarantine
  Note: Replace "fss-promote" with "$MyName-NormalFiles" and "fss-quarantine" with "$MyName-MaliciousFiles"


## 2nd Step
- Follow the .....
