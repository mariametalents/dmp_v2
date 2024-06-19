@echo off
chcp 65001 > nul
setlocal disabledelayedexpansion

REM Définition des variables
set "fichierSortie=plugin.txt"
set "gitignore=.gitignore"
set "branche=main"
set C:\ACHAT_V2\plugins\installed-plugins=%1

REM Création du fichier de liste des fichiers
echo plugin.txt > "%fichierSortie%"


dir %C:\ACHAT_V2\plugins\installed-plugins% /b > "plugin.txt"

REM Vérification de l'existence du fichier .gitignore
if not exist "%gitignore%" (
    echo Le fichier %gitignore% n'existe pas. Création du fichier...
    (
        echo analytics-logs/
        echo caches/
        echo customisations/
        echo customisations-backup/
        echo data/
        echo export/*
        echo ExporterTemplates/
        echo import/
        echo keys/
        echo log/
        echo logos/
        echo monitor/
        echo scriptrunner/
        echo scripts/
        echo tmp/
        echo .jira-home.lock
	    echo .script-V2.bat
        echo plugins/*
        echo !export/backup.zip

    ) > "%gitignore%"
    echo Fichier .gitignore créé avec succès.
) else (
    echo Le fichier %gitignore% existe déjà.
)

REM Initialisation du dépôt Git local s'il n'existe pas
if not exist ".git" (
    echo Initialisation du dépôt Git local...
    git init
    echo Dépôt Git local initialisé avec succès.
) else (
    echo Le dépôt Git local existe déjà.
)

REM Ajout des fichiers au suivi de Git
git add .

REM Vérification de l'état du dépôt local

    REM Il y a des modifications à valider
    REM Demander à l'utilisateur d'entrer un message de commit
    REM set /p commit_message="Entrez le message de commit : "

    REM Validation des modifications avec le message de commit dynamique
    REM git commit -m "%commit_message%"

    REM Demander à l'utilisateur d'entrer un message de commit
 set /p commit_message="Entrez le message de commit : "

    REM Afficher le message de commit pour débogage
    echo Le message de commit est : %commit_message%

    REM Vérifier si le message de commit est vide
    if not "%commit_message%"=="" (
        REM Validation des modifications avec le message de commit dynamique
        git commit -m "%commit_message%"
    ) else (
        echo Aucun message de commit fourni. Abandon du commit.
    )



REM Demander à l'utilisateur d'entrer l'URL du référentiel GitHub
set /p repository_url="Entrez l'URL du référentiel GitHub : "

REM Ajout du référentiel distant et effectuer le push
git remote add origin "%repository_url%"
git pull origin master --allow-unrelated-histories
git push -u origin master
set /p repository_url="tr "

endlocal