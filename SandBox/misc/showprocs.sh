# Wed 07 Oct 2020 12:30:21 PM WIB

cd /proc
echo "head -20 cpuinfo"
head -20 cpuinfo
sleep 3; echo "====    ====    ====    ===="
echo "head -20 meminfo"
head -20 meminfo
sleep 3; echo "====    ====    ====    ===="
echo "head -20 uptime"
head -20 uptime
sleep 3; echo "====    ====    ====    ===="
echo "head -20 version"
head -20 version
sleep 3; echo "====    ====    ====    ===="
echo "head -20 modules"
head -20 modules
sleep 3; echo "====    ====    ====    ===="
echo "head -20 partitions"
head -20 partitions
sleep 3; echo "====    ====    ====    ===="
echo "head -20 sys/fs/file-max"
head -20 sys/fs/file-max
sleep 3; echo "====    ====    ====    ===="
exit 0


