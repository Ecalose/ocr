/*
* @Date: 2022-02-26 16:57:14
* @LastEditors: Ecalose
* @LastEditTime: 2022-02-26 23:51:57
*/
FROM python:3.8-buster

RUN mkdir /app

COPY ./*.txt ./*.py ./*.sh ./*.onnx ./*.conf /app/

RUN python3 -m pip install --upgrade pip -i https://pypi.douban.com/simple/
RUN pip3 install --no-cache-dir -r /app/requirements.txt
RUN rm -rf /tmp/*
RUN rm -rf /root/.cache/*
RUN apt-get --allow-releaseinfo-change update
RUN apt install libgl1-mesa-glx nginx -y
RUN chmod +x /app/start.sh
WORKDIR /app

ENTRYPOINT ["/bin/bash", "-C", "/app/start.sh"]
