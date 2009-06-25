echo Building SOLARIS SPARC GTK

# These variables must be set to reflect the compilation context
setenv CAIROPATH /usr/local/cairo-1.4.10/lib/pkgconfig/
setenv CCPATH /export/home/SUNWspro/bin

setenv CC cc
setenv CXX CC
setenv CDE_HOME /usr/dt
setenv JAVA_HOME /usr/j2se
setenv PATH ${CCPATH}:/usr/ccs/bin:/usr/local/bin:${PATH}
setenv PKG_CONFIG_PATH ${CAIROPATH}

setenv MOZILLA_SDK /bluebird/teamswt/swt-builddir/geckoSDK/1.4/gecko-sdk
setenv MOZILLA_INCLUDES "-I${MOZILLA_SDK} -I${MOZILLA_SDK}/xpcom/include -I${MOZILLA_SDK}/nspr/include -I${MOZILLA_SDK}/embed_base/include -I${MOZILLA_SDK}/embedstring/include -I${MOZILLA_SDK}/string/include"
setenv MOZILLA_LIBS "${MOZILLA_SDK}/embedstring/bin/libembedstring.a -L${MOZILLA_SDK}/xpcom/bin -L${MOZILLA_SDK}/nspr/bin -lxpcom -lnspr4 -lplds4 -lplc4"

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla install
