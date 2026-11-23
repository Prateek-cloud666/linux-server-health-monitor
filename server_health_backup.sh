#1/bin/bash

echo "======================================"
echo "LINUX SERVER HEALTH REPORT"
echo "======================================"
#!/bin/bash

echo "===== SERVER HEALTH REPORT ====="

echo ""
echo "DATE AND TIME"
date

echo ""
echo "RAM INFORMATION"
free -h

echo ""
echo "DISK INFORMATION"
df -h

echo ""
echo "SYSTEM UPTIME"
uptime

echo ""
echo "TOP 5 MEMORY USING PROCESSES"
ps aux --sort=-%mem | head -n 6

echo ""
echo "===== REPORT COMPLETED ====="

