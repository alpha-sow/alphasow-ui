---
sidebar_position: 1
---

# AsLoadingSpinner

Un composant d'indicateur de chargement personnalisable pour indiquer les états de chargement.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsLoadingSpinner()
```

## Taille et Couleur Personnalisées

```dart
AsLoadingSpinner(
  size: 32,
  color: Colors.blue,
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `size` | `double?` | `24` | Taille de l'indicateur |
| `color` | `Color?` | null | Couleur de l'indicateur |
| `strokeWidth` | `double?` | `2.0` | Largeur du trait de l'indicateur |

## Exemples

### Dans un Bouton
```dart
AsButton(
  loading: isLoading,
  onPressed: isLoading ? null : () async {
    setState(() => isLoading = true);
    await performAsyncOperation();
    setState(() => isLoading = false);
  },
  child: Text('Soumettre'),
)
```

### Chargement Centré
```dart
Center(
  child: AsLoadingSpinner(
    size: 48,
    color: Theme.of(context).primaryColor,
  ),
)
```

## Voir Aussi

- [AsLoadingCircular](./as-loading-circular) - Pour l'indicateur de progrès circulaire
- [Exemples de Chargement](https://ui.alphasow.dev/loaders) - Démo en direct