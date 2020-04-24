
# AWS

export AWS_SDK="$PWD/aws-java-sdk-1.11.751"

export CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
export CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


# Project locations

export CLASSPATH=$PWD/instrumented:$PWD/project:$PWD/BIT:$PWD/BIT/samples:$PWD/BIT/BIT

echo $CLASSPATH


# # Java locations

export JAVA_HOME="/c/Program Files/Java/jdk1.7.0_80"
#/usr/lib/jvm/java-7-openjdk-amd64/
export JAVA_ROOT="/c/Program Files/Java/jdk1.7.0_80"
export JDK_HOME="/c/Program Files/Java/jdk1.7.0_80"
export JRE_HOME="/c/Program Files/Java/jdk1.7.0_80/jre"
export PATH="/c/Program Files/Java/jdk1.7.0_80/bin":$PATH
export SDK_HOME="/c/Program Files/Java/jdk1.7.0_80"

export _JAVA_OPTIONS="-XX:-UseSplitVerifier "$_JAVA_OPTIONS



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