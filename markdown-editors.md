# Éditeurs Markdown & images
Le format Markdown permet de faire des liens vers des images (comme l'HTML).

Pour que les images s'affichent sur Github, il faut que les chemins vers les images soient relatifs (chemin par rapport au fichier Markdown visualisé). 

Si les images sont contenues dans un sous-dossier, il faut que le chemin soit (par exemple) "img/test.jpg". Beaucoup d'éditeurs utilisent les conventions de l'OS sur lequel ils tournent, et donc sous Windows créent des chemins en "img\test", qu'il faut donc corriger manuellement.

- [Markdown Text](https://marktext.app/)
    - Par défaut, les images insérées par l'interface ou drag&drop ont un chemin absolu, et les images copie-collées sont uploadées sur un service en ligne

    - Ce qui marche bien
        - Votre image se trouve dans le dossier de votre fichier, ou dans un sous-dossier.
        - Avec l'option Image -> "Insert absolute or relative path of image"
        - En insérant une image avec "Embed Link"
        - En écrivant le chemin manuellement (il y a un autocomplete, [bien qu'un peu foireux](https://github.com/marktext/marktext/issues/2001)). Utilisez "/" plutôt que "\" pour les sous-dossiers.

    - Ce qui marche, mais moins bien
        - Avec l'option Image -> "Move Image To Special Folder"
        - En sélectionnant le dossier dans lequel vous allez mettre toutes vos images (le setting est malheureusement général au programme). 
            - Conséquence, les image ajoutées seront automatiquement copiées dans le dossier spécifié
        - En insérant une image par drag&drop, copier-coller, ou upload
        - En éditant l'image (icône crayon) et changeant manuellement le chemin absolu en chemin relatif (par rapport au fichier Markdown que vous éditez), et en remplaçant les "\" par des "/" sous Windows.

- [Zettlr](https://www.zettlr.com/)
    - Par défaut, drag&drop crée des chemins absolus, et copier-coller permet des chemins relatifs. Les chemins créés sous la version Windows

    - Ce qui marche
        - Votre image se trouve dans le dossier de votre fichier, ou dans un sous-dossier.

![E:\_Arbeit\Saint Luc\AN\19-20\an2\TestDossier2020\Dossier\img\560633df34858f81884fc1fb215c971fd7988973.jpg](E:\_Arbeit\Saint Luc\AN\19-20\an2\TestDossier2020\Dossier\img\560633df34858f81884fc1fb215c971fd7988973.jpg)
