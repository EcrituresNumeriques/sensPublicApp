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
 










