# Comment Contribuer à Solide

Merci de votre intérêt pour contribuer à Solide ! Ce document explique comment
contribuer efficacement.

## Table des Matières

- [Comment Contribuer à Solide](#comment-contribuer-à-solide)
  - [Table des Matières](#table-des-matières)
  - [Questions et Discussions](#questions-et-discussions)
  - [Comment Signaler un Bug](#comment-signaler-un-bug)
  - [Comment Proposer une Feature](#comment-proposer-une-feature)
  - [Premiers Pas pour Développer](#premiers-pas-pour-développer)
    - [Pré-requis](#pré-requis)
    - [Installation et Setup](#installation-et-setup)
  - [Workflow de Développement](#workflow-de-développement)
    - [1. Fork le Repository](#1-fork-le-repository)
    - [2. Clone votre Fork](#2-clone-votre-fork)
    - [3. Configurez le Remote](#3-configurez-le-remote)
    - [4. Créez une Branche](#4-créez-une-branche)
    - [5. Faites vos Changements](#5-faites-vos-changements)
    - [6. Testez vos Changements](#6-testez-vos-changements)
    - [7. Commitez vos Changements](#7-commitez-vos-changements)
    - [8. Poussez vers votre Fork](#8-poussez-vers-votre-fork)
    - [9. Ouvrez une Pull Request](#9-ouvrez-une-pull-request)
  - [Conventions de Code](#conventions-de-code)
    - [Style Go](#style-go)
    - [Conventions de Commits](#conventions-de-commits)
    - [Documentation](#documentation)
  - [Tests](#tests)
    - [Tests Unitaires](#tests-unitaires)
    - [Tests d'Intégration](#tests-dintégration)
    - [Tests E2E](#tests-e2e)
  - [Revue de Code](#revue-de-code)
  - [Types de Contributions](#types-de-contributions)
    - [Bugs et Corrections](#bugs-et-corrections)
    - [Nouvelles Features](#nouvelles-features)
    - [Documentation](#documentation-1)
    - [Traductions](#traductions)
    - [Exemples](#exemples)
  - [Ressources](#ressources)
  - [Questions?](#questions)

## Questions et Discussions

Avant de créer une issue, veuillez :
1. Vérifier si une issue similaire existe déjà
2. Lire la documentation
3. Chercher dans les discussions existantes

Pour les questions générales, utilisez les [Discussions GitHub](https://github.com/solide-framework/solide/discussions).

## Comment Signaler un Bug

Utilisez le template "Bug Report" disponible lors de la création d'une issue.

Incluez :
- Description claire du bug
- Étapes pour reproduire
- Comportement attendu vs. réel
- Version de Go, OS, etc.
- Logs pertinents

## Comment Proposer une Feature

Utilisez le template "Feature Request" disponible lors de la création d'une issue.

Incluez :
- Description de la feature
- Cas d'usage concrets
- Problème résolu
- Solutions alternatives considérées

## Premiers Pas pour Développer

### Pré-requis

- Go 1.21 ou supérieur
- Git
- Make (recommandé)

### Installation et Setup

```bash
# 1. Fork le repository sur GitHub
# 2. Clone votre fork
git clone https://github.com/votre-username/solide
cd solide

# 3. Configurez le remote upstream
git remote add upstream https://github.com/solide-framework/solide

# 4. Installez les dépendances
make setup

# 5. Vérifiez l'installation
make test