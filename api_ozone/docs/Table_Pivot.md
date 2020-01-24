# S02-E04

- [S02-E04](#s02-e04)
  - [Correction challenge movie DB](#correction-challenge-movie-db)
    - [Rappel de récupération d'un repo](#rappel-de-r%c3%a9cup%c3%a9ration-dun-repo)
    - [Entité Casting](#entit%c3%a9-casting)
    - [Ajouter des personnes et des films à Casting](#ajouter-des-personnes-et-des-films-%c3%a0-casting)
    - [Afficher la liste des films](#afficher-la-liste-des-films)
    - [Afficher le détail de chaque film](#afficher-le-d%c3%a9tail-de-chaque-film)
    - [Clés primaires composées](#cl%c3%a9s-primaires-compos%c3%a9es)
  - [Repository ou comment créer des requêtes custom](#repository-ou-comment-cr%c3%a9er-des-requ%c3%aates-custom)
    - [Récupérer la liste des films par ordre alphabétique](#r%c3%a9cup%c3%a9rer-la-liste-des-films-par-ordre-alphab%c3%a9tique)
      - [Avec le Query Builder](#avec-le-query-builder)
      - [DQL (Doctrine Query Language)](#dql-doctrine-query-language)
      - [Utiliser le repository dans le Controller](#utiliser-le-repository-dans-le-controller)
    - [Récupérer le casting d'un film donné](#r%c3%a9cup%c3%a9rer-le-casting-dun-film-donn%c3%a9)
      - [Méthodes possibles dans le Repository de Casting](#m%c3%a9thodes-possibles-dans-le-repository-de-casting)
      - [Modification du controller](#modification-du-controller)
      - [Modification de la vue](#modification-de-la-vue)

## Correction challenge movie DB

### Rappel de récupération d'un repo

- On clone le repo
- On se déplace dans le dossier qui contient le fichier `composer.json`
- On fait un `composer install`
- On crée un fichier `.env.local` pour préciser le chemin d'accès à la base
- `bin/console doctrine:schema:validate` pour vérifier si la base est à jour ou `bin/console d:m:m` pour mettre à jour la base en fonction des migrations

### Entité Casting

Pour le moment, on avait créé une relation ManyToMany entre Person et Movie.

On souhaite que cette liaison soit aussi porteuse d'informations : le credit_order et le role. Pour cela, on est obligé de passer par une entité à part entière, puis de la lier aux deux autres entités existantes.

On fait `bin/console make:entity` pour créer l'entité `Casting`.

| property name | field Type | length | nullable |
| - | - | - | - |
| role | string | 100 | no |
| creditOrder | integer |  | no |

| property name | field Type | related class | nullable | new property in related class | name of the property in related class | deletion of orphaned object |
| - | - | - | - | - | - | - |
| person | ManyToOne | Person | no | yes | castings | yes |
| movie | ManyToOne | Movie | no | yes | castings | yes |

Pour supprimer l'ancienne relation ManyToMany, on doit supprimer dans Movie et Person les références à person et movie (et les méthodes associées).

### Ajouter des personnes et des films à Casting

On crée un controller à part pour cette partie : AddingDataController avec la commande `bin/console make:controller`. On peut supprimer le template qui est créé automatiquement, on ne va pas s'en servir.

Pour créer un casting, on a besoin de films et d'acteurs. On doit les créer en premier.

On récupère l'entity manager en premier : au moins, c'est fait, et le code est plus clair.

Ensuite, on crée une instance de `Person`, et on utilise `setName()` pour préciser le nom. Puis on fait persister les données. Pas besoin de faire le flush tout de suite.

Idem pour le 2e acteur et le film avec l'entitté `Movie`.

```php
/**
 * @Route("/add/casting", name="adding_data_casting")
 */
public function addCasting()
{
    // Avant toute chose, on décide que c'est maintenant qu'on récupère l'entity manager
    // C'est optionnel, on peut le récupérer seulement au moment où on en a besoin
    // Ce qui est intéressant ici c'est qu'en le récupérant d'abord, on aura des bouts de codes mieux séparés
    $em = $this->getDoctrine()->getManager();

    // Création de deux Person
    $leonardo = new Person();
    $leonardo->setName('Leonardo DiCaprio');
    $em->persist($leonardo);

    $brad = new Person();
    $brad->setName('Brad Pitt');
    $em->persist($brad);

    // Création d'un Movie
    $ouatih = new Movie();
    $ouatih->setTitle('Once Upon A Time… In Hollywood');
    $em->persist($ouatih);

    // Création des deux Casting qui relient ces entités
    // Le casting de Leonardo
    $castingL = new Casting();
    $castingL->setRole('Rick Dalton');
    $castingL->setCreditOrder(1);
    $castingL->setPerson($leonardo);
    $castingL->setMovie($ouatih);

    // Le casting de Brad
    $castingB = new Casting();
    $castingB->setRole('Cliff Booth');
    $castingB->setCreditOrder(2);
    $castingB->setPerson($brad);
    $castingB->setMovie($ouatih);
    $em->persist($castingB);

    // on flush toutes nos modifications d'un coup
    $em->flush();

    return $this->json('Casting créé');
}
```

Note : pour que les créations se passent sans problème, il faut s'assurer de bien avoir une valeur par défaut pour le `createdAt` dans `Movie` et `Person`. Pour cela, on rajoute le constructeur (ou on le met à jour s'il existe déjà) :

```php
public function __construct()
{
    $this->createdAt = new \DateTime();
}
```

:zap:  
:zap::zap:  
:zap::zap::zap:  

**Pour créer les données dans la base, il faut se rendre sur l'URL de la route.**

:zap::zap::zap:  
:zap::zap:  
:zap:

### Afficher la liste des films

On crée un nouveau controller MovieController avec la commande `bin/console make:controller`.

Dans ce controller, on se sert de la méthode `index()` créée automatiquement. On modifie sa route en `/` et son nom `movie_list`.

On récupère ensuite la liste des films, puis on l'envoie à la vue.

```php
/**
 * @Route("/", name="movie_list")
 */
public function index()
{
    // On récupère la liste de tous les films
    // Des deux méthodes qu'on a vues, on garde celle qui est en une seule ligne
    $movies = $this->getDoctrine()->getRepository(Movie::class)->findAll();

    return $this->render('movie/index.html.twig', [
        'movies' => $movies,
    ]);
}
```

On passe à la vue `movie/index.html.twig`. Comme on a envoyé un liste de films, on doit boucler dessus.

```twig
{% extends 'base.html.twig' %}

{% block title %}Hello MovieController!{% endblock %}

{% block body %}

<h1>Tous les films</h1>

    <ul>
    {% for movie in movies %}
        <li>{{ movie.title }}</li>
    {% endfor %}
    </ul>

{% endblock %}
```

### Afficher le détail de chaque film

On crée une nouvelle route.

- url : `/movies/{movie}/details`
- nom : `movie_single_details`

En argument de la méthode, on précise qu'on aura un objet de la class `Movie` : Symfony va convertir l'`id` reçu en objet de la class `Movie` correspondant.

On a juste à envoyer cet objet à la vue pour afficher ses informations.

```php
/**
 * @Route("/movies/{movie}/details", name="movie_single_details")
 */
public function singleMovie(Movie $movie)
{
    // Y'a rien à faire, merci le paramConverter qui transforme tout seul l'id dans l'url en un objet de la classe Movie

    return $this->render('movie/single.html.twig', [
        'movie' => $movie,
    ]);
}
```

Dans la vue `movie/single.html.twig`, on peut afficher le titre du film, mais également son casting. Pour cela, on boucle sur `movie.castings`. Ensuite, on peut accéder aux propriétés des person, puis les tables sont liées. On peut ainsi afficher le nom avec `casting.person.name` :

```twig
{% extends 'base.html.twig' %}

{% block title %}{{ movie.title }}{% endblock %}

{% block body %}

    <h1>{{ movie.title }}</h1>

    <h2>Casting</h2>

    <ul>
    {#
    La propriété castings de movie nous donne tous les Casting du film.
    C'est un tableau donc on boucle dessus.
    Pour chaque Casting, la propriété person nous donne les infos de l'acteur de ce Casting
    On peut ainsi afficher le nom de tous les acteur du film
     #}
    {% for casting in movie.castings %}
        <li>{{ casting.person.name }} ({{ casting.role }})</li>
    {% endfor %}
    </ul>

{% endblock %}
```

Pour trier par ordre de crédit, on rajoute une annotation dans l'entité `Movie` sur la propriété `$castings` :

```php
/**
 * @ORM\OneToMany(targetEntity="App\Entity\Casting", mappedBy="movie")
 * @ORM\OrderBy({"creditOrder" = "ASC"})
 */
private $castings;
```

### Clés primaires composées

Pour que `movie_id` et `person_id` deviennent des clés primaires de la table `casting`, on rajoute une annotation `@ORM\Id` sur les propriétés `$movie` et `$person` de l'entité `Casting`, et on supprime la propriété `$id`.

Ensuite, on fait une migration (`bin/console make:migration`) puis `bin/console d:m:m`.

## Repository ou comment créer des requêtes custom

[Lien Classroom](https://classroom.github.com/a/DG4Uc5pc)

Rappel : si on part du classroom, reprendre la [méthode](#rappel-de-r%c3%a9cup%c3%a9ration-dun-repo) vue ce matin.

---

Note sur les Repository : ils sont créés par Symfony quand on crée les Entity. Jusqu'à présent, on ne s'en était pas servi. Ils sont utiles pour créer des requêtes personnalisées que l'on pourra utiliser sur nos entités.

### Récupérer la liste des films par ordre alphabétique

On va dans le fichier `src/Repository/MovieRepository.php`, et on rajoute une méthode qui va nous permettre de récupérer tous les films triés par ordre alphabétique.

Plusieurs méthodes sont possibles :

#### Avec le Query Builder

`m` représente `Movie` puisqu'on est dans `MovieRepository.php`. Doctrine s'occupe de gérer les alias.

On précise l'ordre avec la méthode `orderBy`. Le paramètre `ASC` est optionnel car c'est la valeur par défaut.

```php
/**
 * @return Movie[] Returns an array of Movie objects
 */
public function findAllOrderedByTitle()
{
    return $this->createQueryBuilder('m')
        ->orderBy('m.title', 'ASC')
        ->getQuery()
        ->getResult()
    ;
}
```

#### DQL (Doctrine Query Language)

On écrit la requête en SQL mais à la sauce Doctrine. Dans le `FROM`, on utilise le FQCN de `Movie` en précisant que `m` correspond à `Movie`, et l'ordre de tri.

```php
/**
 * @return Movie[] Returns an array of Movie objects
 */
public function findAllOrderedByTitleDQL()
{
    return $this->getEntityManager()
        ->createQuery('
            SELECT m
            FROM App\Entity\Movie m
            ORDER BY m.title ASC
        ')
        ->getResult();
}
```

#### Utiliser le repository dans le Controller

On utilise maintenant notre méthode à la place de `findAll()`.

Note : on aurait aussi pu utiliser la méthode native de Symfony `findBy()`.

```php
public function index()
{
    $movies = $this->getDoctrine()->getRepository(Movie::class)->findAllOrderedByTitle();
    // Autre méthode possible, sans utiliser la requête custom :
    // $movies = $this->getDoctrine()->getRepository(Movie::class)->findBy([],['title' => 'ASC']);
    return $this->render('main/index.html.twig', [
        'movies' => $movies
    ]);
}
```

### Récupérer le casting d'un film donné

- méthodes de repo
- controller
- vue

#### Méthodes possibles dans le Repository de Casting

Là encore, on peut utiliser 2 méthodes : soit avec le query builder, soit en DQL. On utilisera de préférence le query builder.

Le gros avantage de cette requête custom, c'est qu'on récupère en même temps les données des acteurs. Doctrine n'aura pas besoin de refaire une requête par acteur pour récupérer leur nom :arrow_right: gain de performance.

- DQL : on passe l'objet `$movie` en paramètre, puis on faire une jointure sur la table Person en précisant les alias.

```php
public function findByMovieDQL($movie)
{
    $query = $this->getEntityManager()->createQuery('
        SELECT c, p
        FROM App\Entity\Casting c
        JOIN c.person p
        WHERE c.movie = :movie
    ')
    ->setParameter('movie', $movie);
    return $query->getResult();
}
```

- Query Builder :

```php
public function findByMovie($movie)
{
    $qb = $this->createQueryBuilder('c')
    ->addSelect('p')
    ->join('c.person', 'p')
    ->where('c.movie = :myMovie')
    ->setParameter('myMovie', $movie)
    ;

    return $qb->getQuery()->getResult();
}
```

#### Modification du controller

On utilise maintenant notre nouvelle méthode pour chercher le casting du film. On retournera le résultat de la requête à la vue :

```php
public function singleMovie(Movie $movie)
{
    // Au lieu de se fier à Doctrine pour faire des requêtes lorsqu'on affiche les noms des Person, on exécute notre propre méthode du repository
    // on stocke le résultat dans une variable, puis on la transmet à la vie
    $cast = $this->getDoctrine()->getRepository(Casting::class)->findByMovie($movie);


    return $this->render('movie/single.html.twig', [
        'movie' => $movie,
        'cast' => $cast,
    ]);
}
```

#### Modification de la vue

Auparavant, on bouclait sur `movie.castings`. On peut maintenant boucler directement sur `cast` :

```twig
{% extends 'base.html.twig' %}

{% block title %}{{ movie.title }}{% endblock %}

{% block body %}

    <h1>{{ movie.title }}</h1>

    <h2>Casting</h2>

    <ul>
    {% for casting in cast %}
        <li>{{ casting.person.name }} ({{ casting.role }})</li>
    {% endfor %}
    </ul>

{% endblock %}
```