#!/bin/sh

#
# Generated onMon May 21 16:13:46 PDT 2018# Start of user configurable variables
#
LANG=C
export LANG

# SSO username and password
#read -p 'SSO User Name:' SSO_USERNAME
#read -sp 'SSO Password:' SSO_PASSWORD
SSO_USERNAME=jschmucke@soaint.com
SSO_PASSWORD=J10002323j

# Path to wget command
WGET=/usr/bin/wget
# Location of cookie file
COOKIE_FILE=/tmp/$$.cookies

# Log directory and file
LOGDIR=.
LOGFILE=$LOGDIR/wgetlog-`date +%m-%d-%y-%H:%M`.log
# Output directory and file
OUTPUT_DIR=.
#
# End of user configurable variable
#

if [ "$SSO_PASSWORD " = " " ]
then
 echo "Please edit script and set SSO_PASSWORD"
 exit
fi

SSO_RESPONSE=`$WGET --user-agent="Mozilla/5.0"  --no-check-certificate https://edelivery.oracle.com/osdc/faces/SoftwareDelivery -O- 2>&1|grep Location`

# Extract request parameters for SSO
SSO_TOKEN=`echo $SSO_RESPONSE| cut -d '=' -f 2|cut -d ' ' -f 1`
SSO_SERVER=`echo $SSO_RESPONSE| cut -d ' ' -f 2|cut -d '/' -f 1,2,3`
SSO_AUTH_URL=/sso/auth
AUTH_DATA="ssousername=$SSO_USERNAME&password=$SSO_PASSWORD&site2pstoretoken=$SSO_TOKEN"

# The following command to authenticate uses HTTPS. This will work only if the wget in the environment
# where this script will be executed was compiled with OpenSSL. Remove the --secure-protocol option
# if wget was not compiled with OpenSSL
# Depending on the preference, the other options are --secure-protocol= auto|SSLv2|SSLv3|TLSv1
$WGET --user-agent="Mozilla/5.0" --secure-protocol=auto --post-data $AUTH_DATA --save-cookies=$COOKIE_FILE --keep-session-cookies $SSO_SERVER$SSO_AUTH_URL -O sso.out >> $LOGFILE 2>&1

rm -f sso.out


$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V38500-01_1of2.zip&token=bEZGNCtpWkU1OW9oZ2Z0ektwdmFoUSE6OiFmaWxlSWQ9NjI0MjM3MzcmZmlsZVNldENpZD03ODQ4MTYmcmVsZWFzZUNpZHM9NzY0NTMmcGxhdGZvcm1DaWRzPTM1JmRvd25sb2FkVHlwZT05NTc2NCZhZ3JlZW1lbnRJZD00NDY1NTM1JmVtYWlsQWRkcmVzcz1qc2NobXVja2VAc29haW50LmNvbSZ1c2VyTmFtZT1FUEQtSlNDSE1VQ0tFQFNPQUlOVC5DT00maXBBZGRyZXNzPTIwMS4yMTEuNzcuMTA4JnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xM180KSBBcHBsZVdlYktpdC82MDUuMS4xNSAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vMTEuMSBTYWZhcmkvNjA1LjEuMTUmY291bnRyeUNvZGU9VkUmZGxwQ2lkcz03ODU5MTM" -O $OUTPUT_DIR/V38500-01_1of2.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V38500-01_2of2.zip&token=NHFsRHNORFVPbFk2Z0ZDQUZibUUrdyE6OiFmaWxlSWQ9NjI0MjM3MzgmZmlsZVNldENpZD03ODQ4MTYmcmVsZWFzZUNpZHM9NzY0NTMmcGxhdGZvcm1DaWRzPTM1JmRvd25sb2FkVHlwZT05NTc2NCZhZ3JlZW1lbnRJZD00NDY1NTM1JmVtYWlsQWRkcmVzcz1qc2NobXVja2VAc29haW50LmNvbSZ1c2VyTmFtZT1FUEQtSlNDSE1VQ0tFQFNPQUlOVC5DT00maXBBZGRyZXNzPTIwMS4yMTEuNzcuMTA4JnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xM180KSBBcHBsZVdlYktpdC82MDUuMS4xNSAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vMTEuMSBTYWZhcmkvNjA1LjEuMTUmY291bnRyeUNvZGU9VkUmZGxwQ2lkcz03ODU5MTM" -O $OUTPUT_DIR/V38500-01_2of2.zip>> $LOGFILE 2>&1 

$WGET --user-agent="Mozilla/5.0"  --no-check-certificate  --load-cookies=$COOKIE_FILE --save-cookies=$COOKIE_FILE --keep-session-cookies "https://edelivery.oracle.com/osdc/softwareDownload?fileName=V38499-01.zip&token=QVpJZ2s0WjhrdVh4ckVYaG5qN0JXUSE6OiFmaWxlSWQ9NjIzOTkwMzQmZmlsZVNldENpZD03ODQ4NjkmcmVsZWFzZUNpZHM9OTA4MDYmcGxhdGZvcm1DaWRzPTM1JmRvd25sb2FkVHlwZT05NTc2NCZhZ3JlZW1lbnRJZD00NDY1NTM1JmVtYWlsQWRkcmVzcz1qc2NobXVja2VAc29haW50LmNvbSZ1c2VyTmFtZT1FUEQtSlNDSE1VQ0tFQFNPQUlOVC5DT00maXBBZGRyZXNzPTIwMS4yMTEuNzcuMTA4JnVzZXJBZ2VudD1Nb3ppbGxhLzUuMCAoTWFjaW50b3NoOyBJbnRlbCBNYWMgT1MgWCAxMF8xM180KSBBcHBsZVdlYktpdC82MDUuMS4xNSAoS0hUTUwsIGxpa2UgR2Vja28pIFZlcnNpb24vMTEuMSBTYWZhcmkvNjA1LjEuMTUmY291bnRyeUNvZGU9VkUmZGxwQ2lkcz03ODU5MTM" -O $OUTPUT_DIR/V38499-01.zip>> $LOGFILE 2>&1 


