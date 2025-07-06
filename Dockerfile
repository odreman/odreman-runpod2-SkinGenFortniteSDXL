# Dockerfile - VERSIÓN FINAL CON CLONACIÓN CORREGIDA
FROM runpod/worker-comfyui:5.1.0-sdxl

# Instalar git-lfs para poder clonar tu modelo
RUN apt-get update && apt-get install -y git-lfs && rm -rf /var/lib/apt/lists/*

# --- CORRECCIÓN EN LA CLONACIÓN DEL MODELO ---
WORKDIR /comfyui/models/diffusers

RUN git lfs install && \
    # 1. Clonamos el repo en una carpeta temporal
    git clone https://huggingface.co/Odreman/SkinGen_Fortnite_SDXL /tmp/skin-gen-model && \
    # 2. Movemos la subcarpeta del modelo a la ubicación actual (.)
    mv /tmp/skin-gen-model/v1x0_fortnite_humanoid_sdxl1_vae_fix-000005 . && \
    # 3. Limpiamos la carpeta temporal
    rm -rf /tmp/skin-gen-model
# -----------------------------------------------