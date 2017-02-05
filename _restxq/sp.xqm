xquery version "3.0" ;
module namespace sp.sp = 'sp.sp' ;

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

declare default function namespace 'sp.sp' ;

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
 : fonction ressource pour la page d’accueil
 :
 : @return une représentation html de la page d’accueil
 :)
declare 
  %restxq:path('/home')
  %rest:produces('text/html')
  %output:method('html')
  %output:html-version('5.0')
function blogHome() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getArticles'
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
 : fonction resource pour les articles par ID
 :
 : @param articleId identifiant de l’article
 : @return article avec l’identifiant ou un une séquence vide
 :)
declare 
  %restxq:path('/articles/{articleId}')
function articleById() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getArticleById'
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
 : fonction resource pour les articles par date
 :
 : @param date date au format xs:date
 : @return une liste d’articles correspondant à la date
 : @discuss le nb d’articles ou l’ordre de tri (titre, auteur, date) doivent-ils être traités en paramètres ?
 :)
declare 
  %restxq:path('/articles/{date}')
function articleByDate() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getArticlesByDate'
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
 : fonction resource des articles par type
 :
 : @param type type d’articles
 : @return une liste d’articles correspondant au type {essais, chroniques, entretiens, lectures}
 : @discuss le nb d’articles ou l’ordre de tri (articleId, titre, auteur, date, avec ou sans resume) doivent-ils être traités en paramètres ?
 :)
declare 
  %restxq:path('/types/{type}')
function articleByType() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getArticlesByType'
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
 : fonction resource des dossiers
 :
 : @return une liste de dossiers avec titre, présentation et sommaire
 : @discuss le nb de dossiers ou l’ordre de tri dossierId, dossierTitle, articlesNb, editeur(s)) doivent-ils être traités en paramètres ?
 :)
declare 
  %restxq:path('/dossiers')
function dossiers() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getDossiers'
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
 : fonction resource des dossiers par thématique
 :
 : @param theme thématique du dossier {famille de mot-clé "textes regroupés" ou rubrique:109 "Dossier" }
 : @return une liste de dossiers avec titre, présentation et sommaire
 : @discuss le nb de dossiers ou l’ordre de tri dossierId, dossierTitle, articlesNb, editeur(s)) doivent-ils être traités en paramètres ?
 :)
declare 
  %restxq:path('/dossiers/{theme}')
function dossiersByTheme() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getDossiersByThemes'
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
 : fonction resource des auteurs
 :
 : @return une liste d’auteurs
 : @discuss (avec leurs articles ?)
 :)
declare 
  %restxq:path('/auteurs')
function auteurs() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getAuteurs'
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
 : fonction resource des auteurs
 :
 : @param auteurId identifiant de l’auteur
 : @return une liste d’auteurs (auteurId, nom, prenom, orchidId)
 : @discuss (avec leurs articles ?)
 : @discuss le nb de dossiers ou l’ordre de tri articleId, titre article, auteur, date) doivent-ils être traités en paramètres ? 
 :)
declare 
  %restxq:path('/auteurs/{auteurId}')
function autheurById() {
  let $queryParams := map {
    'project' : 'sp',
    'dbName' : 'sp',
    'model' : 'erudit' ,
    'function' : 'getAuteurById'
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
 :
## liste des thématiques
  path: /thematiques
  param:
  output:
    - par thématique: idThematique, nomThematique, nbr d'articles
 :)
 
(:~
 :
## liste des articles par thématique
  path: /thematiques/:idThematique
  param:
    - idThematique: ID {famille de mot-clé Thématique, attribut à ajouter dans la balise <descripteur>}
  output:
    - idThematique, titreThematique, nbr d'articles
    - par article: idArticle, titre article, auteur, date
 :)
 
(:~
 :
## liste des articles par région
  path: /region/:idRegion
  param:
    - idRegion: ID {famille de mot-clé Région, attribut à ajouter dans la balise <descripteur>}
  output:
    - idRegion, titreRegion, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date
 :)
 
(:~
 :
## liste des articles par auteur cité
  path: /auteur-cite/:idAuteurcite
  param:
    - idAuteurcite: ID {famille de mot-clé Auteur cité, attribut à ajouter dans la balise <descripteur>}
  output:
    - idAuteurcite, nomAuteurcite, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date
 :)
 
(:~
 :
## liste des articles par média
  path: /media/:idMedia
  param:
    - idMedia: ID {famille de mot-clé Media + Domaine artistique, attribut à ajouter dans la balise <descripteur>}
  output:
    - idMedia, titreMedia, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date
 :)
 
(:~
 :
## liste des articles par mot-clés
  path: /motcle/:idMotcle
  param:
    - idMotcle: ID {famille de mot-clé "Regroupement Thématique", attribut à ajouter dans la balise <descripteur>} + balise <grmotcle> + mot-clé libre}
  output:
    - idMotcle, Motcle, nbr d'articles
    - par article: idArticle, titreArticle, auteur, date
 :)
 
(:~
 :
## liste des articles par date
  path: /date/YYYY
  param:
    - si YYYY : tous les articles de l'année YYYY
  output:
    - nbr d'articles
    - par article: idArticle, titreArticle, auteur, date
 :)








