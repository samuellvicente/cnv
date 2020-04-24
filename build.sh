# AWS

#export AWS_SDK="$PWD/aws-java-sdk-1.11.751"

#export CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
#export CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


# Project locations

export CLASSPATH=$CLASSPATH:$PWD/instrumented:$PWD/project:$PWD/BIT:$PWD/BIT/samples:$PWD/BIT/BIT

#echo $CLASSPATH


# # Java locations

#source java-config-rnl-vm.sh
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

#rm instrumented/pt/ulisboa/tecnico/cnv/solver/class/SolverArgumentParser.class
#rm "instrumented/pt/ulisboa/tecnico/cnv/solver/class/SolverArgumentParser$SolverParameters.class"

#java -cp $CLASSPATH pt.ulisboa.tecnico.cnv.solver.SolverMain -d -n1 9 -n2 9 -un 81 -i SUDOKU_PUZZLE_9x19_101 -s DLX -b [[2,0,0,8,0,5,0,9,1],[9,0,8,0,7,1,2,0,6],[0,1,4,2,0,3,7,5,8],[5,0,1,0,8,7,9,2,4],[0,4,9,6,0,2,0,8,7],[7,0,2,1,4,9,3,0,5],[1,3,7,5,0,6,0,4,9],[4,2,5,0,1,8,6,0,3],[0,9,6,7,3,4,0,1,2]]
java -cp $CLASSPATH pt.ulisboa.tecnico.cnv.server.WebServer


# pause
