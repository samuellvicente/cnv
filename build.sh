#### AWS

#export AWS_SDK="$PWD/aws-java-sdk-1.11.751"
#export CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
#export CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


#### Java locations
# source your own java config script or edit one of the templates

#source java-config-windows.sh
#source java-config-rnl-vm.sh
source $PWD/java-config-aws.sh





#### Project setup
export CLASSPATH=$CLASSPATH:$PWD/instrumented:$PWD/project:$PWD/BIT:$PWD/BIT/samples:$PWD/BIT/BIT

# Remove old .class files
source $PWD/clean.sh

# Making sure the folders required by the instrumentation exist
mkdir -p $PWD/instrumented/pt/ulisboa/tecnico/cnv/solver/
mkdir -p $PWD/instrumented/pt/ulisboa/tecnico/cnv/server/
mkdir -p $PWD/instrumented/pt/ulisboa/tecnico/cnv/util/


#### Compilation
export _JAVA_OPTIONS="-XX:-UseSplitVerifier "$_JAVA_OPTIONS

javac -cp $CLASSPATH BIT/BIT/*.java
javac -cp $CLASSPATH BIT/samples/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/solver/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/server/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/metrics/*.java
