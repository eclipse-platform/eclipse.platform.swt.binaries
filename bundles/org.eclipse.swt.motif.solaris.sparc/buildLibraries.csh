echo Building SOLARIS SPARC Motif

# These variables must be set to reflect the compilation context
setenv CCPATH /export/home/SUNWspro/bin
setenv PKG_CONFIG_PATH /usr/local/cairo-1.4.6/lib/pkgconfig/

setenv PATH ${CCPATH}:/usr/ccs/bin:${PATH}

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh install
