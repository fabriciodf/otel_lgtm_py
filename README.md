# 📦 FastAPI + OpenTelemetry + LGTM Stack (Grafana Observability)

This project demonstrates how to instrument a Python FastAPI application using **OpenTelemetry**, and export logs, metrics, and traces to a local [**Grafana LGTM stack**](https://grafana.com/oss/lgtm-stack/) via OTLP.

---

## 🔭 Stack Overview

- ⚙️ **FastAPI** app with OpenTelemetry instrumentation  
- 📦 **Grafana OTEL-LGTM Docker image** for observability pipeline:
  - **Loki** for logs
  - **Grafana** for dashboards
  - **Tempo** for traces
  - **Mimir** for metrics
- 🚀 Deployment via `docker-compose`
- 🛠️ Includes `run.sh` automation script

---

## 🚀 Getting Started

### 1. Clone this repository

```bash
git clone git@github.com:fabriciodf/otel_lgtm_py.git
cd otel_lgtm_py
```

#### 2. Run the stack
```bash
chmod +x run.sh
./run.sh
```

This will:
- Remove existing containers/images
- Build your FastAPI image
- Start the FastAPI app and LGTM stack via Docker

### 3. Access the stack

- 🧪 FastAPI: http://localhost:8000
- 📊 Grafana: http://localhost:3000
- Login: admin / admin

### 4. 🌐 Telemetry Details
The FastAPI container is instrumented with:

```env

OTEL_EXPORTER_OTLP_ENDPOINT=http://otel-lgtm:4317
OTEL_SERVICE_NAME=fastapi-otel
OTEL_TRACES_EXPORTER=otlp
OTEL_METRICS_EXPORTER=otlp
OTEL_LOGS_EXPORTER=otlp
```

OpenTelemetry sends:
Logs → Loki
Traces → Tempo
Metrics → Mimir

All visualized via Grafana dashboards

### 5.  📁 Project Structure
```arduino
.
├── Dockerfile
├── docker-compose.yml
├── main.py
├── run.sh
└── requirements.txt
```

### 6.  🛠️ Built With

FastAPI
OpenTelemetry Python SDK
Grafana LGTM Docker image
Docker Compose

### 7.  📜 License
MIT License © fabriciodf
