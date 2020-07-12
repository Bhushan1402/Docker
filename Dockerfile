FROM python:3.6
RUN mkdir chatApplication

copy ./newChatapp/ /chatApplication
WORKDIR /chatApplication

RUN pip3 install -r requirements.txt

WORKDIR /chatApplication/fundoo
RUN chmod +x run.sh
EXPOSE 8000

CMD ["./run.sh"]

