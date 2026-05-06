# Dom Proteomics — Sample Metadata (SORL1 xenograft microglia)

## Experiment

Human iPSC-derived microglia xenografted into App NL-G-F Alzheimer's disease mice.
Microglia FACS-sorted as cell pellets; SORL1 genotype WT or KO (HET not in this batch).

- **Source metadata:** `/camp/home/zanettc/home/shared/0simpsod/Proteomics/2026_04_25_sorl1_xenograft_microglia_bulk_proteomics/ips_microglia_xenograft_proteomics_metadata.csv`
- **Primary file (run1 QC):** `20260423_094931_S5-A10_Report_human.tsv` — S5 batch, 8 samples, searched against human proteome
- **Input alias:** `/nemo/lab/destrooperb/home/shared/zanettc/dom_proteomics/data/inputs/2026_04_23_SORL1_mg_total_proteomics`
- **Original data path:** `/camp/home/zanettc/home/data/STPs/proteomics/inputs/Dom/2026_04_23_SORL1_mg_total_proteomics`

## Sample table — S5 batch (EXP1.1 cohort, run1 QC)

| ShortName   | R.FileName              | Mouse_ID    | Sex    | SORL1 Genotype | App Genotype | CellCount |
|-------------|-------------------------|-------------|--------|----------------|--------------|-----------|
| BDAG171.1c  | ds12_S5-A1_1_6411       | BDAG171.1c  | Male   | WT             | NL-G-F       | 154,300   |
| BDAG171.1d  | ds11_S5-A2_1_6412       | BDAG171.1d  | Male   | WT             | NL-G-F       | 143,900   |
| BDAG171.1a  | ds22_S5-A3_1_6413       | BDAG171.1a  | Male   | WT             | NL-G-F       | 463,400   |
| BDAG171.1b  | ds21_S5-A4_1_6414       | BDAG171.1b  | Male   | WT             | NL-G-F       | 69,340    |
| BDAG173.1e  | ds51_S5-A9_1_6421       | BDAG173.1e  | Female | KO             | NL-G-F       | 141,800   |
| BDAG173.1f  | ds51_S5-A10_1_6422      | BDAG173.1f  | Female | KO             | NL-G-F       | 209,800   |
| BDAG173.1b  | ds61_S5-A11_1_6423      | BDAG173.1b  | Male   | KO             | NL-G-F       | 95,890    |
| BDAG173.1a  | ds62_S5-A12_1_6424      | BDAG173.1a  | Male   | KO             | NL-G-F       | 237,400   |

**WT:** BDAG171 mice (all Male, EXP1.1)  
**KO:** BDAG173 mice (2 Male + 2 Female, EXP1.1)

## Naming discrepancies (in source data)

1. **BDAG173.1f / ds52**: Study metadata lists prefix `ds52` and plate well A10, but Spectronaut recorded this sample as `ds51_S5-A10_1_6422`. Both "ds51" entries are disambiguated in the notebook by their full FileName (plate position).
2. **BDAG173.1a/1b plate wells**: Metadata lists ds62→A11 and ds61→A12, but filenames show ds62→A12 and ds61→A11. Matched by `Sample_file_prefix` column in the metadata CSV.

## Samples NOT in this file (HET cohort, EXP1.2)

| Mouse_ID    | Sex  | SORL1 Genotype | Metadata prefix |
|-------------|------|----------------|-----------------|
| BDAG174.1a  | Male | HET            | ds32            |
| BDAG174.1b  | Male | HET            | ds31            |
| BDAG174.1c  | Male | HET            | ds42            |
| BDAG174.1d  | Male | HET            | ds41            |

Also in the data folder: `20260423_151654_49982.d_Report.tsv` (S4 batch, 17 samples with explicit wt/het/ko labels — separate experiment or earlier run, not analysed in run1).

## Notes

- All samples stored at -70°C; frozen ~6 months prior to proteomics.
- Residual buffer: PBS + 2% BSA + 2 mM EDTA (FACS buffer).
- BDAG171.1b has very low cell count (69,340) — watch for elevated % missing.
- Downstream differential analysis: WT vs KO comparison (n=4 per genotype, sex is a potential confound given KO has mixed sex).
