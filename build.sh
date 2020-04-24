#### AWS

#export AWS_SDK="$PWD/aws-java-sdk-1.11.751"
#export CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
#export CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


#### Java locations
# source your own java config script or edit one of the templates

source java-config-windows.sh
#source java-config-rnl-vm.sh
#source java-config-aws.sh





#### Project setup
export CLASSPATH=$CLASSPATH:$PWD/instrumented:$PWD/project:$PWD/BIT:$PWD/BIT/samples:$PWD/BIT/BIT

# Clean up
rm instrumented/pt/ulisboa/tecnico/cnv/server/*class
rm instrumented/pt/ulisboa/tecnico/cnv/util/*class
rm instrumented/pt/ulisboa/tecnico/cnv/solver/*class
rm project/pt/ulisboa/tecnico/cnv/server/*class
rm project/pt/ulisboa/tecnico/cnv/solver/*class
rm BIT/BIT/*class

# Making sure the folders required by the instrumentation exist
mkdir -p instrumented/pt/ulisboa/tecnico/cnv/solver/
mkdir -p instrumented/pt/ulisboa/tecnico/cnv/server/
mkdir -p instrumented/pt/ulisboa/tecnico/cnv/util/


#### Compilation
export _JAVA_OPTIONS="-XX:-UseSplitVerifier "$_JAVA_OPTIONS

javac -cp $CLASSPATH BIT/BIT/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/solver/*.java
javac -cp $CLASSPATH project/pt/ulisboa/tecnico/cnv/server/*.java
