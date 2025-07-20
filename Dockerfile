FROM python:3.9-slim
WORKDIR /app
# Kök dizindeki Instant Client dosyalarını kopyala
COPY BASIC_LICENSE BASIC_README adrci genezi libclntsh.so libclntsh.so.10.1 libclntsh.so.11.1 libclntsh.so.12.1 libclntsh.so.18.1 libclntsh.so.19.1 libclntshcore.so.19.1 libipc1.so libmql1.so libnnz19.so libocci.so libocci.so.10.1 libocci.so.11.1 libocci.so.12.1 libocci.so.18.1 libocci.so.19.1 libociei.so libocijdbc19.so liboramysql19.so ojdbc8.jar ucp.jar uidrvci xstreams.jar /usr/local/lib/
RUN apt-get update && apt-get install -y libaio1 && \
    cd /usr/local/lib/ && \
    ln -s libclntsh.so.19.1 libclntsh.so && \
    ln -s libocci.so.19.1 libocci.so && \
    pip install cx_Oracle
COPY . /app
CMD ["python", "app.py"]
