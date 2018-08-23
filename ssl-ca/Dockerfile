FROM sysdev:stretch
MAINTAINER robert.bradley@it.ox.ac.uk
#ARG DEBIAN_FRONTEND=noninteractive
ENV KRB5_REALM=TEST.OX.AC.UK
ENV KRB5_LC_REALM=test.ox.ac.uk

RUN mkdir -p /etc/krb5 /var/lib/ssl-ca/certs /var/lib/ssl-ca/keys
VOLUME ["/etc/krb5"]

RUN apt-get update && apt-get install -y openssl sysdev-utils

COPY req /usr/bin/req
COPY gen-cert.sh /usr/bin/gen-cert.sh
RUN chmod +x /usr/bin/gen-cert.sh

RUN openssl req -x509 -new -nodes -keyout /var/lib/ssl-ca/keys/docker-ca.key.pem -sha256 -days 3650 \
  -out /var/lib/ssl-ca/certs/docker-ca.crt.pem \
  -subj "/C=GB/ST=Oxfordshire/L=Oxford/O=University of Oxford/OU=IT Services/CN=Docker Test CA/emailAddress=sysdev@it.ox.ac.uk"
#RUN /usr/bin/gen-cert.sh herald-ldap.dockerexp_iam
#RUN /usr/bin/gen-cert.sh accman-db.dockerexp_iam
#RUN /usr/bin/gen-cert.sh oak-ldap.dockerexp_iam

VOLUME ["/var/lib/ssl-ca/certs", "/var/lib/ssl-ca/keys"]

CMD ["bash"]
