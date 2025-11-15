# 📘 **Finetuning-on-Azure (Az-SFT)**

A serverless Generative AI platform on Azure built with Terraform, Azure Machine Learning, Azure Functions, API Management, Cosmos DB, and Blob Storage.
This project enables scalable LLM fine-tuning and inference with enterprise-grade governance, cost efficiency, and unified monitoring.

---

## 🚀 **Overview**

**Az-SFT** is a modular, production-scalable implementation of a fine-tuning and inference pipeline for Large Language Models (LLMs) on Azure.
It is designed to demonstrate:

* Azure ML–based fine-tuning workflows
* Serverless inference (Functions + APIM)
* Token & cost logging using Cosmos DB
* Infrastructure-as-Code using Terraform
* Full observability and governance controls

This repository serves both as a **learning blueprint** and a **deployable GenAI platform foundation** for Azure.

---

## 📂 **Repository Structure**

```text
Az-SFT/
├── README.md                 # Project overview
│
├── app/                      # Inference orchestration (Azure Functions)
│   ├── orchestrator/         # main.py -> handles requests, calls AML endpoint
│   └── utils/                # shared helpers (logging, config, clients)
│
├── ci-cd/                    # Deployment automation
│   ├── ado/                  # Azure DevOps pipelines
│   └── github-actions/       # GitHub Actions workflows
│
├── configs/                  # API schemas & config templates
│   ├── apim/                 # APIM policies (rate limits, auth, transforms)
│   ├── app/                  # Non-secret app configs per environment
│   └── schema/               # Contract definitions (OpenAPI/JSON schema)
│
├── docs/                     # Architecture, design, and operations
│
├── infra/                    # Terraform Infrastructure-as-Code
│   ├── envs/
│   │   └── dev/              # Dev environment root configuration
│   └── modules/              # Reusable Terraform modules
│       ├── apim/             # API Management
│       ├── azureml/          # Azure ML workspace, compute, registry
│       ├── core/             # Resource group, tags, Key Vault, logs
│       ├── cosmosdb/         # Token & cost logging
│       ├── functionapp/      # Serverless function hosting
│       ├── monitor/          # Alerts, dashboards, diagnostic settings
│       ├── networking/       # Optional networks + private endpoints
│       └── storage/          # Blob storage for AML + data
│
└── ml/                       # Machine Learning engineering
    ├── endpoints/
    │   └── scoring/          # Scoring script for AML online endpoints
    ├── model-registry/       # Model metadata & versioning history
    └── training/
        ├── data/             # Training datasets
        ├── notebooks/        # Jupyter experiments
        │   └── experiments.ipynb
        ├── pyproject.toml    # Optional Python project config
        ├── requirements.txt  # ML dependencies
        └── scripts/
            └── training.py    # Fine-tuning & training logic
```
python3 -m venv .venv --prompt "Az-SFT"
---

## 🧩 **High-Level Flow**

```mermaid
flowchart LR
    subgraph Training
        D["Data"] --> J["Azure ML Training Job"]
        J --> MR["Model Registry"]
        MR --> DEP["Online Endpoint"]
    end

    subgraph Inference
        C["Client"] --> APIM["APIM"]
        APIM --> FUNC["Function App"]
        FUNC --> EP["AML Endpoint"]
        EP --> COSMOS["Cosmos DB"]
        COSMOS --> LA["Log Analytics"]
        EP --> RSP["Response"]
    end
```

---

## 🎯 **Core Capabilities Demonstrated**

### **🔹 ML Engineering**

* LLM fine-tuning using Azure ML jobs & compute
* Notebook-driven experimentation
* Endpoint deployment (online/batch)
* Scoring script architecture

### **🔹 Application Layer**

* Azure Functions as inference orchestrator
* Integration with Azure ML endpoints
* Error handling, request validation, logging

### **🔹 Cloud Architecture**

* Multi-environment Terraform IaC
* Modular resource design
* Secure secret management with Key Vault
* APIM for authentication, throttling, rate limits

### **🔹 FinOps, Governance & Monitoring**

* Token usage logging in Cosmos DB
* Cost attribution per request
* Log Analytics dashboards
* Diagnostic settings + Azure Monitor alerts

---

## 🛠️ **Roadmap**

* [ ] Provision dev infrastructure using Terraform
* [ ] Create Azure ML workspace & compute cluster
* [ ] Run first fine-tuning experiment
* [ ] Deploy online inference endpoint
* [ ] Implement orchestrator Function → AML Endpoint integration
* [ ] Configure Cosmos DB token logging
* [ ] Build APIM layer with policies
* [ ] Enable dashboards & alerts in Log Analytics
* [ ] Extend to UAT and PROD environments
