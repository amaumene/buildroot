while true ; do echo "Still building" ; sleep 60 ; done &
stupidpid=$!
echo 'Build buildroot'
make > >(tee build.log |grep '>>>') 2>&1
kill ${stupidpid}
echo 'Display end of log'
tail -1000 build.log
