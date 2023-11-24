# Pour Android Studio
- génértion d'un Keystore valable 10 000 jours:
```bash
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```
- dpélacer le fichier `my-release-key.jks` de la racine du projet dans le dossier `android/app`

- Créer le fichier `android/key.properties` avec le contenu suivant:
```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=my-release-key.jks
```
- Modifier le fichier `android/app/build.gradle`:
```gradle
signingConfigs {
        release {
            storeFile file('my-release-key.jks')
            storePassword project.findProperty("storePassword") ?: ""
            keyAlias project.findProperty("keyAlias") ?: ""
            keyPassword project.findProperty("keyPassword") ?: ""
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.release
        }
    }
```
- Générer un APK signé:
```bash
flutter build apk --release
```

- ou un bundle:
```bash
flutter build appbundle --release
```

Fin de la signature du code.

# Pour iOS

````
flutter build ios --release
````

Ouvrir le projet dans Xcode et suivre les instructions de signature du code.

````
open build/ios/Runner.xcworkspace
````

Dans Xcode, sélectionner le projet dans le volet de navigation.

Accéder à "Signing & Capabilities" (Signature et capacités) dans l'onglet "Runner".

Configurer mon équipe de développement Apple et vérifier que le "Signing Certificate" est défini sur "iOS Developer" ou un certificat de distribution si build pour la distribution.

Cliquer sur le bouton "Archive" dans Xcode pour créer une archive de l' application.

Dans la fenêtre "Organizer" qui s'ouvre après l'archivage, je peux choisir de distribuer mon application en tant qu'IPA ou de l'envoyer directement sur l'App Store.

Fin de la signature du code pour iOS.