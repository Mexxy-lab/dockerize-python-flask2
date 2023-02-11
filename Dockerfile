FROM ubuntu:20.04
EXPOSE 3000
RUN apt update
RUN apt install python3-pip -y
WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
CMD python3 app.py