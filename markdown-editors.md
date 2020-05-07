# Éditeurs Markdown & images
Le format Markdown permet de faire des liens vers des images (comme l'HTML).

Pour que les images s'affichent sur Github, il faut que les chemins vers les images soient relatifs (chemin par rapport au fichier Markdown visualisé). 

Différents éditeurs gèrent ça de différentes manières:

- [Markdown Text](https://marktext.app/)
    - Par défaut, les images insérées par l'interface ou drag&drop ont un chemin absolu, et les images copie-collées sont uploadées sur un service en ligne

    - Ce qui marche
        - Avec l'option Image -> "Insert absolute or relative path of image"
        - En insérant une image avec "Embed Link"
        - En écrivant le chemin manuellement (il y a un autocomplete, [bien qu'un peu foireux](https://github.com/marktext/marktext/issues/2001))

    - Ce qui marche, mais moins bien
        - Avec l'option Image -> "Move Image To Special Folder"
        - En sélectionnant le dossier dans lequel vous allez mettre toutes vos images (le setting s'applique au programme et n'est pas relatif au projet). 
            - Conséquence, les image ajoutées seront automatiquement copiées dans le dossier spécifié
        - En insérant une image par drag&drop, copier-coller, ou upload
        - En éditant l'image (icône crayon) et changeant manuellement le chemin absolu en chemin relatif
- [Zettlr](https://www.zettlr.com/)
    - ![47dc7588b66a956f27a13cc18e230c0e.png](Dossier\img\47dc7588b66a956f27a13cc18e230c0e.png)

