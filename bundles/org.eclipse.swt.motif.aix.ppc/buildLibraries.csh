echo Building AIX PPC Motif

# These variables must be set to reflect the compilation context
setenv JAVA_HOME /bluebird/teamswt/swt-builddir/aixj9
setenv MOTIF_HOME /bluebird/teamswt/swt-builddir/motif21/
setenv CDE_HOME /usr/dt/
setenv LANG en_US

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
