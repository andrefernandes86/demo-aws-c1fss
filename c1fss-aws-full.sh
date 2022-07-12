#!/bin/bash
clear
# Menu Options
echo "Cloud One File Storage Security - AWS Demo";
echo "1. Preparing the demo environment.."
echo "2. Checking the demo environment.."
echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
echo "5. Checking the results (Post-Scan Action)"
echo "6. Exit from menu "
echo -n "Enter your menu choice [1-6]: "

# Preparing the Application 
while :
do

# Reading Choice
read choice

# Executing the Application 
case $choice in
  # Option 1
  1)  echo "You have selected the option 1"
    clear
    echo '-------------------------------------------------------------------------------'  
    echo ' - Indicate the S3 Bucket used to upload the files used on this demo. '
    read S3BucketA 
    echo ' ' 
    echo '-------------------------------------------------------------------------------'  
    clear
    echo '------------------------------------------------------------------------------'  
    echo ' - Indicate the S3 Bucket used to send the malicious files detected by C1FSS. '
    read S3BucketB
    echo ' ' 
    echo '------------------------------------------------------------------------------'
    clear
    echo '----------------------------------------------------------------'  
    echo ' - Indicate the S3 Bucket used to send the safe files. '
    read S3BucketC
    echo ' ' 
    echo '----------------------------------------------------------------'  
    clear
    echo '----------------------------------------------------------------'  
    echo '- Creating the Demo Environment '
    aws cloudformation deploy \
    --stack-name c1fss-demo \
    --template-file file://aio.yml \
    --parameter-overrides file://overrides.json \
    echo '----------------------------------------------------------------'  
    clear
    echo '-------------------------------------------------------------------'
    echo 'The files will be uploaded to the S3 Bucket '$S3BucketA
    echo 'The malicious files will be moved to the S3 Bucket '$S3BucketB
    echo 'The normal files will be moved to the S3 Bucket '$S3BucketC
    echo '-------------------------------------------------------------------'
    sleep 10
    clear
    echo '----------------------------------------------------------------------------------------'
    echo 'Checking the following S3 Buckets for old files (the old files will be removed!)'
    echo '----------------------------------------------------------------------------------------'
    echo ' Cleaning the S3 Bucket (MalwareFiles) '$S3BucketB
    aws s3 rm s3://$S3BucketB/ --recursive
    echo ''
    echo ' Cleaning the S3 Bucket (NormalFiles) '$S3BucketC
    aws s3 rm s3://$S3BucketC/ --recursive
    echo '----------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - AWS Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
    echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
    echo "";;
  # Option 2
  2)  echo "You have selected the option 2"
    clear
    echo '--------------------------------------------------------------------------------------------'
    echo ' Listing the content of the StorageAccounts '$S3BucketA', '$S3BucketB' and '$S3BucketC
    echo '--------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 ls s3://$S3BucketA/

    echo ' '
    echo '--------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketB  
    aws s3 ls s3://$S3BucketB/

    echo ' '
    echo '--------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketC 
    aws s3 ls s3://$S3BucketC/

    echo ' '
    echo '--------------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - AWS Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
    echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;
  # Option 3
  3)  echo "You have selected the option 3"
    clear
    echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' >> eicar.com
    cat eicar.com
    echo '-------------------------------------------------------------------'
    echo ' Uploading a Malicious Files to the S3 Bucket '$S3BucketA
    echo '-------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 cp eicar.com s3://$S3BucketA/
    echo ' '
    echo '------------------------------------------------------------------'
    echo ' Listing the content of the S3 Bucket '$S3BucketA
    echo '------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 ls s3://$S3BucketA/
    echo ' '
    echo '------------------------------------------------------------------'
    sleep 10
    rm eicar.com
    clear
    echo "Cloud One File Storage Security - AWS Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
    echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;
  # Option 4
  4)  echo "You have selected the option 4"
    clear
    echo 'hello world!' >> document.txt
    cat document.txt
    echo '----------------------------------------------------------'
    echo ' Uploading a Normal File to the S3 Bucket '$S3BucketA
    echo '----------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 cp document.txt s3://$S3BucketA/
    echo ' '
    echo '------------------------------------------------------------------'
    echo ' Listing the content of the S3 Bucket '$S3BucketA
    echo '------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 ls s3://$S3BucketA/
    echo ' '
    echo '------------------------------------------------------------------'
    sleep 10
    rm document.txt
    clear
    echo "Cloud One File Storage Security - AWS Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
    echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;    
  # Option 5
  5)  echo "You have selected the option 5"
    clear
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' Listing the content of the S3 Buckets '$S3BucketA', '$S3BucketB' and '$S3BucketC
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketA
    aws s3 ls s3://$S3BucketA/
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketB
    aws s3 ls s3://$S3BucketB/
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' S3 Bucket: '$S3BucketC
    aws s3 ls s3://$S3BucketC/
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - AWS Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a S3 Bucket"
    echo "4. Uploading a normal file (document.txt) to a S3 Bucket"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;
  # Option 6
  6)  echo "Quitting ..."
    echo ' Cleaning the S3 Bucket (MalwareFiles) '$S3BucketB
    aws s3 rm s3://$S3BucketB/ --recursive
    echo ''
    echo ' Cleaning the S3 Bucket (NormalFiles) '$S3BucketC
    aws s3 rm s3://$S3BucketC/ --recursive
      exit;;
  
  # Default Pattern
  *) echo "invalid option";;
  
esac
  echo -n "Enter your menu choice [1-6]: "
done
