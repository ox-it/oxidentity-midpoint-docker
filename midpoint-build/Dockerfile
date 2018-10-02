FROM debian:9

ENV MP_BRANCH=v3.8

RUN apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y vim-tiny wget curl apt-transport-https gnupg2

RUN adduser -disabled-password --gecos "user" user

RUN apt-get update && \
  apt-get install -y openjdk-8-jdk-headless git maven procps

USER user
RUN git clone https://github.com/Evolveum/midpoint.git /home/user/midpoint
#ADD --chown=user:user midpoint /home/user/midpoint

RUN mkdir -p /home/user/.m2
VOLUME ["/home/user/.m2"]

WORKDIR /home/user/midpoint
RUN git checkout -b "${MP_BRANCH}" "${MP_BRANCH}"
RUN mvn install -DskipTests=true

CMD ["/bin/bash"]
