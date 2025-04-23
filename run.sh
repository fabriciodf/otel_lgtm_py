#!/usr/bin/env bash


set -e  # Para o script falhar ao primeiro erro

COMPOSE_FILE="docker-compose.yml"
IMAGE_NAME="fastapi-otel-app"
SERVICE_NAME="fastapi-otel"
CONTAINERS=("fastapi-otel" "otel-lgtm")


echo "🧹 Removendo containers..."
for NAME in "${CONTAINERS[@]}"; do
  if docker ps -a --format '{{.Names}}' | grep -q "^${NAME}\$"; then
    echo "⛔ Parando e removendo container: $NAME"
    docker rm -f "$NAME"
  else
    echo "✅ Container $NAME não está em execução."
  fi
done

# Nomes das imagens a remover
IMAGES=("fastapi-otel-app-fastapi-otel" "grafana/otel-lgtm")

echo "🧹 Removendo imagens..."
for IMAGE in "${IMAGES[@]}"; do
  if docker images --format '{{.Repository}}:{{.Tag}}' | grep -q "^${IMAGE}:latest\$"; then
    echo "🗑️  Removendo imagem: $IMAGE:latest"
    docker rmi -f "${IMAGE}:latest"
  else
    echo "✅ Imagem $IMAGE:latest não encontrada."
  fi
done

echo "✅ Limpeza finalizada com sucesso!"

echo "🔧 Buildando imagem Docker personalizada: $IMAGE_NAME"
docker compose -f $COMPOSE_FILE build $SERVICE_NAME

echo "🧹 Removendo contêiner antigo, se existir"
docker compose -f $COMPOSE_FILE down --remove-orphans

echo "🚀 Subindo serviços com docker-compose"
docker compose -f $COMPOSE_FILE up -d

echo "✅ Tudo pronto!"
echo "🌐 FastAPI disponível em: http://localhost:8000"
echo "📊 Grafana disponível em: http://localhost:3000 (admin/admin)"
