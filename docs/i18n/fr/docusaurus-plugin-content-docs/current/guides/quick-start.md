---
sidebar_position: 1
---

# Guide de Démarrage Rapide

Commencez à utiliser Alphasow UI en quelques minutes seulement.

## Installation

Ajoutez Alphasow UI à votre `pubspec.yaml` :

```yaml
dependencies:
  alphasow_ui: ^1.21.0
```

Exécutez la commande d'installation :

```bash
flutter pub get
```

## Configuration de Base

### 1. Importez Alphasow UI

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

### 2. Enveloppez Votre Application

Remplacez votre `MaterialApp` ou `CupertinoApp` par `AlphasowUiApp` :

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      title: 'Mon App Alphasow UI',
      home: const HomeScreen(),
    );
  }
}
```

### 3. Créez Votre Premier Écran

```dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: const Text('Bienvenue'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bonjour, Alphasow UI !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            AsButton(
              onPressed: _showSuccessMessage,
              child: Text('Bouton de Test'),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showSuccessMessage(BuildContext context) {
    context.showBanner(
      message: 'Bouton pressé avec succès !',
      type: AlertType.success,
    );
  }
}
```

## Fonctionnalités Clés Activées

En utilisant `AlphasowUiApp`, vous obtenez automatiquement :

- **Adaptation de plateforme** - Les composants basculent entre les styles Material et Cupertino
- **Système de bannières** - Overlay de notifications globales via `context.showBanner()`
- **Thème cohérent** - Gestion centralisée des thèmes
- **Support d'accessibilité** - Lecteur d'écran intégré et navigation au clavier

## Prochaines Étapes

- Explorez la [Bibliothèque de Composants](../components/overview)
- Consultez la [Démo en Direct](https://ui.alphasow.dev)

## Problèmes Courants

### Erreurs d'Import
Assurez-vous d'importer le package principal :
```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

### Détection de Plateforme
La détection de plateforme fonctionne automatiquement, mais vous pouvez vérifier la plateforme actuelle :
```dart
final platform = PlatformType.currentPlatform();
print('Plateforme actuelle : $platform'); // cupertino ou material
```

### La Bannière ne s'Affiche Pas
Assurez-vous que votre application est enveloppée avec `AlphasowUiApp` et que vous appelez `showBanner` sur un `BuildContext` valide.