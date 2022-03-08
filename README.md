# Dell iDRAC 6 on Arch Linux
This collection of scripts is based on the question and answers from this ServerFault post:
https://serverfault.com/questions/1024877/dell-idrac6-virtual-console-viewer-from-gnu-linux-command-line

## Prerequisites
This was written for Arch Linux users. First download `jre-6u45-linux-x64.bin` into ~/Downloads. You can get it from https://www.oracle.com/java/technologies/javase-java-archive-javase6-downloads.html.
Then install OracleJRE 6 from AUR. If you use `yay` then you can use the following:
```
yay -S jre6
```

You also need to have any JDK installed, to use the `jar` tool.

## Setup iDRAC
We need to get the require JAR files from the iDRAC server to pull apart to run the iDRAC program. In addition, Java is very strict with certificates so we need to download the self-signed certificate from the iDRAC system and add it to your trusted certificate authority store.

```
export JAVA_HOME=/usr/lib/jvm/java-6-jre/jre
export IDRAC_HOSTNAME=192.168.0.1
export IDRAC_USERNAME=root
./setup.sh
```
## Run
Good luck!
```
./drac.sh
```

