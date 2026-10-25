# ML-Test-Audio

Patient-level diagnosis classification (8 classes) from electronic-stethoscope lung sounds: an end-to-end pipeline from raw WAV files to tracked model comparison. Built as a time-boxed technical challenge on an open dataset.

## What it does

1. **Ingest and EDA**: parses the open lung-sound dataset (336 recordings from 112 patients, three filter modes each: EP, DP, BP; 4 kHz; Mendeley Data `jwyy9np4gv`), extracts labels from file names, flags malformed metadata and aggregates per patient.
2. **Signal inspection**: interactive waveform and spectrogram browser (mel, Morlet and Mexican-hat wavelets).
3. **Features**: MFCC and STFT statistics, plus entropy features following Fraiwan et al., with on-disk caching.
4. **Unsupervised view**: UMAP per patient and unsupervised feature reduction.
5. **Selection and models**: mRMR-style feature selection (mutual information minus redundancy), then Random Forest, KNN (leave-one-out) and four deep models (LSTM, BiGRU, Transformer, TimesNet).
6. **Experiment tracking**: every run logged to MLflow, with a final comparison table and confusion matrices.

## Results

Task: predict each patient's diagnosis (Normal, Asthma, Heart Failure, COPD, Pneumonia, Lung Fibrosis, BRON, Pleural Effusion). Features of the three recording modes are concatenated into one vector per patient, and the split is made on patients (89 train / 23 test, class-stratified), so no patient appears on both sides. With 23 test patients, treat these numbers as a baseline and not as clinical evidence.

| Model | Test accuracy | Test macro-F1 |
|---|---|---|
| Transformer | 0.78 | 0.44 |
| LSTM | 0.74 | 0.41 |
| Random Forest (mRMR + categorical) | 0.78 | 0.39 |
| TimesNet | 0.74 | 0.36 |
| KNN (mRMR + LOO) | 0.74 | 0.35 |
| BiGRU | 0.74 | 0.33 |

Macro-F1 is far below accuracy because the classes are imbalanced: Normal, Asthma and Heart Failure have 21-35 patients each, while Pneumonia, Lung Fibrosis, BRON and Pleural Effusion have between 2 and 6. With this much data the main takeaways are the pipeline and the evaluation setup, not the ranking of models.

## Run it

```bash
git clone https://github.com/RiMoMa/ML-Test-Audio.git
cd ML-Test-Audio
bash setup_env.sh              # creates a virtualenv and registers a Jupyter kernel
source audio-env/bin/activate
jupyter notebook test_development.ipynb
```

The notebook downloads the dataset on first run. MLflow runs are stored locally; start the UI with `mlflow ui`.

## Repository

- `test_development.ipynb`: full pipeline, with outputs from the original run
- `requirements.txt`: Python dependencies
- `setup_env.sh`: environment setup

## Limitations

- 112 patients and a 23-patient test split give wide uncertainty on every number above; a single split should be replaced by repeated or nested cross-validation.
- Each patient gets one label (the first listed diagnosis), so patients with several conditions are reduced to a single class.
- No clinical validation. Research and demonstration only.
