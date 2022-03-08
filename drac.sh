#!/bin/sh

echo -n "Password: "
read -s IDRAC_PASSWORD


$JAVA_HOME/bin/java \
	-cp avctKVM.jar \
	-Djava.library.path=./lib \
	com.avocent.idrac.kvm.Main \
	ip=${IDRAC_HOSTNAME} \
	kmport=5900 \
	vport=5900 \
	apcp=1 \
	version=2 \
	vmprivilege=true \
	helpurl=https://${IDRAC_HOSTNAME}:443/help/contents.html \
	user=${IDRAC_USERNAME} \
	passwd=${IDRAC_PASSWORD}
