FROM debian:9 AS build

#ENV MP_BRANCH=v3.8
ARG MP_BRANCH

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
RUN git checkout "${MP_BRANCH}"
RUN mvn install -DskipTests=true

CMD ["/bin/bash"]

FROM debian:9

#ENV MP_VERSION 3.8
ENV MP_DIR /opt/midpoint

RUN apt-get update && apt-get dist-upgrade -y \
 && apt-get install -y openjdk-8-jre-headless wget postgresql-client

COPY --from=build /home/user/midpoint/dist/target/midpoint-*-dist.tar.gz ${MP_DIR}/

RUN mkdir -p ${MP_DIR}/var \
 && echo 'Extracting midPoint archive...' \
 && tar xzf ${MP_DIR}/midpoint-*-dist.tar.gz -C ${MP_DIR} --strip-components=1

COPY config.xml ${MP_DIR}/var/config.xml

RUN keytool -genseckey -alias strong -keystore /opt/midpoint/var/keystore.jceks -storetype jceks -storepass changeit -keyalg AES -keysize 256 -keypass midpoint
RUN mkdir -p ${MP_DIR}/var/schema
ADD idm-schema.xsd ${MP_DIR}/var/schema/

EXPOSE 8080

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/usr/bin/java", "-Xmx2048M", "-Xms2048M", "-Dfile.encoding=UTF8", "-Dmidpoint.home=/opt/midpoint/var", "-jar", "/opt/midpoint/lib/midpoint.war"]

