FROM openjdk:8-jdk-alpine
#FROM java:8
RUN apk update && \
    apk upgrade && \
    apk add vim
ADD wily /opt/caapm/agent/wily
VOLUME /tmp
ARG JAR_FILE=build/libs/spring-music.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080
ENV APMENV_INTROSCOPE_AGENT_PLATFORM_MONITOR_SYSTEM=UnsupportedOS
#ENV APMENV_INTROSCOPE_AGENT_EXTENSIONS_BUNDLES_BOOT_LOAD=spring
#ENV APMENV_INTROSCOPE_AGENT_EXTENSIONS_BUNDLES_LOAD=spring
ENV APMENV_AUTOATTACH_JAVA_FILTER_JVMS=false
# On-Prem
#ENV APMENV_AGENTMANAGER_URL_1=ws://apmservices-gateway.10.74.32.89.nip.io
#ENV APMENV_AGENTMANAGER_CREDENTIAL=eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhZ2VudCI6dHJ1ZSwiZXhwIjo5MjIzMzcyMDM2ODU0Nzc1LCJ0aWQiOjEwLCJqdGkiOiIyN2I5MjhiOS1kZTUxLTRmYzktYmUwNi0yNDllNGM5ZjU5ZDIifQ.bweRkq92gcaWVb7lutga36IzPzHdT9cl6tGPx_qwfMpOQzyQduuNbY54bGfmh9Q1d8HE4XXALr7gmGYBX_4NlQ
# RAJNISH
ENV APMENV_AGENTMANAGER_URL_1=wss://apmgw.dxi-na1.saas.broadcom.com:443
ENV APMENV_AGENTMANAGER_CREDENTIAL=eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhZ2VudCI6dHJ1ZSwiZXhwIjo5MjIzMzcyMDM2ODU0Nzc1LCJ0aWQiOjEzNTIsImp0aSI6ImE2Y2U5N2MzLTgzYmMtNGQxMC04MGYzLTRjYTEyNzE0Yjc5MCJ9.SQqelnTZzNMOsjleceINZ11JevIYpUDLH1eanPWmke1ldML_DzyqTTVJH20gtyTsX5hCWSYZ51RYwLJmhznzBA
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
ENTRYPOINT ["sh","-c","java -javaagent:/opt/caapm/agent/wily/Agent.jar -DagentProfile=/opt/caapm/agent/wily/releases/21.4/core/config/IntroscopeAgent.profile -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]
