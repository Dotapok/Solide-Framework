# Politique de Sécurité

## Signalement d'une Vulnérabilité

**NE PAS** créer d'issue publique pour les vulnérabilités de sécurité.

Veuillez envoyer un email à **security@solide.dev** avec les informations suivantes :

- **Type de vulnérabilité** (ex: XSS, injection, etc.)
- **URL/Chemin affecté**
- **Description détaillée**
- **Étapes pour reproduire**
- **Impact potentiel**
- **Suggestions de correction** (si possible)

Nous vous répondrons dans les **48 heures** et vous tiendrons informé de la progression.

## Processus de Gestion

1. **Confirmation** : Nous vérifions la vulnérabilité
2. **Analyse** : Évaluation de l'impact et de la gravité
3. **Correction** : Développement du correctif
4. **Test** : Validation de la correction
5. **Publication** : Release sécurisée
6. **Divulgation** : Communication coordonnée

## Versions Supportées

| Version | Support Sécurité | Fin de Support |
|---------|-----------------|----------------|
| 1.x     | ✅ Actif         | Décembre 2026  |

## Bonnes Pratiques de Sécurité

### Pour les Utilisateurs
1. **Mettez toujours à jour** vers la dernière version
2. **Validez toutes les entrées** utilisateur
3. **Utilisez HTTPS** en production
4. **Chiffrez les secrets** et informations sensibles
5. **Auditez régulièrement** les dépendances

### Pour les Contributeurs
1. **Revue de sécurité** obligatoire pour les PR importantes
2. **Tests de sécurité** dans le pipeline CI
3. **Scan des dépendances** avant merge
4. **Validation des entrées** dans tout nouveau code

## Récompenses

Nous ne proposons pas encore de programme de récompenses pour les vulnérabilités (bug bounty), mais nous reconnaissons et créditons publiquement les chercheurs qui signalent des problèmes de sécurité.

## Historique des Vulnérabilités

[Aucune vulnérabilité connue à ce jour]

## Contact

- **Email de sécurité** : security@solide.dev
- **PGP Key** : 
- **Responsable sécurité** : L'équipe de maintenance Solide

## Ressources
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Go Security Guide](https://github.com/golang/go/wiki/Security)
- [Best Practices Go](https://github.com/golang-standards/project-layout/blob/master/SECURITY.md)