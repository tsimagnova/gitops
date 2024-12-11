# Utiliser une image Python officielle comme base
FROM python:3.9.21-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le répertoire backend avec main.py dans le conteneur

COPY . /app

# Copier le fichier requirements.txt dans le conteneur
COPY requirements.txt /app/

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port pour l'application
EXPOSE 8000

# Commande par défaut pour démarrer l'application avec reload
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
