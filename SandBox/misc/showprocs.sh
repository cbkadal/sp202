# Wed 07 Oct 2020 12:30:21 PM WIB

cd /proc
echo "head -20 cpuinfo"
sleep 1; echo "====    ====    ====    ===="
head -20 cpuinfo
sleep 3; echo "====    ====    ====    ===="
echo "head -20 meminfo"
sleep 1; echo "====    ====    ====    ===="
head -20 meminfo
sleep 3; echo "====    ====    ====    ===="
echo "cat uptime"
sleep 1; echo "====    ====    ====    ===="
cat uptime
sleep 3; echo "====    ====    ====    ===="
echo "cat version"
sleep 1; echo "====    ====    ====    ===="
cat version
sleep 3; echo "====    ====    ====    ===="
echo "head -20 modules"
sleep 1; echo "====    ====    ====    ===="
head -20 modules
sleep 3; echo "====    ====    ====    ===="
echo "cat partitions"
sleep 1; echo "====    ====    ====    ===="
cat partitions
sleep 3; echo "====    ====    ====    ===="
echo "cat sys/fs/file-max"
sleep 1; echo "====    ====    ====    ===="
cat sys/fs/file-max
sleep 3; echo "====    ====    ====    ===="
exit 0

