# Scheme URI
points d'entrée API

## liste des articles par type d'article
  path: /:typeArticle
  param:
    - typeArticle: parmi {essais, chroniques, entretiens, lectures}
  output:
    - nbr d'articles
    - par article: idArticle, titre, auteur, date, résumé,

## liste des dossiers
  path: /dossiers
  param:
  output:
    - nbr de dossiers
    - par dossier : idDossier, titreDossier, nbrArticle, nomEditeur(s), résuméArticleSommaire

## liste des articles par dossier thématique
  path: /dossiers/:idDossier
  param:
    - idDossier: ID parmi {famille de mot-clé "textes regroupés" ou rubrique:109 "Dossier" }
  output:
    - idDossier, titreDossier, nbrArticle, nomEditeur(s), résuméArticleSommaire
    - par article: idArticle, titre article, auteur, date

## liste des auteurs
  path: /auteurs
  param:
  output:
    - idAuteur, prénom/nom Auteur,

## liste des articles par auteur
  path: /auteurs/:idAuteur
  param:
    - idAuteur: ID
  output:
    - idAuteur, prénom/nom Auteur, idOrchid
    - par article: idArticle, titre article, auteur, date

## liste des thématiques
  path: /thematiques
  param:
  output:
    - par thématique: idThematique, nomThematique, nbr d'articles

## liste des articles par thématique
  path: /thematiques/:idThematique
  param:
    - idThematique: ID {famille de mot-clé Thématique, attribut à ajouter dans la balise <descripteur>}
  output:
    - idThematique, titreThematique, nbr d'articles
    - par article: idArticle, titre article, auteur, date

## liste des articles par région
  path: /region/:idRegion
  param:
    - idRegion: ID {famille de mot-clé Région, attribut à ajouter dans la balise <descripteur>}
  output:
    - idRegion, titreRegion, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date


## liste des articles par auteur cité
  path: /auteur-cite/:idAuteurcite
  param:
    - idAuteurcite: ID {famille de mot-clé Auteur cité, attribut à ajouter dans la balise <descripteur>}
  output:
    - idAuteurcite, nomAuteurcite, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date


## liste des articles par média
  path: /media/:idMedia
  param:
    - idMedia: ID {famille de mot-clé Media + Domaine artistique, attribut à ajouter dans la balise <descripteur>}
  output:
    - idMedia, titreMedia, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date


## liste des articles par mot-clés
  path: /motcle/:idMotcle
  param:
    - idMotcle: ID {famille de mot-clé "Regroupement Thématique", attribut à ajouter dans la balise <descripteur>} + balise <grmotcle> + mot-clé libre}
  output:
    - idMotcle, Motcle, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date

## liste des articles par date
  path: /date/YYYY
  param:
    - si YYYY : tous les articles de l'année YYYY
  output:
    - nbr d'articles
    - par article: idArticle, titreArticle, auteur, date

## article
  path: /:idArticle
  param:
    - idArticle: ID
  output:
    - tout... :
      - métadonnées de l'article
      - corps//
      - partiesann//grnote//
      - partiesann//grbiblio
