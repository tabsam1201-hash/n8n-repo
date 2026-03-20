FROM n8nio/n8n:2.13.1

ENV N8N_HOST=0.0.0.0
ENV GENERIC_TIMEZONE=Asia/Kolkata

CMD ["sh", "-c", "export N8N_PORT=${PORT:-5678} && n8n start"]
