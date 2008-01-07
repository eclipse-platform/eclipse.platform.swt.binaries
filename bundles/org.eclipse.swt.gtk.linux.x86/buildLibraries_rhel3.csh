# This file should be run on RHEL3

# Use buildLibraries_rhel4.csh to compile and release only these 3 libraries:
#   libswt-mozilla-gtk-XXXX.so
#   libswt-xpcominit-gtk-XXXX.so
#   libswt-xulrunner-gtk-XXXX.so
# Use this file (buildLibraries_rhel3.csh) to compile and release the remaining libraries

echo Building LINUX X86 GTK on RHEL3

# These variables must be set to reflect the compilation context
setenv CAIROPATH /usr/local/cairo-1.0.2/lib/pkgconfig/
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/IBMJava2-141
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.4/linux_gtk2/mozilla/dist/sdk

setenv GCC_VERSION -gcc3
setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/mozilla-config.h -I${MOZILLA_SDK}/../include/xpcom -I${MOZILLA_SDK}/../include/nspr -I${MOZILLA_SDK}/../include/embed_base -I${MOZILLA_SDK}/../include/embedstring -I${MOZILLA_SDK}/../include/string"
setenv MOZILLA_LIBS "${MOZILLA_SDK}/../lib/libembedstring.a -L${MOZILLA_SDK}/../bin -L${MOZILLA_SDK}/../lib/ -lxpcom -lnspr4 -lplds4 -lplc4"

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla install

setenv PKG_CONFIG_PATH ${CAIROPATH}
sh build.sh clean
sh build.sh make_cairo install
setenv PKG_CONFIG_PATH
