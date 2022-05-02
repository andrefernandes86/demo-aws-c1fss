#!/bin/bashi
clear
# Menu Uptions
echo "Cloud One File Storage Security - Azure Demo";
echo "1. Preparing the demo environment.."
echo "2. Checking the demo environment.."
echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
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
    echo ' - Indicate the StorageAccountName used to upload the files used on this demo. '
    read StorageAccountNameA 
    echo ' ' 
    echo ' - Indicate the ContainerName used to upload files '
    read ContainerNameA
    echo '-------------------------------------------------------------------------------'  
    clear
    echo '---------------------------------------------------------------------------------------'  
    echo ' - Indicate the StorageAccountName used to send the malicious files detected by C1FSS. '
    read StorageAccountNameB
    echo ' ' 
    echo ' - Indicate the ContainerName used to upload files '
    read ContainerNameB
    echo '---------------------------------------------------------------------------------------'
    clear
    echo '----------------------------------------------------------------'  
    echo ' - Indicate the StorageAccountName used to send the safe files. '
    read StorageAccountNameC
    echo ' ' 
    echo ' - Indicate the ContainerName used to upload files '
    read ContainerNameC
    echo '----------------------------------------------------------------'  
    clear
    echo '----------------------------------------------------------------------------------------------------'
    echo 'The files will be uploaded to the StorageAccount/Container '$StorageAccountNameA'/'$ContainerNameA
    echo 'The malicious files will be moved to the StorageAccount/Container '$StorageAccountNameB'/'$ContainerNameB
    echo 'The normal files will be moved to the StorageAccount/Container '$StorageAccountNameC'/'$ContainerNameC
    echo '----------------------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo '----------------------------------------------------------------------------------------'
    echo 'Checking the following Storage accounts for old files (the old files will be removed)'
    echo '----------------------------------------------------------------------------------------'
    echo ' Cleaning the Storage Account (Malware Quarantine) '$StorageAccountNameB
    az storage blob delete -c files -n eicar.com --account-name $StorageAccountNameB
    echo ''
    echo ' Cleaning the Storage Account (Normal Files) '$StorageAccountNameC
    az storage blob delete -c files -n document.txt --account-name $StorageAccountNameC
    echo '----------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - Azure Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
    echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
    echo "";;
  # Option 2
  2)  echo "You have selected the option 2"
    clear
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' Listing the content of the StorageAccounts '$StorageAccountNameA', '$StorageAccountNameB' and '$StorageAccountNameC
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob list \
        --account-name $StorageAccountNameA \
        --container-name $ContainerNameA \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameB
    echo ' CONTAINER: '$ContainerNameB
    az storage blob list \
        --account-name $StorageAccountNameB \
        --container-name $ContainerNameB \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameC
    echo ' CONTAINER: '$ContainerNameC
    az storage blob list \
        --account-name $StorageAccountNameC \
        --container-name $ContainerNameC \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - Azure Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
    echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
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
    echo ' Uploading a Malicious Files to '$StorageAccountNameA
    echo '-------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: '$StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob upload \
    --account-name afc1demo \
    --container-name files \
    --name eicar.com \
    --file ./eicar.com \
    --auth-mode key
    echo '------------------------------------------------------------------'
    echo ' Listing the content of the StorageAccounts '$StorageAccountNameA
    echo '------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob list \
        --account-name $StorageAccountNameA \
        --container-name $ContainerNameA \
        --output table \
        --auth-mode key
    echo ' '
    echo '------------------------------------------------------------------'
    sleep 10
    rm eicar.com
    clear
    echo "Cloud One File Storage Security - Azure Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
    echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;
  # Option 4
  4)  echo "You have selected the option 4"
    clear
    echo 'hello world!' >> document.txt
    cat document.txt
    echo '-------------------------------------------------------------------'
    echo ' Uploading a Malicious Files to '$StorageAccountNameA
    echo '-------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: '$StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob upload \
    --account-name afc1demo \
    --container-name files \
    --name document.txt \
    --file ./document.txt \
    --auth-mode key
    echo '------------------------------------------------------------------'
    echo ' Listing the content of the StorageAccount '$StorageAccountNameA
    echo '------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob list \
        --account-name $StorageAccountNameA \
        --container-name $ContainerNameA \
        --output table \
        --auth-mode key
    echo ' '
    echo '------------------------------------------------------------------'
    sleep 10
    rm document.txt
    clear
    echo "Cloud One File Storage Security - Azure Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
    echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;    
  # Option 5
  5)  echo "You have selected the option 5"
    clear
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' Listing the content of the StorageAccounts '$StorageAccountNameA', '$StorageAccountNameB' and '$StorageAccountNameC
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameA
    echo ' CONTAINER: '$ContainerNameA
    az storage blob list \
        --account-name $StorageAccountNameA \
        --container-name $ContainerNameA \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameB
    echo ' CONTAINER: '$ContainerNameB
    az storage blob list \
        --account-name $StorageAccountNameB \
        --container-name $ContainerNameB \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    echo ' STORAGE ACCOUNT: ' $StorageAccountNameC
    echo ' CONTAINER: '$ContainerNameC
    az storage blob list \
        --account-name $StorageAccountNameC \
        --container-name $ContainerNameC \
        --output table \
        --auth-mode key
    echo ' '
    echo '--------------------------------------------------------------------------------------------------------------------'
    sleep 10
    clear
    echo "Cloud One File Storage Security - Azure Demo";
    echo "1. Preparing the demo environment.."
    echo "2. Checking the demo environment.."
    echo "3. Uploading a malicious file (eicar.com) to a Azure Blob Storage"
    echo "4. Uploading a normal file (document.txt) to a Azure Blob Storage"
    echo "5. Checking the results (Post-Scan Action)"
    echo "6. Exit from menu "
    echo -n "Enter your menu choice [1-6]: "
      echo '';;
  # Option 6
  6)  echo "Quitting ..."
    az storage blob delete -c files -n eicar.com --account-name $StorageAccountNameB
    az storage blob delete -c files -n document.txt --account-name $StorageAccountNameC
      exit;;
  
  # Default Pattern
  *) echo "invalid option";;
  
esac
  echo -n "Enter your menu choice [1-6]: "
done
