# Dockerfile - VERSIÓN FINAL BASADA EN IMAGEN OFICIAL SDXL
# Partimos de una imagen oficial que ya tiene ComfyUI, el worker y el modelo SDXL base.
FROM runpod/worker-comfyui:3.0.0-sdxl

# Instalar git-lfs para poder clonar tu modelo
RUN apt-get update && apt-get install -y git-lfs && rm -rf /var/lib/apt/lists/*

# --- NUESTRA ÚNICA MODIFICACIÓN: AÑADIR TU MODELO ---
WORKDIR /comfyui/models/diffusers
RUN git lfs install && \
    git clone https://huggingface.co/Odreman/SkinGen_Fortnite_SDXL v1x0_fortnite_humanoid_sdxl1_vae_fix-000005
# ---------------------------------------------------

# El handler y sus requisitos ya están en la imagen base,
# pero si tuvieras un handler personalizado, lo copiarías aquí.
# WORKDIR /
# COPY rp_handler.py .
# COPY requirements.txt .
# RUN pip install -r requirements.txt