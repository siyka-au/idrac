#!/bin/sh

$JAVA_HOME/bin/keytool \
	-keystore $JAVA_HOME/lib/security/cacerts \
	-storepass changeit \
	-importcert \
	-file <(echo ""|openssl s_client -connect ${IDRAC_HOSTNAME}:443 2>/dev/null|openssl x509) \
	-alias ${IDRAC_HOSTNAME} \
	-noprompt

curl -k https://${IDRAC_HOSTNAME}:443/software/avctKVM.jar --output avctKVM.jar
mkdir lib
cd lib
curl -k https://${IDRAC_HOSTNAME}:443/software/avctVMLinux64.jar --output - | jar --extract libavmlinux.so
curl -k https://${IDRAC_HOSTNAME}:443/software/avctKVMIOLinux64.jar --output - | jar --extract libavctKVMIO.so
