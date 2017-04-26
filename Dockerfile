FROM nginx:latest

ENTRYPOINT ["/bin/entrypoint.sh"]
EXPOSE 80
VOLUME /templates
ENV CONSUL_URL consul:8500

ADD entrypoint.sh /bin/entrypoint.sh

ADD https://releases.hashicorp.com/consul-template/0.18.2/consul-template_0.18.2_linux_amd64.tgz /usr/bin/
RUN tar -zxf /usr/bin/consul-template_0.18.2_linux_amd64.tgz -C /usr/local/bin
RUN rm -v /etc/nginx/conf.d/*
RUN chmod +x /bin/entrypoint.sh
