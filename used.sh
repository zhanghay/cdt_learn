#!/bin/bash

# 定义输出的csv文件名
csv_file="system_info.csv"
echo "now_time,cpu_usage,mem_used,swap_used" >> $csv_file
while true
do
    # 获取当前时间，并将其格式化为年月日时分秒的形式
    now_time=$(date "+%Y-%m-%d %H:%M:%S")

    # 获取cpu占用率，内存使用量和交换空间使用量
    cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2}')
    mem_used=$(free -m | awk '/内存/ {print $3}')
    swap_used=$(free -m | awk '/交换/ {print $3}')

    # 将获取到的信息写入csv文件中，以逗号分隔
    echo "$now_time,$cpu_usage,$mem_used,$swap_used" >> $csv_file

    # 休眠2秒
    sleep 2
done
