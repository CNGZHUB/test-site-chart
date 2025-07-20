FROM python:3.9-slim
WORKDIR /app
# Linux için Instant Client'ı kopyala
COPY instantclient_19_11 /usr/local/lib/instantclient_19_11
RUN apt-get update && apt-get install -y libaio1 && \
    cd /usr/local/lib/instantclient_19_11 && \
    ln -s libclntsh.so.19.1 libclntsh.so && \
    ln -s libocci.so.19.1 libocci.so && \
    pip install cx_Oracle
COPY . /app
CMD ["python", "app.py"]
