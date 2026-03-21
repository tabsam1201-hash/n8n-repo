FROM n8nio/n8n:2.13.1

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000
ENV GENERIC_TIMEZONE=Asia/Kolkata

# Root user bano tools install karne ke liye
USER root

# FFmpeg, Python3, wget sab install karo
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    wget \
    curl \
    bash

# edge-tts install karo (FREE voice generator)
RUN pip3 install --break-system-packages \
    edge-tts

# Video files ke liye folder banao
RUN mkdir -p /data/youtube_automation && \
    chown -R node:node /data

# Wapas node user pe aao
USER node

EXPOSE 10000
