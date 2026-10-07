-- Extraction des demandes d'assurance de 2022 dont le dossier est complet
-- Base : CRM.sqlite, table base_client (10 302 lignes, 28 colonnes)
-- Résultat : 1 158 lignes, 18 colonnes utiles (sans SELECT *)

SELECT
    date_demande AS "Date de la demande",
    etat_dossier AS "État du dossier",
    sexe,
    date_naissance,
    id_client,
    enfant_conduite_accompagne,
    nombre_enfants,
    revenus,
    valeur_residence_prin,
    formation,
    usage_vehicule,
    type_vehicule,
    est_rouge,
    points_perdus,
    age_vehicule,
    type_conduite,
    formule,
    tarif_devis
FROM base_client
WHERE date_demande LIKE '2022%'
  AND etat_dossier = 'complet';

-- Les colonnes identifiantes ou sensibles (nom, email, adresse, num_ss,
-- groupe_sanguin, employeur, lat, lon...) sont exclues dès l'extraction.
-- La minimisation et l'anonymisation sont ensuite réalisées dans Power Query.
