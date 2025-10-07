# Server-Performance-Stats Script
Goal of this project is to write a script to analyze server performance stats.

`server-stats.sh` is a lightweight Bash script designed for macOS servers (Darwin) to provide basic performance metrics including CPU usage, memory usage, disk usage, and top processes. This can be useful for quick health checks or routine monitoring.

---

## Features

- Displays **total CPU usage**.
- Reports **memory usage** in MB and as a percentage.
- Shows **disk usage** of the root (`/`) filesystem.
- Lists the **top 5 processes by CPU usage**.
- Lists the **top 5 processes by memory usage**.

---

## Requirements

- macOS (Darwin)
- Bash shell
- Standard system tools: `top`, `awk`, `df`, `ps`, `sysctl`, `vm_stat`

---

## Usage

1. Clone or download the script to your server:

   ```bash
   curl -O <script_url>/server-stats.sh
   
https://roadmap.sh/projects/server-stats
