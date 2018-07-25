# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contrats (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_for_tnr_ok.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée déjà existant
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario: Import de deux contrats d'ingest de même noms
    Etant donné un contract nommé data/contracts/two_same_name_ingest_contracts.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS

  Scénario: CONTRACTS -recherche d'un contrat d'entree
    Quand je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | ArchivalAgreement0 |
      | Description | Contrat Vitam 0    |

  Scénario: CONTRACTS - recherche de contrats d'entrée ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/referential_contracts_ok_sort.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_order_name_desc.json
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Et les metadonnées sont
      | Name       | ZimbabweArchivalAgreement  |
      | Identifier | ZimbabweArchivalAgreement0 |

  Scénario: Tentative d'import de contrat d'accès ko (nom manquant)
    Etant donné les tests effectués sur le contrat id ContratTNR
    Et un contract nommé data/contracts/ko_contrat_acces_name_manquant.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import de contrat d'accès ko (fichier xml)
    Etant donné un contract nommé data/contracts/ko_contrat_acces.xml
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

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
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ FormatUnidentifiedAuthorized dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_FormatUnidentifiedAuthorized_ko_1.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: import OK de contrats d'entrée avec le champ FormatUnidentifiedAuthorized correct
    Etant donné un contract nommé data/contracts/entree/contract_FormatUnidentifiedAuthorized_ok.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_les_objets_non_identifies
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Rejette_les_objets_non_identifies
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=true mais FormatType possède une valeur
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_1.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=true et FormatType dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_2.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_3.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType dont la valeur est vide (tableau vide)
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_4.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType est absent du fichier JSON importé
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_5.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS

  Scénario: import OK de contrats d'entrée avec le champ EveryFormatType et FormatType corrects
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ok.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_tous_les_formats
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_formats_liste_blanche
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Import de contrat avec un minimum d'informations
    Etant donné un contract nommé data/contracts/entree/contract_minimal.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand je cherche un contrat de type INGEST_CONTRACTS et nommé Minimal_contract_with_the_less_fields_as_possible
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Status                 | INACTIVE    |
      | CheckParentLink        | INACTIVE    |
      | MasterMandatory        | true        |
      | EveryDataObjectVersion | false       |
