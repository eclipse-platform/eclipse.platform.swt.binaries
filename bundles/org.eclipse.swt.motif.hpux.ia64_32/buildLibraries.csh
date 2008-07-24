echo Building HPUX PA_RISC Motif

setenv JAVA_HOME /opt/java1.5/
setenv AWT_HOME /opt/java1.5/jre/lib/IA64N/

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
