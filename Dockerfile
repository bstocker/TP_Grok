FROM python:3.11-slim

# Installer curl pour plus de flexibilité
RUN apt update && apt install -y curl unzip

# Installer ngrok
RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | tee /etc/apt/trusted.gpg.d/ngrok.asc \
 && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | tee /etc/apt/sources.list.d/ngrok.list \
 && apt update && apt install -y ngrok

# Créer un dossier pour les fichiers HTML
WORKDIR /site

# Exposer le port du serveur
EXPOSE 8000

# Par défaut : exécute un serveur et démarre ngrok
CMD python3 -m http.server 8000 --directory /site
