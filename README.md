# ML-Test-Audio 🎧🤖

This repository contains a machine learning project for **lung sound analysis**.\
The goal is to explore audio data from respiratory recordings, extract meaningful features, and build predictive models that can assist in the study of pulmonary health.

---

## 📂 Repository Structure

- `requirements.txt` → Python dependencies needed to run the notebook
- `setup_samay.sh` → Shell script to set up the environment automatically
- `test_development.ipynb` → Main Jupyter Notebook with the full pipeline (analysis, feature extraction, modeling, evaluation)

---

## ⚡ Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/RiMoMa/ML-Test-Audio.git
cd ML-Test-Audio
```

### 2. Run the setup script

This will create a virtual environment and install all dependencies:

```bash
bash setup_samay.sh
```

### 3. Activate the environment

```bash
source .venv/bin/activate
```

### 4. Start Jupyter

```bash
jupyter notebook
```

### 5. Open and run the notebook

Launch `test_development.ipynb` and execute all cells in order.
