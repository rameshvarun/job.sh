# job.sh

Helper functions for running bash script tasks in parallel.

```bash
#!/usr/bin/env bash
eval "$(curl -sSL https://raw.githubusercontent.com/rameshvarun/job.sh/main/job.sh)"

job_submit sleep 5
job_submit sleep 10
job_wait
```