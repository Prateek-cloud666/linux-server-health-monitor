#!/bin/bash

REPORT="health-report-$(date +%Y-%m-%d-%H%M%S).txt"

{
echo "======================================"
echo "       LINUX SERVER HEALTH REPORT"
echo "======================================"

echo ""
echo "DATE AND TIME"
date

echo ""
echo "CPU USAGE"
top -bn1 | grep "%Cpu(s)" | awk '{print 100 - $8 "%"}'
echo ""
echo "RAM INFORMATION"
free -h

echo "RAM USAGE PERCENTAGE"
free | awk '/Mem:/ {printf "%.1f%%\n", $3/$2 * 100}'
echo ""

echo "DISK INFORMATION"
df -h
echo ""
echo "DISK USAGE WARNING CHECK"
df -P / | awk 'NR==2 {gsub("%","",$5); if ($5 >= 80) print "WARNING: Disk usage is HIGH"; else print "OK: Disk usage is NORMAL"}'
echo ""

echo "SYSTEM UPTIME"
uptime

echo ""
echo "TOP 5 MEMORY USING PROCESSES"
ps aux --sort=-%mem | head -n 6

echo ""
echo "===== REPORT COMPLETED ====="

} | tee "$REPORT"

echo ""
echo "Report saved successfully: $REPORT"
