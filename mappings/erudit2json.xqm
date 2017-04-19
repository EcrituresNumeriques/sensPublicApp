xquery version '3.0' ;
module namespace sp.mappings.erudit2html = 'sp.mappings.erudit2json' ;

(:~
 : This module is a erudit to json function library for SynopsX
 :
 : @version 2.0 (Constantia edition)
 : @since 2016-12-08 
 : @author Emmanuel Château-Dutier
 :
 : This file is part of SynopsX.
 : created by AHN team (http://ahn.ens-lyon.fr)
 :
 : SynopsX is free software: you can redistribute it and/or modify
 : it under the terms of the GNU General Public License as published by
 : the Free Software Foundation, either version 3 of the License, or
 : (at your option) any later version.
 :
 : SynopsX is distributed in the hope that it will be useful,
 : but WITHOUT ANY WARRANTY; without even the implied warranty of
 : MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 : See the GNU General Public License for more details.
 : You should have received a copy of the GNU General Public License along 
 : with SynopsX. If not, see http://www.gnu.org/licenses/
 :)

declare namespace erudit = 'http://www.erudit.org/xsd/article';

declare default function namespace 'sp.mappings.erudit2json' ;

declare function wrapper($queryParams as map(*), $data as map(*), $outputParams as map(*) ) {
  let $jsonFormat := map{
    'format' : $outputParams('jsonFormat')
  }
  let $meta := map:get($data, 'meta')
  let $content := map:get($data, 'content')
  


  (: for $article in $content :)
  return json:serialize($meta, $jsonFormat)
  };
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  