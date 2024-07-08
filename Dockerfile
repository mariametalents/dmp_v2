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
   # apt-get install -y postgresql-client && \
    apt-get install sshpass && \
    rm -rf /var/lib/apt/lists/*


# #Préparer le répertoire SSH et copier la clé privée
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
COPY ./.ssh/id_rsa /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa
RUN ssh-keyscan -t rsa -H github.com >> /root/.ssh/known_hosts


# Cloner le dépôt avec Git 
RUN rm -rf /var/atlassian/application-data/jira/tmp \
    && mkdir -p /var/atlassian/application-data/jira/silprograms \
    && mkdir -p /var/atlassian/application-data/jira/kepler \
    && mkdir -p /var/atlassian/application-data/jira/plugins \
    && mkdir -p /var/atlassian/application-data/jira/plugins/installed-plugins \
    && mkdir -p /var/atlassian/application-data/jira/tmp \
    && git clone git@github.com:mariametalents/dmp_v2.git /var/atlassian/application-data/jira/tmp \
    && cd /var/atlassian/application-data/jira/tmp

# Define environment variables for remote access
ENV REMOTE_USER=jira
ENV REMOTE_HOST=192.168.1.39
ENV REMOTE_DIR=/home/jira/plugins/achat-talents/plugins
ENV LOCAL_DIR=/var/atlassian/application-data/jira/plugins/installed-plugins
ENV REMOTE_PASSWORD=jira

# # Define environment variables for remote access
# ENV POSTGRES_USER=jirauser
# ENV POSTGRES_DB=dmp

# Copier les fichiers de configuration si nécessaire
COPY export/ /var/atlassian/application-data/jira/import/
COPY silprograms/ /var/atlassian/application-data/jira/silprograms/
COPY kepler/ /var/atlassian/application-data/jira/kepler/
COPY backup_db/achats-talent/ /shared/
COPY init-db.sh  /shared/
RUN sshpass -p "$REMOTE_PASSWORD" scp -v -o StrictHostKeyChecking=no "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/*.jar" "$LOCAL_DIR/"

#RUN psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /shared/backup_dmp.sql
RUN rm -rf /root/.ssh


# # Octroyer les droits à l'instance Jira
 RUN chown -R jira:jira /opt/atlassian/jira \
 && chmod -R 755 /opt/atlassian/jira
 RUN chown -R jira:jira /var/atlassian/application-data/jira \
 && chmod -R 755 /var/atlassian/application-data/jira 

 RUN rm -rf /var/atlassian/application-data/jira/plugins/.osgi-plugins/
# Commande par défaut pour démarrer Jira
#CMD ["start-jira.sh", "-fg"]
