# This file should be run on RHEL3

# run the replace.32.to.64 and build.cfiles targets in the build.xml ant script first

# Use gtk.linux.x86_64_rhel4.csh to compile and release only these 3 libraries:
#   libswt-mozilla-gtk-XXXX.so
#   libswt-xpcominit-gtk-XXXX.so
#   libswt-xulrunner-gtk-XXXX.so
# Use this file (gtk.linux.x86_64_rhel3.csh) to compile and release the remaining libraries

echo Building LINUX X86 GTK on RHEL3

# These variables must be set to reflect the compilation context
setenv CAIROPATH /usr/local/cairo-1.0.2/lib/pkgconfig
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/jdk1.5.0
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.7/amd64/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/xulrunner/1.8.0.1/amd64/mozilla/dist/sdk/

setenv PKG_CONFIG_PATH /usr/lib64/pkgconfig
setenv GCC_VERSION -gcc3
setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/include/mozilla-config.h -I${MOZILLA_SDK}/include"
setenv MOZILLA_LIBS "-L${MOZILLA_SDK}/lib -L${MOZILLA_SDK}/bin -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"

cd src/bin/library/
sh build.sh clean
sh build.sh

# See Bug 84673
sh build.sh make_mozilla
cp lib* ../../../.
setenv PKG_CONFIG_PATH ${CAIROPATH}
sh build.sh clean
sh build.sh make_cairo
cp lib* ../../../.
setenv PKG_CONFIG_PATH

#cd ../../../
#rm swt.jar
#rm -rf @dot
#rm -rf src
#rm -rf temp.folder
