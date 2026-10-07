# Dev'Immédiat — Mise en conformité RGPD d'un CRM

> Projet du parcours **Business Intelligence Analyst** (OpenClassrooms), réalisé dans une mise en situation professionnelle.
> **Outils :** SQL · SQLiteStudio · Excel · Power Query

## Contexte

Après une sanction de la CNIL, l'assureur Dev'Immédiat doit revoir la façon dont les données personnelles de son CRM sont collectées, conservées et utilisées.

Ma mission : transmettre à l'équipe commerciale les demandes de devis de 2022 dont le dossier est complet, **sans identifiants directs ni données sensibles**, tout en gardant un fichier exploitable. Je devais aussi formuler des recommandations de mise en conformité.

## Démarche

1. **Analyse du CRM :** la table `base_client` contient 10 302 lignes et 28 colonnes, dont des données sensibles ou sans utilité pour un devis automobile (groupe sanguin, numéro de sécurité sociale, employeur exact).
2. **Extraction SQL :** 1 344 demandes en 2022, dont **1 158 dossiers complets** conservés, avec seulement 18 colonnes utiles sélectionnées (pas de `SELECT *`).
3. **Contrôle qualité :** j'ai relevé 68 revenus, 63 valeurs de résidence et 72 âges de véhicule manquants, 19 identifiants répétés, des dates de naissance incohérentes et des libellés inhabituels (`z_SUV`, `z_High School`). *Aucune valeur n'a été corrigée sans source fiable.*
4. **Minimisation et anonymisation dans Power Query :**
   - **Identifiants directs supprimés :** nom, email, adresse, numéro de sécurité sociale, identifiant web.
   - **Données sensibles retirées :** groupe sanguin, identifiant d'assurance santé.
   - **Données trop précises retirées :** métier, employeur, coordonnées GPS.
   - **Généralisation :** l'âge, les revenus, la valeur de la résidence, les points perdus et le tarif du devis sont regroupés en tranches. Le nombre d'enfants devient une information Oui / Non.
   - **Pseudonymisation :** l'identifiant client est remplacé par un index anonyme, sans table de correspondance.
5. **Recommandations :** 5 règles de conformité pour la direction et le DPO.

## Résultat

| Contrôle final | Résultat |
|---|---|
| Lignes | 1 158 |
| Colonnes | 17 |
| Identifiants directs transmis | Aucun |
| Tarifs exacts transmis | Aucun (remplacés par 4 tranches) |
| Erreurs Power Query | 0 |
| Format | CSV UTF-8 |

## Les 5 recommandations

1. **Minimiser** la collecte aux données utiles pour le devis et le contrat.
2. **Informer** les clients et leur permettre d'exercer leurs droits (accès, rectification, suppression).
3. **Encadrer** les données sensibles.
4. **Définir une durée de conservation** par catégorie de données.
5. **Limiter et contrôler** les accès au CRM selon le rôle de chacun.

## Contenu du dépôt

| Fichier | Description |
|---|---|
| `extraction_dossiers_2022.sql` | Requête d'extraction des dossiers complets de 2022 |
| `recommandations_rgpd.pdf` | Les 5 recommandations de mise en conformité (2 pages) |
| `rapport_traitement.pdf` | Rapport complet : qualité, minimisation, anonymisation |
| `presentation.pdf` | Présentation de la démarche et des résultats |

*Par cohérence avec le sujet du projet, ni la base CRM, ni l'extraction brute, ni le fichier anonymisé ne sont publiés. Les aperçus de données clients ont été masqués dans le rapport.*

## Auteur

**Antony Labandibar**, en formation Business Intelligence Analyst. Je recherche un stage BI / Data Analyst en avril-mai 2027 (Seine-et-Marne).
[LinkedIn](https://www.linkedin.com/in/antony-labandibar) · [Autre projet : SportDataPulse](https://github.com/Antony-Labandibar/sportdatapulse-ligue1-sql)
