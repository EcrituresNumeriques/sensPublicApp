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

declare namespace erudit = 'http://www.erudit-c.org/ns/1.0' ;

declare default function namespace 'sp.models.erudit' ;

(:~
 : ~:~:~:~:~:~:~:~:~
 : tei blog
 : ~:~:~:~:~:~:~:~:~
 :)
 
(:~
 : this function get the blog home
 :
 : @param $queryParams the request params sent by restxq
 : @return a map with meta and content
 :)
declare function getArticleList($queryParams as map(*)) as map(*) {
  let $articles := synopsx.models.synopsx:getDb($queryParams)//erudit:article
  let $meta := map{
    'title' : 'Liste article', 
    'keywords' : for $article in $articles return $articles//erudit:grTheme/erudit:theme/text()
    }
  let $content := for $article in $articles return map {
    'title' : '',
    'article' : $article
    }
  return  map{
    'meta'    : $meta,
    'content' : $content
    }
};

