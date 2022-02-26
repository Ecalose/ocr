FROM python:3.8-buster

RUN mkdir /app

COPY ./*.txt ./*.py ./*.sh ./*.onnx /app/

RUN cd /app &&
    python3 -m pip install --upgrade pip -i https://pypi.douban.com/simple/ && pip3 install --no-cache-dir -r requirements.txt --extra-index-url https://pypi.douban.com/simple/ &&
    rm -rf /tmp/* && rm -rf /root/.cache/* &&
    apt-get --allow-releaseinfo-change update && apt install libgl1-mesa-glx nginx -y

WORKDIR /app

RUN chmod +x /app/start.sh
CMD /app/start.sh
