# This file should be run on Solaris x86

# Use this file (buildLibraries.csh) to compile and release all libraries for Solaris x86

echo Building Solaris x86 GTK

# These variables must be set to reflect the compilation context
setenv CC cc
setenv CXX CC

setenv JAVA_HOME /bluebird/teamswt/swt-builddir/IBMJava2-141
setenv MOZILLA_SDK /bluebird/teamswt/bog/mozilla/solaris_x86/1.7/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/xulrunner/1.8.0.1/solaris-x86/mozilla/dist/sdk

setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/include/mozilla-config.h -I${MOZILLA_SDK}/include"
setenv MOZILLA_LIBS "-L${MOZILLA_SDK}/lib -L${MOZILLA_SDK}/bin -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla install
