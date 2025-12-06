# Guide Aeterna : Manuel du Développeur Autonome

Bienvenue dans l'équipe Aeterna !
Ce document contient **toutes les étapes** pour installer ton environnement, modifier le site et mettre en ligne tes changements.

---

## 🚫 RÈGLE D'OR (Sécurité)
Ce site est hébergé sur un serveur partagé qui contient d'autres projets importants.
*   **Ne touche JAMAIS** aux fichiers situés en dehors du dossier `~/aeterna`.
*   **Ne lance JAMAIS** de commandes de nettoyage global (ex: `docker system prune` ou `docker stop all`).
*   Travaille uniquement dans le périmètre défini ci-dessous.

---

## Étape 1 : Préparation de ton Ordinateur

Avant de commencer, tu as besoin de ces outils :
1.  **VS Code** : L'éditeur de code.
2.  **Antigravity** : L'extension IA pour coder ("Vibecoding").
3.  **Git** : Pour gérer les versions du code. [Télécharger Git](https://git-scm.com/downloads)

### Configuration de la Clé SSH (Indispensable)
Pour que GitHub et le Serveur te reconnaissent, tu dois avoir une "clé numérique".

1.  Ouvre un terminal (PowerShell ou Git Bash) et tape :
    ```bash
    ssh-keygen -t ed25519 -C "ton_email@exemple.com"
    ```
    *(Appuie sur Entrée à chaque question pour laisser par défaut)*.

2.  Affiche ta clé publique :
    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```
    Copie le texte qui commence par `ssh-ed25519...`.

3.  **Action requise** : Envoie ce texte à ton frère. Il doit l'ajouter sur le serveur pour t'autoriser.

---

## Étape 2 : Récupérer le Code (Installation)

Une fois que tu as ta clé et que ton frère t'a autorisé sur GitHub :

1.  Ouvre VS Code.
2.  Ouvre un terminal (Terminal > New Terminal).
3.  Tape cette commande pour télécharger le site :
    ```bash
    git clone git@github.com:mkkn25-bot/aeternapro.git
    ```
4.  Ouvre le dossier `aeternapro` qui vient d'apparaître ("File > Open Folder").

---

## Étape 3 : Modifier le Site (Ton quotidien)

C'est ici que tu utilises Antigravity.
*   "Change la couleur du titre en bordeaux."
*   "Ajoute une photo dans la section À Propos."

Quand tu as fini tes modifications :
1.  Sauvegarde tes fichiers.
2.  Ouvre le terminal et tape ces 3 commandes magiques :
    ```bash
    git add .
    git commit -m "Explication rapide de ce que j'ai fait"
    git push
    ```
    *Cela envoie ton travail sur GitHub (le coffre-fort).*

---

## Étape 4 : Mettre en Ligne (Déploiement)

Pour que tes modifications soient visibles sur le vrai site `aeternapro.fr`.

1.  Connecte-toi au serveur (Terminal) :
    ```bash
    ssh debian@51.91.77.121
    ```

2.  Va dans le dossier du site (impératif) :
    ```bash
    cd /home/debian/aeterna
    ```

3.  Lance la mise à jour :
    ```bash
    git pull
    docker-compose up --build -d
    ```

4.  Vérifie sur ton navigateur : https://aeternapro.fr

---

## En cas de problème
*   Si le `git push` refuse : Vérifie que tu as bien les droits sur GitHub.
*   Si le `ssh` refuse : Vérifie que ton frère a bien ajouté ta clé sur le serveur.
*   Si le site ne marche plus : Préviens ton frère, ne touche à rien d'autre.

Bon courage ! 🌿
