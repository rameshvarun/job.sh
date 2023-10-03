#!/usr/bin/env bash
set -e
eval "$(cat ../job.sh)"

job_submit time ./bad-job.sh
job_submit time ./good-job.sh
job_wait