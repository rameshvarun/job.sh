#!/usr/bin/env bash

declare -a JOB_PIDS=()
declare -a JOB_NAMES=()
declare -a JOB_OUTPUTS=()

function job_submit() {
    echo "Running job in background: $@"

    output_file="$(mktemp)"
    ( "$@" &> $output_file ) &

    JOB_PIDS+=($!)
    JOB_NAMES+=("'$*'")
    JOB_OUTPUTS+=("$output_file")
}

function job_wait() {
    num_jobs="${#JOB_PIDS[@]}"
    encountered_error=false

    echo "Waiting for $num_jobs jobs to complete..."

    for (( i=0; i<${num_jobs}; i++ )); do
        error_code=0

        wait ${JOB_PIDS[i]} || error_code=$?
        
        if [[ $error_code -ne 0 ]]; then
            encountered_error=true
        fi

        echo "Job ${JOB_NAMES[i]} exited with code $error_code..."
        cat "${JOB_OUTPUTS[i]}"
    done

    if [[ $encountered_error == true ]]; then
        echo "One or more jobs failed!"
        exit 1
    fi
}

