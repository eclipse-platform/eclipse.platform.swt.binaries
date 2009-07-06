echo Building AIX PPC Motif

# These variables must be set to reflect the compilation context
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/aixj9_r5
setenv AWT_HOME /bluebird/teamswt/swt-builddir/aixj9_r5/jre/bin
setenv MOTIF_HOME /bluebird/teamswt/swt-builddir/motif21
setenv PKG_CONFIG_PATH /usr/local/cairo1.6.0/lib/pkgconfig/

setenv LANG en_US

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
