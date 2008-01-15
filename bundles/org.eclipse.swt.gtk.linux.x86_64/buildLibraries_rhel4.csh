# This file should be run on RHEL4

# Use this file (buildLibraries_rhel4.csh) to compile and release only these 3 libraries:
#   libswt-mozilla-gtk-XXXX.so
#   libswt-xpcominit-gtk-XXXX.so
#   libswt-xulrunner-gtk-XXXX.so
# Use buildLibraries_rhel3.csh to compile and release the remaining libraries

echo Building Mozilla X86_64 GTK on RHEL4

# These variables must be set to reflect the compilation context
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/jdk1.5.0
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.7/amd64/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/xulrunner/1.8.0.1/amd64/mozilla/dist/sdk/

setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/include/mozilla-config.h -I${MOZILLA_SDK}/include"
setenv MOZILLA_LIBS "-L${MOZILLA_SDK}/lib -L${MOZILLA_SDK}/bin -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"

cd src/bin/library/
sh build.sh clean
sh build.sh make_mozilla make_xulrunner make_xpcominit
cp lib* ../../../.
