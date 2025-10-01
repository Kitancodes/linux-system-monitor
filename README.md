# Linux System Health Monitor

## Overview
This repository contains scripts to monitor the health of a Linux system node. 
There are two versions of the monitoring scripts:

1. **Basic Monitor** - provides disk usage, memory usage, CPU load, and top processes.
2. **Enhanced Monitor** - includes logging, threshold warnings for disk and memory usage, CPU core count, and recent system errors.

Older versions of the scriots are archived in the `archive/` folder.

---

## Project Structure
linux-system-monitor/
archive/ # Old monitoring scripts
backuup.sh
enhanced-monitor.sh
monitor.sh
old_README.md
scripts/ #New monitoring scripts
basic-NodeHealth.sh
enhanced-NodeHealth.sh
README.md # This file

---

## Usage
### 1. Basic Monitor
- Navigate to the `scripts/` folder:
   ```bash
   cd scripts
- Make the sript executable (if not already):
   ```bash 
chmod +x basic-NodeHealth.sh
- Run the script:
   ```bash
./basic-NodeHealth.sh

### 2. Enhanced Monitor
- Navigate to the `scripts/` folder:
   ```bash
   cd scripts
- Make the script executable:
   ```bash
chmod +x enhanced-NodeHealth.sh
- Run the script:
   ```bash
./enhanced-NodeHealth.sh
- Check the log file created in your home directory for detailed reports:
   ```bash
ls ~ | grep system_health_
cat ~/system_health_<timestamp>.log

## What They Do
### Basic Monitor
1. Shows disk usage (df -h)
2. Shows memory usage (free -h)
3. Displays CPU load (uptime) 
4. Shows top 5 processes by CPU usage (ps)

### Enhanced Monitor
1. Everything in Basic Monitor
2. Logs output to a timestamped log file
3. Alerts if disk usage >90% or memory usage >80%
4. Displays number of CPU cores (nproc)
5. Shows recent system errors (journalctl -p 3 and /var/log/syslog if available)

## Next Steps
1. Optionally, schedule these scripts with cron for automatic monitoring.
2. Extend the enhanced monitor to send email alerts when thresholds are exceeded. 

## Notes
1. All old scripts and previous versions are arranged in the archive/ folder.
2. New scripts are located in the scripts/ folder and represent the current working versions. 
