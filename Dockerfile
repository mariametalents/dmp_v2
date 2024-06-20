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
#     && cd /var/atlassian/application-data/jira/tmp/plugins \
#    # && mv /var/atlassian/application-data/jira/tmp/plugins/plugins/installed-plugins/*.jar /var/atlassian/application-data/jira/plugins/installed-plugin
# RUN rm -rf /root/.ssh

# Copier les fichiers de configuration si nécessaire
# RUN mkdir -p /var/atlassian/application-data/jira/silprograms \
#     && mkdir -p /var/atlassian/application-data/jira/kepler
# COPY ./export/backup.zip /var/atlassian/application-data/jira/export/
# COPY ./silprograms/ /var/atlassian/application-data/jira/silprograms/
# COPY ./kepler/ /var/atlassian/application-data/jira/kepler/
# COPY ./plugin.txt /var/atlassian/application-data/jira/

# # Octroyer les droits à l'instance Jira
#  RUN chown -R jira:jira /var/atlassian/application-data/jira \
#  && chmod -R 755 /var/atlassian/application-data/jira
 RUN chown -R jira:jira /opt/atlassian/jira \
 && chmod -R 755 /opt/atlassian/jira
# Commande par défaut pour démarrer Jira
#CMD ["start-jira.sh", "-fg"]
