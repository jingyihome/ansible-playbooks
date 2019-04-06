#!/bin/sh
#
#    create dynamic MOTD
#    Copyright (c) 2015 Lorenzo Gaggini
#
#    Authors: Lorenzo Gaggini <lg@lgaggini.net>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

cpu=`cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d':' -f2 | sed 's/^ *//g'`
ram=`free -m | head -n 2 | tail -n 1 | awk {'print $2'}`MB
kernel=`uname -srmo`
os=`command -v lsb_release && lsb_release -s -d` || os=`cat /etc/redhat-release`
load=`cat /proc/loadavg | awk '{print $1}'`
root_usage=`df -h / | awk '/\// {print $(NF-1)}'`
srv_usage=`df -h /srv | awk '/\// {print $(NF-1)}'`
memory_usage=`free -m | awk '/Mem:/ { total=$2 } /Mem:/ { used=$3 } END { printf("%3.1f%%", used/total*100)}'`
swap_usage=`free -m | awk '/Swap:/ { total=$2 } /Swap:/ { used=$3 } END { printf("%3.1f%%", used/total*100)}'`
time=`uptime | grep -ohe 'up .*' | sed 's/,/\ hours/g' | awk '{ printf $2" "$3 }'`
processes=`ps aux | wc -l`
ip=`hostname -I | awk '{print $1}'`

figlet -f basic $(hostname) | head -7
echo "%+++++++++++++++++++++ SYSTEM INFO +++++++++++++++++++++%"
printf "Cpu:\t%s\n" "$cpu"
printf "Ram:\t%s\n" "$ram"
printf "Kernel:\t%s\n" "$kernel"
printf "Os:\t%s\n" "$os"
echo
echo "%++++++++++++++++++++ SYSTEM STATUS ++++++++++++++++++++%"
printf "System load:\t%s\tUptime:\t\t%s\n" $load "$time"
printf "Memory usage:\t%s\tSwap usage:\t%s\n" $memory_usage $swap_usage
printf "Usage on /:\t%s\tUsage on /srv:\t%s\n" $root_usage $srv_usage
printf "Processes:\t%s\tIP Address:\t%s\n" $processes $ip 
echo
echo %++++++++++++++++++++ SYSTEM MESSAGE +++++++++++++++++++%
echo "Enjoy your hack free as in freedom"
printf "\n"
