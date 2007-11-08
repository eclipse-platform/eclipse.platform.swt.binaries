# This file should be run on RHEL4

# Use this file (gtk.linux.x86_rhel4.csh) to compile and release only these 3 libraries:
#   libswt-mozilla-gtk-XXXX.so
#   libswt-xpcominit-gtk-XXXX.so
#   libswt-xulrunner-gtk-XXXX.so
# Use gtk.linux.x86_rhel3.csh to compile and release the remaining libraries

echo Building Mozilla X86 GTK on RHEL4

# These variables must be set to reflect the compilation context
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/IBMJava2-141
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.4/linux_gtk2/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/geckoSDK/1.8.0.4/gecko-sdk

setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/mozilla-config.h -I${MOZILLA_SDK}/../include/xpcom -I${MOZILLA_SDK}/../include/nspr -I${MOZILLA_SDK}/../include/embed_base -I${MOZILLA_SDK}/../include/embedstring -I${MOZILLA_SDK}/../include/string"
setenv MOZILLA_LIBS "${MOZILLA_SDK}/../lib/libembedstring.a -L${MOZILLA_SDK}/../bin -L${MOZILLA_SDK}/../lib/ -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla make_xulrunner make_xpcominit install
