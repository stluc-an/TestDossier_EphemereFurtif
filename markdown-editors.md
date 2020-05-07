# Éditeurs Markdown & images
Le format Markdown permet de faire des liens vers des images (comme l'HTML).

Pour que les images s'affichent sur Github, il faut que les chemins vers les images soient relatifs (chemin par rapport au fichier Markdown visualisé). 

Si les images sont contenues dans un sous-dossier, il faut que le chemin soit (par exemple) "img/test.jpg". Beaucoup d'éditeurs utilisent les conventions de l'OS sur lequel ils tournent, et donc sous Windows créent des chemins en "img\\test", qu'il faut donc corriger manuellement.

## En Markdown (peu importe l'éditeur)
- Votre image se trouve dans le dossier de votre fichier, ou dans un sous-dossier.
- Insérer l'image avec `![`description`](dossier/image.jpg)`

## [Markdown Text](https://marktext.app/)
- Par défaut, les images insérées par l'interface ou drag&drop ont un chemin absolu, et les images copie-collées sont uploadées sur un service en ligne

- Ce qui marche bien: chemin manuel avec autocomplete
    - Dans les paramètres, activer l'option Image -> "Insert absolute or relative path of image"
    - Votre image se trouve dans le dossier de votre fichier, ou dans un sous-dossier.
    - Insérer une image avec "Embed Link"
    - Écrire le chemin manuellement; il y a un autocomplete, [bien qu'un peu foireux](https://github.com/marktext/marktext/issues/2001). Utilisez "/" plutôt que "\\" pour les sous-dossiers.

- Plus chipo: drag&drop, copier coller ou importation
    - Dans les paramètres, activer l'option Image -> "Move Image To Special Folder"
    - Sélectionner le dossier dans lequel vous allez mettre toutes vos images (le setting est malheureusement général au programme). 
        - Conséquence: les image ajoutées seront automatiquement copiées dans le dossier spécifié
    - Insérant une image par drag&drop, copier-coller, ou importation (Select)
    - Éditant l'image (icône crayon) et changeant manuellement le chemin absolu en chemin relatif (par rapport au fichier Markdown que vous éditez), et en remplaçant les "\\" par des "/" sous Windows.

## [Zettlr](https://www.zettlr.com/)
- Par défaut, drag&drop crée des chemins absolus, et copier-coller des chemins relatifs. Les chemins créés sous la version Windows utilisent "\\" plutôt que "/"

- Ce qui marche: drag & drop
    - Votre image se trouve dans le dossier de votre fichier, ou dans un sous-dossier.
    - Vous faites un drag&drop de votre image dans le document
    - Vous éditez manuellement le chemin pour qu'il soit relatif au document, et (sous Windows) remplacez les "\\" par "/"

- Ce qui marche aussi: copier-coller
    - Vous copiez l'image (ça ne semble fonctionner qu'à partir de certains programmes)
    - Vous collez l'image dans votre document
    - Vous choissisez le nom de fichier & décidez de sauver le fichier soit dans le "current directory", ou dans un sous-dossier
    - Le chemin est relatif! Vous devez juste (sous Windows) remplacez les "\\" par "/"


