---
sidebar_position: 2
---

# AsIconButton

Un composant de bouton basé sur des icônes qui fournit différents styles incluant rempli, contour, fantôme, et plus avec un style adaptatif de plateforme.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsIconButton(
  icon: Icons.favorite,
  onPressed: () {
    print('Bouton icône pressé !');
  },
)
```

## Styles de Bouton

### Bouton Icône Standard (Par Défaut)
```dart
AsIconButton(
  icon: Icons.home,
  onPressed: () {},
)
```

### Bouton Icône Rempli
```dart
AsIconButton.filled(
  icon: Icons.favorite,
  onPressed: () {},
)
```

### Bouton Icône Contour
```dart
AsIconButton.outlined(
  icon: Icons.share,
  onPressed: () {},
)
```

### Bouton Icône Fantôme
```dart
AsIconButton.ghost(
  icon: Icons.settings,
  onPressed: () {},
)
```

## Couleurs Personnalisées

```dart
AsIconButton(
  icon: Icons.star,
  backgroundColor: Colors.amber,
  iconColor: Colors.white,
  onPressed: () {},
)
```

## Tailles

```dart
// Petit bouton icône
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.small,
  onPressed: () {},
)

// Bouton icône moyen (défaut)
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.medium,
  onPressed: () {},
)

// Grand bouton icône
AsIconButton(
  icon: Icons.add,
  size: AsIconButtonSize.large,
  onPressed: () {},
)
```

## État Désactivé

```dart
AsIconButton(
  icon: Icons.delete,
  onPressed: null, // null désactive le bouton
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `icon` | `IconData` | requis | L'icône à afficher |
| `onPressed` | `VoidCallback?` | requis | Appelé quand le bouton est pressé. null désactive le bouton |
| `size` | `AsIconButtonSize?` | `AsIconButtonSize.medium` | Taille du bouton |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan personnalisée |
| `iconColor` | `Color?` | null | Couleur d'icône personnalisée |
| `borderRadius` | `BorderRadius?` | null | Rayon de bordure personnalisé |
| `tooltip` | `String?` | null | Message d'info-bulle |
| `semanticsLabel` | `String?` | null | Étiquette d'accessibilité |

### AsIconButtonSize

- `AsIconButtonSize.small` - 32x32 points
- `AsIconButtonSize.medium` - 40x40 points (défaut)
- `AsIconButtonSize.large` - 48x48 points

## Exemples

### Avec Info-bulle
```dart
AsIconButton(
  icon: Icons.info,
  tooltip: 'Information',
  onPressed: () {},
)
```

### Rayon de Bordure Personnalisé
```dart
AsIconButton.filled(
  icon: Icons.play_arrow,
  borderRadius: BorderRadius.circular(8),
  onPressed: () {},
)
```

### État de Chargement
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AsIconButton(
      icon: _isLoading ? Icons.hourglass_empty : Icons.refresh,
      onPressed: _isLoading ? null : () async {
        setState(() => _isLoading = true);
        await Future.delayed(const Duration(seconds: 2));
        setState(() => _isLoading = false);
      },
    );
  }
}
```

## Différences de Plateforme

### Material (Android/Web)
- Utilise `IconButton` avec style Material
- Support des effets de vague Material
- Élévation Material pour les variantes remplies

### Cupertino (iOS/macOS)
- Utilise `CupertinoButton` avec icône
- Animation d'état pressé de style iOS
- Suit les directives iOS Human Interface Guidelines

## Voir Aussi

- [AsButton](./as-button) - Pour les boutons basés sur du texte
- [AsLinkButton](./as-link-button) - Pour les boutons de style lien
- [Exemples de Boutons Icône](https://ui.alphasow.dev/buttons) - Démo en direct