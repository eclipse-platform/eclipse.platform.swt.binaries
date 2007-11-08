# This file should be run on RHEL4

# Use this file (motif.linux.x86_rhel4.csh) to compile and release only these 3 libraries:
#   libswt-mozilla-motif-XXXX.so
#   libswt-xpcominit-motif-XXXX.so
#   libswt-xulrunner-motif-XXXX.so
# Use motif.linux.x86_rhel3.csh to compile and release the remaining libraries

echo Building Mozilla X86 Motif on RHEL4

cd ../org.eclipse.swt/bin/library/
sh build.sh clean
sh build.sh make_mozilla make_xulrunner make_xpcominit install
