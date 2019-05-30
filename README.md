# REQRES


Sart : 10h12

Create Project : 10h15

Model + API : 11h23:wq

Add the UIViewController + End : 10h14



LIBRAIRIE:

Alamofire pour les requêtes.
Une erreur de l'avoir utiilisée. J'ai passé trop de temps à update pod, trouvé la version pour swift 5...
Je trouve Alamofire très efficace pour les requêtes et très simple à utilisée en pair avec Decodable.



ARCHITECTURE:

Je n'ai pas vraiment eu le temps de poser une architecture cohérente.

Mon objectif premier étant d'isoler l'appel à l'API pour pouvoir le faker et le rendre testable.
Ensuite de l'injecter dans mon controller.
A terme j'aurai viser uen clean Architecture en posant un cycle VIP pour l'affichage des pages, et un pour la selection des pages.

En état le fetcher contient également le model de la page. Qui est facilement testable en fekant l'APIFetcher.



AUTRES:

Je n'ai pas changé la target pour la version de deployment mais cela tourne sous 10.0
J'ai préféré travailler sur la pagination plutot que sur le second écran qui me semblait moins interessant à developper.
Je n'ai pas eu le temps de travailler le UICollectionViewFlowLayout ni la UICollectionViewCell ... d'ou le résultat graphique très moyen.
J'ai préparé le travail pour recharger la page section par section.
Le convertisseur de couleur n'est pas de moi.
J'ai préparé la gestion d'erreur mais je ne l'ai pas utilisé.
Le bouton back fait bugger l'application. Pour un rechargement total j'aurai fais un back sans animation et relancer le fetcher. Cela aurai permis de refaire l'indicateur de chargement. (Finalement je l'ai fait mais après la fin du test)

Je pense qu'il m'a manqué une bonne heure pour finir proprement le test et le réorganiser :/ Un peu plus pour ajouter les tests.
