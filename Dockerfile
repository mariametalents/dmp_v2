FROM atlassian/jira-software:9.5

WORKDIR /var/atlassian/application-data/jira

# RUN echo "Création du répertoire /var/atlassian/application-data/jira/silprograms" 
# RUN mkdir -p /var/atlassian/application-data/jira/silprograms

# RUN mkdir -p /var/atlassian/application-data/jira/silprograms && \
#     mkdir -p /var/atlassian/application-data/jira/kepler && \
#     mkdir -p /var/atlassian/application-data/jira/tmp 

# # Installer Git et OpenSSH
RUN apt-get update && \
    apt-get install -y git openssh-client && \
    rm -rf /var/lib/apt/lists/*


# #Préparer le répertoire SSH et copier la clé privée
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
COPY ./.ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa
RUN ssh-keyscan -t rsa -H github.com >> /root/.ssh/known_hosts

# Cloner le dépôt avec Git 
RUN mkdir -p /var/atlassian/application-data/jira/silprograms \
    && mkdir -p /var/atlassian/application-data/jira/kepler \
    && mkdir -p /var/atlassian/application-data/jira/tmp \
    && git clone git@github.com:mariametalents/dmp_v2.git /var/atlassian/application-data/jira/tmp 

# Copier les fichiers de configuration si nécessaire
COPY /var/atlassian/application-data/jira/tmp/export/ /var/atlassian/application-data/jira/import/
COPY /var/atlassian/application-data/jira/tmp/silprograms/ /var/atlassian/application-data/jira/silprograms/
COPY /var/atlassian/application-data/jira/tmp/kepler/ /var/atlassian/application-data/jira/kepler/
COPY ./plugin.txt /var/atlassian/application-data/jira/
RUN scp root@192.168.1.39:/root/plugins/achats-talent/ /var/atlassian/application-data/jira/plugins
RUN rm -rf /root/.ssh


# # Octroyer les droits à l'instance Jira
 RUN chown -R jira:jira /opt/atlassian/jira \
 && chmod -R 755 /opt/atlassian/jira
# Commande par défaut pour démarrer Jira
#CMD ["start-jira.sh", "-fg"]
