yum groupinstall "Development tools"
# yum install gcc
yum remove -y libxml2-devel
yum remove -y openssl-devel
yum remove -y libcurl4-openssl-dev #y
yum remove -y libpng-devel #y
yum remove -y readline-devel #y
yum remove -y libmcrypt #y
yum remove -y mcrypt #y
yum remove -y re2c #y
yum remove -y libzip-devel #y

#todo:
#WARNING: unrecognized options: --with-mcrypt


# LAST todo
#There are unfinished transactions remaining. You might consider running yum-complete-transaction, or "yum-complete-transaction --cleanup-only" and "yum history redo last", first to finish them. If those don't work you'll have to try removing/installing packages by hand (maybe package-cleanup can help).
#The program yum-complete-transaction is found in the yum-utils package.
#--> Running transaction check
#---> Package re2c.x86_64 0:0.14.3-2.el7 will be installed
#--> Finished Dependency Resolution
