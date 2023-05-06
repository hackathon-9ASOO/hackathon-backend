# Use uma Imagem Official do Python
FROM python:rc-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY ./src /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ENV CLOUD_SQL_USERNAME=grupo13 \
    CLOUD_SQL_PASSWORD=changeme \
    CLOUD_SQL_DATABASE_NAME=playlist \
    DB_LOCAL_HOST=grupo-13-384916 \
    CLOUD_SQL_CONNECTION_NAME=grupo-13-384916:us-central1:my-playlist-instance


# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]