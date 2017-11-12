# docker run --rm -t -i -p 80:80 -p 443:443 -p 8000:8000 -p 8001:8001 DEBUG=True TELEGRAM_BOT_TOKEN='<BOT_TOKEN>' ALLOWED_HOSTS='127.0.0.1,bot.khashtamov.com, *' --name=mru-telebot  phusion/baseimage /sbin/my_init -- bash -l
# set the base image to Ubuntu 14.04
FROM phusion/baseimage:latest 

# file Author / Maintainer to Mrunal 
MAINTAINER mrunal4888@gmail.com

RUN apt update && apt upgrade -y && apt install -y sudo curl wget git emacs-nox vim python-pip nginx 

RUN apt install -y build-essential \
    && apt install -y python-dev libreadline-dev libbz2-dev libssl-dev libsqlite3-dev libxslt1-dev libxml2-dev 

RUN cd ~ \
    && git clone https://github.com/mrunal4/planetpython_telegrambot.git \
    && cd planetpython_telegrambot/ \
    && pip install -r requirements.txt \
    && pip install --upgrade pip

RUN cd ~ && git clone https://github.com/mrunal4/certbot \
    && cd certbot/ 

RUN ln -s /root/planetpython_telegrambot/telebot_start.sh /etc/my_init.d/telebot_start.sh \
    && chmod +x /root/planetpython_telegrambot/telebot_start.sh /etc/my_init.d/telebot_start.sh \
    ln -s /root/planetpython_telegrambot/allot-ip.sh /etc/my_init.d/allot-ip.sh \
    && chmod +x /root/planetpython_telegrambot/allot-ip.sh /etc/my_init.d/allot-ip.sh \
    ln -s /root/planetpython_telegrambot/cert-gen.sh /etc/my_init.d/cert-gen.sh \
    && chmod +x /root/planetpython_telegrambot/cert-gen.sh /etc/my_init.d/cert-gen.sh \
    && ln -s /root/planetpython_telegrambot/supervisord.conf /etc/supervisord.conf \
    && chmod +x /root/planetpython_telegrambot/supervisord.conf /etc/supervisord.conf
