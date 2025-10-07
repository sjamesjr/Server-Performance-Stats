#/bin/bash

#
# server-stats.sh - Basic server performance monitoring script

echo "=====Server Performance Stats====="

# CPU usage
echo "====CPU Usage===="

top -l 1 | grep "CPU usage" | awk '{print "Total CPU Usage: " 100 - $7 "%"}'

echo "====Memory Usage===="

# Reports total memory usage on macOS (Darwin) servers in MB and %

page_size=$(sysctl -n hw.pagesize); vm_stat | awk -v page_size="$page_size" '
/Pages free/         {free=$2}
/Pages active/       {active=$2}
/Pages inactive/     {inactive=$2}
/Pages speculative/  {spec=$2}
/Pages wired down/   {wired=$4}
END {
  gsub(/\./,"",free); gsub(/\./,"",active); gsub(/\./,"",inactive); gsub(/\./,"",spec); gsub(/\./,"",wired);
  total=(active+inactive+spec+wired+free)*page_size;
  used=(active+inactive+spec+wired)*page_size;
  if (total == 0) { print "Error: No memory data available"; exit }
  printf("Memory_Used=%.0fMB Memory_Total=%.0fMB Usage=%.2f%%\n", used/1048576, total/1048576, used/total*100);
}'

echo "Memory_Used=${used_mb}MB Memory_Total=${total_mb}MB Usage=${usage_percent}%"

echo "====Disk Usage===="

df -H / | awk 'NR==2 {printf("Disk_Used= %s Disk_Total= %s Usage= %s\n", $3, $2, $5)}'

echo "====Top 5 Processes===="

ps -Ao pid,comm,pcpu | sort -nrk 3 | head -n 6

echo "====Top 5 Processes by Memory"

ps -Ao pid,comm,rss | sort -nrk 3 | head -n 6





