FROM debian:9

ENV MP_VERSION 3.8
ENV MP_DIR /opt/midpoint

RUN apt-get update && apt-get dist-upgrade -y \
 && apt-get install -y openjdk-8-jre-headless wget postgresql-client

RUN mkdir -p ${MP_DIR}/var \
 && wget https://evolveum.com/downloads/midpoint/${MP_VERSION}/midpoint-${MP_VERSION}-dist.tar.gz -P ${MP_DIR} \
 && echo 'Extracting midPoint archive...' \
 && tar xzf ${MP_DIR}/midpoint-${MP_VERSION}-dist.tar.gz -C ${MP_DIR} --strip-components=1

COPY config.xml ${MP_DIR}/var/config.xml

RUN keytool -genseckey -alias strong -keystore /opt/midpoint/var/keystore.jceks -storetype jceks -storepass changeit -keyalg AES -keysize 256 -keypass midpoint
RUN mkdir -p ${MP_DIR}/var/schema
ADD idm-schema.xsd ${MP_DIR}/var/schema/

EXPOSE 8080

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/usr/bin/java", "-Xmx2048M", "-Xms2048M", "-Dfile.encoding=UTF8", "-Dmidpoint.home=/opt/midpoint/var", "-jar", "/opt/midpoint/lib/midpoint.war"]
