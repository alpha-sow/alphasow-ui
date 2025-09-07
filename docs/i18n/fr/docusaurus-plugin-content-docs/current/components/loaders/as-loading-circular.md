---
sidebar_position: 2
---

# AsLoadingCircular

Un composant d'indicateur de progrès circulaire pour afficher un progrès déterminé ou indéterminé.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base (Indéterminé)

```dart
AsLoadingCircular()
```

## Indicateur de Progrès (Déterminé)

```dart
AsLoadingCircular(
  value: 0.7, // 70% de progrès
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `value` | `double?` | null | Valeur de progrès (0.0 à 1.0). null pour indéterminé |
| `size` | `double?` | `24` | Taille de l'indicateur |
| `color` | `Color?` | null | Couleur de l'indicateur |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan |
| `strokeWidth` | `double?` | `4.0` | Largeur du trait de progrès |

## Exemples

### Barre de Progrès
```dart
class ProgressExample extends StatefulWidget {
  @override
  _ProgressExampleState createState() => _ProgressExampleState();
}

class _ProgressExampleState extends State<ProgressExample> {
  double _progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsLoadingCircular(
          value: _progress,
          size: 64,
        ),
        SizedBox(height: 16),
        Text('${(_progress * 100).round()}%'),
        SizedBox(height: 16),
        AsButton(
          onPressed: () {
            setState(() => _progress = (_progress + 0.1).clamp(0.0, 1.0));
          },
          child: Text('Incrémenter'),
        ),
      ],
    );
  }
}
```

## Voir Aussi

- [AsLoadingSpinner](./as-loading-spinner) - Pour les indicateurs simples
- [Exemples de Chargement](https://ui.alphasow.dev/loaders) - Démo en direct