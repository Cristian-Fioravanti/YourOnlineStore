FROM docker.micegroup.it/yourstore-frontend-base:0.0.1-SNAPSHOT

RUN apt-get -y install gettext-base
ADD  . /angular/
RUN mv /angular/rewrite.config /apache-tomcat-9.0.55/conf/Catalina/localhost/
RUN mv /angular/server.xml /apache-tomcat-9.0.55/conf/

CMD envsubst < /angular/src/environments/environment.ts > /angular/src/environments/environment.ts && \
    cd /angular && \
    ng build --base-href /frontend/ --deploy-url /frontend/ && \
    cp -r dist/Yourstore/* /apache-tomcat-9.0.55/webapps/frontend/  && \
    /apache-tomcat-9.0.55/bin/./startup.sh && \
    tail -f /apache-tomcat-9.0.55/logs/catalina.out
