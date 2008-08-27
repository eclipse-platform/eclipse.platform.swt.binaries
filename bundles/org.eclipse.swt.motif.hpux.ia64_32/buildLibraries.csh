echo Building HPUX PA_RISC Motif

setenv JAVA_HOME /opt/java1.5/

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
