#!/bin/bash
# Submit one SLURM job per notebook, with 03_DE_plots chained on 02_msstats.
#
# Run from project root: bash scripts/submit_renders.sh

set -euo pipefail

PROJECT_ROOT="/nemo/lab/destrooperb/home/shared/zanettc/dom_proteomics"
LOG_DIR="${PROJECT_ROOT}/logs/renders"
mkdir -p "${LOG_DIR}"

submit() {
    local name="$1" qmd="$2" mem="$3" hours="$4" dep="${5:-}"
    local dep_arg=""
    [[ -n "${dep}" ]] && dep_arg="--dependency=afterok:${dep}"

    sbatch --parsable ${dep_arg} \
        --job-name="qr_${name}" \
        --partition=ncpu \
        --cpus-per-task=4 \
        --mem="${mem}G" \
        --time="${hours}:00:00" \
        --output="${LOG_DIR}/${name}_%j.log" \
        --error="${LOG_DIR}/${name}_%j.log" \
        --chdir="${PROJECT_ROOT}" \
        --wrap="set -euo pipefail; module load R/4.5; module load quarto; echo host=\$(hostname); echo start=\$(date -Is); quarto render '${qmd}'; echo end=\$(date -Is)"
}

log() { printf '  %-20s  jobid=%s%s\n' "$1" "$2" "${3:+  (after $3)}"; }

echo "=== Independents ==="
J01=$(submit dom_01_qc      notebooks/01_initial_qc.qmd  64 4); log dom_01_qc      "${J01}"
J02=$(submit dom_02_msstats notebooks/02_msstats.qmd     96 8); log dom_02_msstats "${J02}"

echo "=== Dependent on 02 (${J02}) ==="
J03=$(submit dom_03_de_plots notebooks/03_DE_plots.qmd   64 4 "${J02}"); log dom_03_de_plots "${J03}" "${J02}"

echo
echo "Watch:  squeue -u \$USER -o '%.12i %.22j %.2t %.10M %R'"
echo "Logs :  ${LOG_DIR}"
