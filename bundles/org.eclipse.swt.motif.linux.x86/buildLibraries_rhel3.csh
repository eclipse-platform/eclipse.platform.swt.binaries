# This file should be run on RHEL3

# Use motif.linux.x86_rhel4.csh to compile and release only these 3 libraries:
#   libswt-mozilla-motif-XXXX.so
#   libswt-xpcominit-motif-XXXX.so
#   libswt-xulrunner-motif-XXXX.so
# Use this file (motif.linux.x86_rhel3.csh) to compile and release the remaining libraries

echo Building Linux X86 Motif on RHEL3

# These variables must be set to reflect the compilation context
setenv CAIROPATH /usr/local/cairo-1.0/lib/pkgconfig
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/IBMJava2-141
setenv MOTIF_HOME /bluebird/teamswt/swt-builddir/motif21
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.4/linux_gtk2/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/geckoSDK/1.8.0.4/gecko-sdk

setenv GCC_VERSION -gcc3
setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/mozilla-config.h -I${MOZILLA_SDK}/../include/xpcom -I${MOZILLA_SDK}/../include/nspr -I${MOZILLA_SDK}/../include/embed_base -I${MOZILLA_SDK}/../include/embedstring -I${MOZILLA_SDK}/../include/string"
setenv MOZILLA_LIBS "${MOZILLA_SDK}/../lib/libembedstring.a -L${MOZILLA_SDK}/../bin -L${MOZILLA_SDK}/../lib/ -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla install

setenv PKG_CONFIG_PATH ${CAIROPATH}
sh build.sh clean
sh build.sh make_cairo install
setenv PKG_CONFIG_PATH
