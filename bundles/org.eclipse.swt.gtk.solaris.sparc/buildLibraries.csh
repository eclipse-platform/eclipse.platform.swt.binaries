echo Building SOLARIS SPARC GTK

# These variables must be set to reflect the compilation context
setenv CAIROPATH /usr/local/cairo-1.4.6/lib/pkgconfig/
setenv CCPATH /export/home/SUNWspro/bin

setenv CC cc
setenv CDE_HOME /usr/dt
setenv JAVA_HOME /usr/j2se
setenv PATH ${CCPATH}:/usr/ccs/bin:/usr/local/bin:${PATH}
setenv PKG_CONFIG_PATH ${CAIROPATH}

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
