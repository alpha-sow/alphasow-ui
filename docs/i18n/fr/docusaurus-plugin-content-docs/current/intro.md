---
sidebar_position: 1
---

# Commencer avec Alphasow UI

Bienvenue dans **Alphasow UI** - un package Flutter complet fournissant des composants d'interface utilisateur réutilisables avec un thème cohérent et une adaptation de plateforme.

## Qu'est-ce qu'Alphasow UI ?

Alphasow UI est un package Flutter qui offre :

- 🎨 **Thème Cohérent** - Système de thème centralisé avec support du mode sombre/clair
- 📱 **Adaptatif Multi-Plateforme** - Style Material/Cupertino automatique selon la plateforme
- 🔔 **Système de Bannières** - Système d'overlay de notifications intégré
- 🧩 **Composants Complets** - Boutons, champs de saisie, alertes, chargeurs, menus, et plus
- 🌍 **Accessibilité** - Support d'accessibilité intégré dans tous les composants

## Prérequis

- [Flutter SDK](https://flutter.dev/docs/get-started/install) version **3.16.0** ou supérieure
- [Dart SDK](https://dart.dev/get-dart) version **3.5.3** ou supérieure

## Installation

Ajoutez Alphasow UI à votre projet Flutter en l'ajoutant à votre fichier `pubspec.yaml` :

```yaml
dependencies:
  alphasow_ui: ^1.23.2
```

Puis exécutez :

```bash
flutter pub get
```

## Démarrage Rapide

### 1. Enveloppez votre application avec AlphasowUiApp

Pour activer toutes les fonctionnalités d'Alphasow UI, enveloppez votre application avec `AlphasowUiApp` :

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlphasowUiApp(
      title: 'My App',
      home: const HomePage(),
    );
  }
}
```

### 2. Commencez à utiliser les composants

Maintenant, vous pouvez utiliser n'importe quel composant Alphasow UI dans votre application :

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: const Text('Bienvenue dans Alphasow UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Primary Button
            AsButton(
              onPressed: () {
                context.showBanner(
                  message: 'Bonjour depuis Alphasow UI !',
                  type: AlertType.success,
                );
              },
              child: const Text('Afficher la Bannière de Succès'),
            ),
            
            const SizedBox(height: 16),
            
            // Text Field
            const AsTextField(
              labelText: 'Entrez votre nom',
              hintText: 'John Doe',
            ),
            
            const SizedBox(height: 16),
            
            // Loading Spinner
            const AsLoadingSpinner(),
          ],
        ),
      ),
    );
  }
}
```

### 3. Adaptation de Plateforme

Alphasow UI s'adapte automatiquement à votre plateforme :

- **iOS/macOS** : Utilise le style Cupertino
- **Android/Web** : Utilise le style Material Design

Aucune configuration supplémentaire nécessaire - cela fonctionne directement !

## Prochaines Étapes

- 📖 [Explorer les Composants](./components/overview) - Découvrez tous les composants disponibles
- 🌐 [Démo en Direct](https://ui.alphasow.dev) - Voyez les composants en action

## Besoin d'Aide ?

- 📚 Parcourez la [documentation des composants](./components/overview)
- 🐛 Signalez des problèmes sur [GitHub](https://github.com/alpha-sow/alphasow-ui/issues)
- 💡 Consultez notre [guide de contribution](https://github.com/alpha-sow/alphasow-ui/blob/main/CONTRIBUTING.md)
