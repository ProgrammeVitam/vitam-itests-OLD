#language: fr

@DslOperatorRegex
Fonctionnalité: Test operateur REGEX du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test opérateur $regex
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    
# Recherche complète .*
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": ".*"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 17

# Recherche exacte
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": "Item"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10


# Recherche par prefixe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": "It.*"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10

# Recherche par suffixe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": ".*em"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10


# Recherche partielle (milieu de mot)
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": "te"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

# Recherche regex complexe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": "[I][t](chaine inconnue)?em"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10

# Recherche regex complexe sans résultat
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$regex" : { "DescriptionLevel": "[0-9]+truc"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

