
<!-- TOC depthFrom:2 depthTo:2 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Intention](#intention)
- [Axe 1 : Lire](#axe-1-lire)
- [Axe 2 : Explorer](#axe-2-explorer)
- [Axe 3 : Converser / discuter / critiquer](#axe-3-converser-discuter-critiquer)
- [Axe 4 : Collectionner](#axe-4-collectionner)
- [Axe 5 : Connecter](#axe-5-connecter)
- [Spécifications](#spcifications)
- [Meta-navigation](#meta-navigation)
- [HOME](#home)
- [Pages](#pages)

<!-- /TOC -->


# Cahiers des charges Sens Public (revue scientifique en ligne)

## Intention

Avant d'être une revue scientifique, Sens Public s'est toujours positionnée comme un réseau de personnes. Cette particularité demeure un objectif central pour la refonte du site : connecter des personnes et ouvrir un espace public de discussion. La revue est donc l'espace d'articulation entre des énoncés, une communauté et leur conversation ; un espace où du _sens public_ peut justement se produire.

Le site de la revue doit se déployer selon 4 axes :

  1. Lire
  2. Explorer
  3. Discuter
  4. Collectionner
  5. Connecter

Les 4 axes fonctionnent ensemble et sont interdépendants.

## Axe 1 : Lire
Le premier axe «Lire» repose sur les textes eux-mêmes. Il consiste à rendre le corpus des articles de la revue consultable sous différents formats. Les articles seront stockés au format XML, exposés avec leurs métadonnées par le biais du framework Synopsx, permettant de construire une API sur un corpus de ressources XML.

## Axe 2 : Explorer
Le second axe «Explorer» repose sur les métadonnées des ressources, également présentes dans les XML des articles. Il s'agit de proposer des navigations possibles, au sein du corpus et vers l'extérieur, selon plusieurs parcours :
1. la méta-navigation de la revue :
  * les types de contenus: essais, chroniques, dossiers, etc. voir [Types de contenus](#types-de-contenu))
  * les thématiques (au nombre de 5 actuellement)
  * les langues
  * ...
2. des rebonds internes (d'article à article) à partir des métadonnées de l'article : auteur, keyword, ...
3. des rebonds externes en exploitant la richesse sémantique des articles liée à diverses autorités. Ces éléments doivent permettre d'effectuer des requêtes précises dans des moteurs spécialisés, notamment rechercheisidore.fr.
4. des rebonds internes à travers les annotations (voir axe 3), les collections (voir axe 4) et les connexions (voir axe 5)

## Axe 3 : Converser / discuter / critiquer
Le troisième axe «Converser» se base sur l'outil d'annotation Hypothes.is[^hypotesis], lui-même basé sur la librairie Annotator.js. Outre un accès ergonomique et intégré de l'outil d'annotation au fil de la lecture d'un texte, nous souhaitons pouvoir renverser le paradigme de navigation de la revue scientifique, basé traditionnellement sur les articles, en proposant comme point d'entrée principal la conversation. L'API d'Hypothes.is nous permet en effet d'exposer les annotations avec toutes leurs métadonnées (fragment et URI de la source annotée, auteur de l'annotation, mots-clé, commentaire, date/heure, etc.).

Un effort particulier de conception et de présentation de cette conversation doit être apporté. Il faut prévoir à la fois une intégration fine et ergonomique des textes et de leur conversation, et à la fois la possibilité de changer de point de vue et d'adopter celui de la conversation. De cette manière, la conversation est susceptible de ne pas être accessoire aux textes, mais de devenir le point d'accroche de la communauté de lecteurs, de développer une pratique critique collective, ainsi que des dialogues inter-culturels (en considérant des passerelles linguistiques). La conversation et les articles peuvent alors constituer les deux faces d'une même pièce.

[^hypotesis]: Il s'agit d'un outil d'annotation intra-textuel produisant des annotations indexées c'est-à-dire possédant une URI propre et requêtable via une API dédiée.

Un des objectifs de cet axe «Discuter» est de susciter une démarche critique dans les pratiques d'annotations. Une piste à explorer pourrait être de catégoriser[^categoriser] les annotations et la conversation en général. Mais la dynamique critique, en tant que démarche d'appropriation, pourrait également se manifester dans l'axe «Collectionner».

[^categoriser]: sur le mode de [polemictweet](http://polemictweet.com/) où certains tags ou attributs de l'annotation appartiennent à un vocabulaire contrôlé permettant de qualifier la valeur critique d'une annotation.

Un effort de modélisation de la conversation serait ici nécessaire :

* identifier les primitives
* définir des catégories
* définir des scénarios d'annotation
* définir des parcours de lecture dans les annotations.

Catégories (même pas un premier jet):
  * d'accord/pas d'accord
  * "ca me fait penser à" : associer.
    principe : baser la discussion sur la connexion, pour que les deux s'alimentent.
    possibilité d'aller chercher la source parmis des référentiels (DOI, Isidore, ...)
  * intégrer une partie bibliographique + aspects autorité.

commentaire Gérard :  
> C'est l'idée de lien. on ouvre à la bibliothèque, à l'archive. Dimension référentiel et associatif.

## Axe 4 : Collectionner

Cet axe proposera au lectorat de créer des collections d'élements qui pourront être soit des fragments d'articles, soit des annotations (propres ou appartenant à d'autres utilisateurs). Cet axe fait se croiser deux contributions théoriques, celle d'_anthologie_ de Milad Douhei et celle de _cristal de connaissance_, _«crystal of knowledge»_ de JC. Guédon[^guedon].

[^guedon]: Stern, Niels, Jean-Claude Guédon et Thomas Wiben Jensen. « Crystals of Knowledge Production. An Intercontinental Conversation about Open Science and the Humanities ». Nordic Perspectives on Open Science 1, no 0 (23 octobre 2015), 1‑24. doi:10.7557/11.3619.

Si la collection ne relève pas de la production d'un texte nouveau, elle relève bien malgré tout d'une démarche critique dans la mesure où le lecteur construit sa propre interprétation d'un champs ou d'un concept, en y agrégeant des éléments de connaissances glânés au fil de ses lectures. C'est l'association de ces éléments qui est herméneutique, au sens où il construit du sens. On pourrait envisager que ces collections puissent être soit publiques, soit privées, selon la volonté du collectionneur.

Une collection publique revient à un acte de publication par lequel le lecteur se fait éditeur de fragments en proposant un chemin de lecture propre.


## Axe 5 : Connecter
Le quatrième axe «Connecter» consiste à favoriser la création d'un espace public en favorisant les connexions entre auteurs et lecteurs d'une part, mais aussi au sein de la communauté de lecteurs, et par extension avec les personnes impliquées indirectement (par voie bibliographique) dans les articles.

Cet axe est donc une condition de possibilité de l'axe «Converser» car préalablement à la discussion scientifique, il notifie les uns et les autres des prises de position, des emprunts ou encore des citations, il suscite des intérêts et permet de les partager.

Cet axe repose à nouveau sur la richesse sémantique des métadonnées de l'article (ou des annotations), par exemple de la bibliographie, permettant d'identifier des individus et d'effectuer des requêtes sur différents services (Orcid, Zotero, Twitter, GG Scholar), et finalement de générer semi-automatiquement des notifications aux différents acteurs en présence (auteur de l'article, auteurs cités, lecteurs).


---

## Spécifications

### Principe pour l'inter-connexion
<!-- copier-coller de ton mail en attendant mieux -->
* Récupérer le plus d'infos possibles sur chaque personne citée: blog, page institutionnelle, orcid, twitter, Facebook, mail, autres articles, scholar, autres articles qui le citent profil hypothesis. À faire sur stylo. Au niveau auteur et en rajoutant une couche éditoriale
* Donner la possibilité au lecteur de le notifier. Notifier via annotations sur lui sur hipothesis.

* Connecter en premier des personnes à partir d'une ressource pour ensuite connecter des ressources et déclencher un travail d'annotations et de discussion

* Toutes les autres infos sur l'article - mots clés, citabilité etc, doivent été fonctionnelles à cette possibilité de connexion.

* Imaginer ensuite la possibilité de se créer un profil sens public qui sera justement un agrégateur de profils existants sur d'autres plateformes - oui ça demande la création d'un cms social... mais ça peut être fait en un second temps.


## Meta-navigation

### Institutionnel

* Qui?
* liens
* Publier
* Contact
* Adhésion
* Newsletter

### Types de contenu

* Essais
  * description:
  * particularité (affichage, métadonnées, ?):
  *
* Chroniques
* Entretiens
* Lectures
* Créations
* Dossiers
* Actes de colloque <!-- à conserver ?-->

### Thématiques
<!-- Nécessité de revoir tout cela-->
* Arts et lettres
* Histoire
* Monde numérique
* Philosophie
* Politique et société
* Sciences et environnement

### Classes de mots-clés dans SPIP

SPIP gère plusieurs types de mots-clés. C'est une information qui n'est pas présente actuellement dans les xml produits.

**Principe** :
  * Considérer infoarticle//grdescripteur comme le vocabulaire contrôlé
  * considérer liminaire//grmotcle comme les mots-clés article libres

Depuis SPIP, A distinguer et à récupérer les classes de mots-clés:

1. "admin"
    * certains mots-clés sont éditoriaux (gère la une par exemple) :
    * focus
    * focus-creation
    * essais (permettait de gérer une double appartenance de rubrique ex: Essai+Lecture). Pour Erudit, par défaut on veut garder les articles comme "essais"
2. lang (on a le multilangue sur SP)
3. auteurs cités: aligné Rameau
4. médias: si vidéo ou son
5. région du monde: aligné Rameau
6. regroupement thématique ("mot-clés"): aligné sur Rameau (à vérifier)
    * cf infoarticle//grdescripteur::scheme="rameau"//descripteur
    * à fusionner avec les "mots-clés libres"
7. domaine artistique:
8. textes regroupés: titre de dossier (déjà récupéré)
    * numero//grtheme//theme::id="th1090" (c'est l'id de article dans lequel on trouve le sommaire et la présentation du dossier)
9. thématiques: vocabulaire contrôlé

**Solution envisagée :**
  * meilleure hypothèse : on arrive à récupérer les mots-clés libre (sous le résumé) qu'on mettra dans "grmotcle" à la place des mots-clés récupérés actuellement (peu pertinent)
  * autre solution : on paie un étudiant pour le faire sur les 1500 articles

### idRubriques

* essai:58
* chronique:114
* entretiens:113
* lecture:76
* création:60
* dossier:109 contient uniquement les articles sommaire de chaque dossier

---

# Scheme URI

voir sur Github : https://github.com/EcrituresNumeriques/sensPublicApp/blob/master/doc/schemaURI.md

---

# Conception des pages

## HOME

## Pages

### Page article

* données à récupérer :
  * date publication: numero//pubnum//date::typedate="publication"
  * rubrique: pas dans la base xml actuellement, stockée ailleurs ?
  * auteur: liminaire//grauteur//auteur//prenom+nomfamille
  * id auteur: liminaire//grauteur//auteur::id="spAuthor1100"
    * question: est ce que Erudit le remplace avec ses propres id d'auteur
    * question: on voudrait ajouter des id type orchid dans notre propre namespace.
  * titre: liminaire//grtitre/titre
  * sous-titre: liminaire//??
  * résumé: liminaire//resume::lang="fr"
    * si plusieurs résumés :
  * document pdf:
    * construire le chemin à partir de l'identifiant de l'article (id SPIP)
  * lien vers traduction (article sur sp):
  * keyword article (dits "mots-clés libres") : on les a pas
    * concat liminaire//grmotcle
      * attention à ne pas intégrer les mots-clés de class "admin" (nettoyage à la main dans les xml)
  * corps du texte:
    * corps//
      * section : div section
      * para//alinea div p
      * figure//objetmedia//image
        * gestion des images ?
  * footnotes: partiesann//grnote//note
  * bibliographie list: partiesann//grbiblio//biblio//titre//
    * référence bibliographie: partiesann//grbiblio//biblio//refbiblio
  * image de une + légende (stockée dans le champs sur-titre de l'article)

### Page essai
###

### Page auteur
  * générée en interrogeant ORCHID

### Page meta
  * (contact, qui sommes nous ?, publier, etc.)
  * à faire en statique ?

### Page Recherche

### Page Résultats de recherche

### Page mot-clés thématique (voir mots-4.html)

  * thématiques : mise en forme : titre, auteur, résumé, image de une

### Page mot-clés (voir mots.html)

  * simple liste

### Page Tous les auteurs

### Flux RSS

### Page plan du site

### Pages Rubrique
Ces pages sont à repenser.

#### Page Essais
* classés par numéro (par an)
* ordre chronologique
* titre/auteur

#### Page Chronique
* 10 derniers puis liste
* titre/auteur/résumé/image

#### Page Entretiens
* 10 derniers puis liste
* titre/auteur/résumé/image

#### Page Lectures
* filtrage possible (par thématique)

#### Page Créations
* bloc titre/auteur/résumé/image
* ordre aléatoire

#### Page Dossiers
* bloc titre/auteur/résumé/image
* ordre aléatoire

#### Acte de colloque
* à supprimer et mettre dans Dossiers





#### Attributs qui nous manque dans les XML Erudit produits.

  * les identifiants (rubrique, article, etc)
  * le marquage sémantique à l'intérieur de para//marquage : besoin de créer un attribut
  * identifiant orchid
