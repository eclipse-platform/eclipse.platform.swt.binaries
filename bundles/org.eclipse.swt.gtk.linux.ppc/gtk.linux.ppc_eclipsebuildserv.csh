echo Building LINUX PPC GTK

# These variables must be set to reflect the compilation context
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/IBMJava2-ppc-142
setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/mozilla/1.7/ppc/mozilla/dist/sdk
setenv XULRUNNER_SDK /bluebird/teamswt/swt-builddir/xulrunner/1.8.1.1/ppc/mozilla/dist/sdk/
setenv CAIROPATH /bluebird/teamswt/swt-builddir/cairo/ppc/cairo-1.0.2/lib/pkgconfig/

setenv MOZILLA_INCLUDES "-include ${MOZILLA_SDK}/include/mozilla-config.h -I${MOZILLA_SDK}/include"
setenv MOZILLA_LIBS "-L${MOZILLA_SDK}/lib -L${MOZILLA_SDK}/bin -lxpcom -lnspr4 -lplds4 -lplc4"
setenv XULRUNNER_INCLUDES "-include ${XULRUNNER_SDK}/include/mozilla-config.h -I${XULRUNNER_SDK}/include"
setenv XULRUNNER_LIBS "-L${XULRUNNER_SDK}/lib -lxpcomglue"
setenv MODEL ppc

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla make_xulrunner make_xpcominit install

setenv PKG_CONFIG_PATH ${CAIROPATH}
sh build.sh clean
sh build.sh install
