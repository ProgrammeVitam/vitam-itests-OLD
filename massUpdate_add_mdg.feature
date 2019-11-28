#language: fr

@massUpdateMddGestion
Fonctionnalité: Modifier en masse des métadonnées de gestion d'une AU

    Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
        Etant donné les tests effectués sur le tenant 0
        Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RATP.zip

    Scénario: Ajouter une règle inconnu du référentiel - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_fakeRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une règle qui n'est pas dans sa catégorie - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_wrongCategoryRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une règle sans FinalAction - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_withoutFinalActionRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une règle avec un refNonRuleId inconnue - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_unknownRefNonRuleIdRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une règle avec Stardate mais sans l'id de la règle - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_starDateWithoutRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une règle avec une endaDate > 9000 - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_endDateSuperiorRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une catégorie avec un FinalAction non conforme - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_nonCompliantFinalActionRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter une ClassificationRule avec ClassificationLevel inconnu - KO
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_unknownClassificationLevelRule_ko.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO

    Scénario: Ajouter un RuleId à des AU disposant déjà de règles
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_newRule.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est OK

    ## ajouter l'AU est sa descendance au panier
    Scénario: Ajouter RefNonRuleId alors qu'un PreventInheritance s'applique déjà sur une catégorie de règle- WARNING
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/select_au_byTitle.json
        Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Saint-Lazare
        Et je recherche les unités archivistiques
        Alors le nombre de résultat est 1
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_refNonRuleId_preventInheritance.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter PreventInheritance alors qu'un RefNonRuleId s'applique déjà sur une catégorie de règle- WARNING
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/select_au_byTitle.json
        Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre TitreAU Saint Lazare
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_preventInheritance_refNonRuleId.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est WARNING

   Scénario: Ajouter RefNonRuleId alors qu'un RefNonRuleId s'applique déjà sur une catégorie de règle- OK
       Quand j'utilise le fichier de requête suivant data/queries/mass-update/select_au_byTitle.json
       Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Saint-Lazare
       Et je recherche les unités archivistiques
       Alors le nombre de résultat est 1
       Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_refNonRuleId_refNonRuleId.json
       Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Saint-Lazare
       Et je lance la mise à jour de masse des règles de gestion
       Alors le statut final du journal des opérations est OK