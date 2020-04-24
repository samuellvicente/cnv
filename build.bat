
:: AWS

set AWS_SDK="$PWD/aws-java-sdk-1.11.751"

set CLASSPATH="$CLASSPATH:$AWS_SDK/lib/aws-java-sdk-1.11.751.jar"
set CLASSPATH="$CLASSPATH:$AWS_SDK/third-party/lib/*"


:: Project locations

set CLASSPATH=%CLASSPATH%;$PWD/instrumented/;$PWD/project/;$PWD/BIT/;$PWD/BIT/samples/

echo %CLASSPATH%


:: Java locations

set JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
::/usr/lib/jvm/java-7-openjdk-amd64/
set JAVA_ROOT="C:\Program Files\Java\jdk1.7.0_80"
set JDK_HOME="C:\Program Files\Java\jdk1.7.0_80"
set JRE_HOME="C:\Program Files\Java\jdk1.7.0_80\jre"
set PATH="C:\Program Files\Java\jdk1.7.0_80\bin";$PATH
set SDK_HOME="C:\Program Files\Java\jdk1.7.0_80"

set _JAVA_OPTIONS="-XX:-UseSplitVerifier"




:: rm instrumented/pt/ulisboa/tecnico/cnv/server/*class
:: rm instrumented/pt/ulisboa/tecnico/cnv/util/*class
:: rm instrumented/pt/ulisboa/tecnico/cnv/solver/*class
:: rm project/pt/ulisboa/tecnico/cnv/server/*class
:: rm project/pt/ulisboa/tecnico/cnv/util/*class
:: rm project/pt/ulisboa/tecnico/cnv/solver/*class


javac project\pt\ulisboa\tecnico\cnv\server\*.java 2>>errr.file
javac project\pt\ulisboa\tecnico\cnv\util\*.java
javac project\pt\ulisboa\tecnico\cnv\solver\*.java


:: java ICount project/pt/ulisboa/tecnico/cnv/solver/ instrumented/pt/ulisboa/tecnico/cnv/solver/

java pt.ulisboa.tecnico.cnv.server.WebServer


pause