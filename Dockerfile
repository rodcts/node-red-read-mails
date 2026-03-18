FROM nodered/node-red:latest-22

# Copia o package.json para a raiz do Node-RED (/usr/src/node-red)
# Assim, os módulos não serão apagados pelo volume montado em /data
COPY --chown=node-red:node-red data/package.json package.json

RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Copy your flows and settings files
COPY --chown=node-red:node-red data/flows-mails.json /data/flows.json
COPY --chown=node-red:node-red data/settings.js /data/settings.js
