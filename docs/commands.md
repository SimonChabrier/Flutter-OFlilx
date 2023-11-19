# créer un projet
flutter create nom_du_projet
# lancer le projet
cd nom_du_projet
flutter run
# créer un projet pour certaines plateformes seulement
flutter create --platforms=adroid,web nom_du_projet
# equivalent à package.json
pubspec.yaml
# installer une dépendance
flutter pub add nom_du_package
# installer toutes les dépendances
flutter pub get
# mettre à jour les dépendances
flutter pub upgrade
# mettre à jour flutter
flutter upgrade
# mettre à jour flutter et les dépendances
flutter pub upgrade --major-versions
# Dossier lib: 
contient le code source et le fichier main.dart qui est le point d'entrée de l'application
# Dossier test: 
contient les tests
# Dossier android: 
contient le code source pour android
# Dossier ios: 
contient le code source pour ios
# Dossier web: 
contient le code source pour web
# Dossier build: 
contient les fichiers compilés
# Devices:
flutter devices
# Devices disponibles:
flutter devices
# lancer l'App sur un device:
flutter run -d Choix_du_device de la liste
# Rafraichir l'App pour mettre à jour les changements:
r (dans le terminal où on a lancé l'App)
# Pour pas bloquer les images chargées depuis le net si on est en local:
flutter run -d chrome --web-browser-flag "--disable-web-security"

