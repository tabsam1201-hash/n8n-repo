FROM node:20-alpine

# Timezone set karo
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000
ENV GENERIC_TIMEZONE=Asia/Kolkata

# FFmpeg, Python3, wget sab install karo
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    wget \
    curl \
    bash \
    su-exec \
    tini

# edge-tts install karo (FREE voice generator)
RUN python3 -m pip install --break-system-packages \
    edge-tts

# n8n install karo
RUN npm install -g n8n

# Data folder banao
RUN mkdir -p /data/youtube_automation

EXPOSE 10000

# n8n start karo
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
