FROM s390x/ubuntu

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY root /
RUN apt-get update
RUN apt update
RUN apt-get install xz-utils zip unzip curl wget zsh git sudo qbittorrent-nox -y

RUN apt install python3-venv python3-pip -y
RUN sudo apt-get install python3-distutils -y
RUN pip3 install pyTelegramBotAPI
RUN pip3 install qbittorrent-api
RUN pip3 install apscheduler


RUN sudo chmod 777 /rclone
RUN mv /rclone /usr/bin/


CMD wget https://raw.githubusercontent.com/railway7/qb/main/start.sh -O start.sh && chmod 0777 start.sh && bash start.sh

