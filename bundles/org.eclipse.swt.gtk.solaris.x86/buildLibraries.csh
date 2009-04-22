# This file should be run on RHEL4

# Use this file (gtk.linux.x86_rhel4.csh) to compile and release only these 3 libraries:
#   libswt-mozilla-gtk-XXXX.so
#   libswt-xpcominit-gtk-XXXX.so
#   libswt-xulrunner-gtk-XXXX.so
# Use gtk.linux.x86_rhel3.csh to compile and release the remaining libraries

echo Building Mozilla X86 GTK on RHEL4

# These variables must be set to reflect the compilation context
setenv CXX g++

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
