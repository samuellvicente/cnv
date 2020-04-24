
# AWS

export AWS_SDK="$PWD/aws-java-sdk-1.11.751"

export CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
export CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


# Project locations

export CLASSPATH=$PWD/instrumented:$PWD/project:$PWD/BIT:$PWD/BIT/samples:$PWD/BIT/BIT

echo $CLASSPATH


# # Java locations

source java-config-rnl-vm.sh



rm instrumented/pt/ulisboa/tecnico/cnv/server/*class
rm instrumented/pt/ulisboa/tecnico/cnv/util/*class
rm instrumented/pt/ulisboa/tecnico/cnv/solver/*class
rm project/pt/ulisboa/tecnico/cnv/server/*class
rm project/pt/ulisboa/tecnico/cnv/solver/*class
rm BIT/BIT/*class

javac -cp $CLASSPATH BIT/BIT/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/solver/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/server/*.java

java -cp $CLASSPATH BIT.ICountCNV project/pt/ulisboa/tecnico/cnv/solver/ instrumented/pt/ulisboa/tecnico/cnv/solver/

java -cp $CLASSPATH pt.ulisboa.tecnico.cnv.server.WebServer


# pause
