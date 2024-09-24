# Utiliser une image Python 3.9 comme base
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier requirements.txt dans le conteneur
COPY requirements.txt .

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le contenu de l'application dans le conteneur
COPY . .

# Exposer le port sur lequel l'application sera exécutée
EXPOSE 5000

# Définir la commande par défaut pour démarrer l'application
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
