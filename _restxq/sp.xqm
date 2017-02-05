xquery version "3.0" ;
module namespace sp.ex = 'sp.ex' ;

(:~
 : This module is a RESTXQ for Sens-Public
 :
 : @author emchateau (UdeM)
 : @since 2016-12-06 
 : @version 0.1
 :
 : This module uses SynopsX publication framework 
 : see https://github.com/synopsx
 : It is distributed under the GNU General Public Licence, 
 : see http://www.gnu.org/licenses/
 :
 :)

import module namespace restxq = 'http://exquery.org/ns/restxq' ;

import module namespace G = 'synopsx.globals' at '../../../globals.xqm' ;
import module namespace synopsx.models.synopsx= 'synopsx.models.synopsx' at '../../../models/synopsx.xqm' ;

import module namespace synopsx.mappings.htmlWrapping = 'synopsx.mappings.htmlWrapping' at '../../../mappings/htmlWrapping.xqm' ;

declare default function namespace 'sp.ex' ;

(:~
 : resource function for the home
 :
 :)
declare 
  %restxq:path('/sp')
function index() {
  <rest:response>
    <http:response status="303" message="See Other">
      <http:header name="location" value="/sp/home"/>
    </http:response>
  </rest:response>
};

(:~
 : resource function for the blog's home
 :
 : @return an html representation of blog's home
 :)
declare 
  %restxq:path('/sp/home')
  %rest:produces('text/html')
  %output:method('html')
  %output:html-version('5.0')
function blogHome() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getArticleList'
    }
  let $function := synopsx.models.synopsx:getModelFunction($queryParams)
  let $data := fn:function-lookup($function, 1)($queryParams)
  let $outputParams := map {
    'layout' : 'layout.xhtml',
    'pattern' : 'pattern.xhtml',
    'xquery' : 'erudit2html'
    }
    return synopsx.mappings.htmlWrapping:wrapper($queryParams, $data, $outputParams)
  }; 
 

(:~ 
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
 :)








