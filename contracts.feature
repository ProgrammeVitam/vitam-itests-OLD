# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contrats (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_for_tnr_ok.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée déjà existant
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Import de deux contrats d'ingest de même noms
    Etant donné un contract nommé data/contracts/two_same_name_ingest_contracts.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS

  Scénario:Import de deux contrats d'accès de même noms
    Etant donné un contract nommé data/contracts/two_same_name_access_contracts.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'accès déjà existant
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: CONTRACTS -recherche d'un contrat d'entree
    Quand je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | ArchivalAgreement0 |
      | Description | Contrat Vitam 0    |

  Scénario: ACCESS_CONTRACTS - recherche d'un contrat d'accès
    Quand je cherche un contrat de type ACCESS_CONTRACTS et nommé AccessContract0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | AccessContract0 |
      | Description | Contrat Acces 0 |

  Scénario: ACCESS_CONTRACTS - recherche de contrats d'accès ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/contrats_acces_ok_sort.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_access_contract_order_name_desc.json
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Et les metadonnées sont
      | Name       | Zimbabwe - Air Zimbabwe |
      | Identifier | Zimbabwe_Air_Zimbabwe   |

  Scénario: CONTRACTS - recherche de contrats d'entrée ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/referential_contracts_ok_sort.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_order_name_desc.json
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Et les metadonnées sont
      | Name       | ZimbabweArchivalAgreement  |
      | Identifier | ZimbabweArchivalAgreement0 |

  Scénario: Tentative d'import de contrat d'accès ko (nom manquant)
    Etant donné un contract nommé data/contracts/ko_contrat_acces_name_manquant.json
    Alors j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Tentative d'import de contrat d'accès ko (fichier xml)
    Etant donné un contract nommé data/contracts/ko_contrat_acces.xml
    Alors j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (nom manquant)
    Etant donné un contract nommé data/contracts/ko_referential_contracts_INVALID_MissingName.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (fichier xml)
    Etant donné un contract nommé data/contracts/ko_referential_contracts.xml
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (Id du plan parent est incorrect)
    Etant donné un contract nommé data/contracts/referential_contracts_unknowID_ko.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (JSON contenant des contenus HTML toxiques)
    Etant donné un contract nommé data/contracts/JSON_HTML.json
    Alors j'importe ce contrat incorrect de type ACCESS_CONTRACTS
