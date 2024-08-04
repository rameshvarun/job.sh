# job.sh

Helper functions for running bash script tasks in parallel.

```bash
#!/usr/bin/env bash
source ./job.sh

job_submit sleep 5
job_submit sleep 10
job_wait
```
