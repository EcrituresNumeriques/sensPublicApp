xquery version "3.0" ;
module namespace sp.models.erudit = 'sp.models.erudit' ;

(:~
 : This module is a TEI models library for paris' guidebooks edition
 :
 : @author emchateau (Cluster Pasts in the Present)
 : @since 2014-11-10 
 : @version 0.2
 : @see http://guidesdeparis.net
 :
 : This module uses SynopsX publication framework 
 : see https://github.com/ahn-ens-lyon/synopsx
 : It is distributed under the GNU General Public Licence, 
 : see http://www.gnu.org/licenses/
 :
 :)

import module namespace synopsx.models.synopsx = 'synopsx.models.synopsx' at '../../../models/synopsx.xqm' ;

(: declare namespace erudit = 'http://www.erudit-c.org/ns/1.0' ; :)
declare namespace erudit = 'http://www.erudit.org/xsd/article' ;

declare default function namespace 'sp.models.erudit' ;

(:~
 : ~:~:~:~:~:~:~:~:~
 : 
 : ~:~:~:~:~:~:~:~:~
 :)
 
(:~
 : this function get an Article list
 :
 : @param $queryParams the request params sent by restxq
 : @return a map with meta and content
 :)
declare function getArticles($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)//erudit:article
  let $meta := map{
    'title' : 'Liste d’articles', 
    'keywords' : $articles//erudit:liminaire/erudit:grmotcle/erudit:motcle/text()
    }
  let $content := for $article in $articles return map {
    'title' : $article//erudit:liminaire/erudit:grtitre/erudit:titre,
    'authors' : $article//erudit:liminaire/erudit:grauteur,
    'article' : $article
    }
  return  map{
    'meta'    : $meta,
    'content' : $content
    }
};


declare function getArticleById($queryParams as map(*)) as map(*) {
  let $articleId := map:get($queryParams, 'articleId')
  let $article := synopsx.models.synopsx:getDb($queryParams)//erudit:article[admin/revue[@id="{$articleId}"]]
  let $meta := map {
    'title' : 'Article n.{$articleId}'
    }
  let $content := map {
    'title' : $article//erudit:liminaire/erudit:grtitre/erudit:titre,
    'authors' : $article//erudit:liminaire/erudit:grauteur,
    'article' : $article
  }
  return map {
    'meta'    : $meta,
    'content' : $content
  }
};

declare function getArticlesByDate($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

declare function getArticlesByType($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

declare function getDossiers($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

declare function getDossiersByThemes($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

declare function getAuteursList($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

declare function getAuteurById($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)
  return map{
    '' : ''
  }
};

