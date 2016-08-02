FROM registry.thkose3.com:5000/jboss-eap-6/eap64-openshift:1.3
EXPOSE 8080 8888

ADD ROOT.war $JBOSS_HOME/standalone/deployments/
