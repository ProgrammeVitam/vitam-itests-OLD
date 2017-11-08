# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contexte (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contexte OK
    Etant donné un fichier contexte nommé data/contexts/contexts_empty.json
    Alors j'importe ce contexte en succès

  Scénario: Import de contexte KO, car il contient contrat d'entrée ou contrat d'acceès invalide
    Etant donné un fichier contexte nommé data/contexts/contexts_error.json
    Alors j'importe ce contexte en échec

  Scénario: Update de contextes
    Etant donné un contexte nommé My_Context_5
    Et un fichier requete nommé data/queries/update_context.json
    Alors je modifie le contexte nommé My_Context_5
    Et je recherche un contexte nommé My_Context_5
    Alors  les métadonnées du context sont
      | Name        | My_Context_5                                                                                                                                                                                                          |
      | Permissions | [{"_tenant":0,"AccessContracts":[],"IngestContracts":[]},{"_tenant":1,"AccessContracts":[],"IngestContracts":[]},{"_tenant":2,"AccessContracts":[],"IngestContracts":[]}] |
