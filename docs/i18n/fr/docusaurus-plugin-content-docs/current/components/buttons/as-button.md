---
sidebar_position: 1
---

# AsButton

Un composant de bouton polyvalent qui s'adapte à la plateforme actuelle avec support de différents styles, d'états de chargement et de fonctionnalités d'accessibilité.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsButton(
  onPressed: () {
    print('Bouton pressé !');
  },
  child: const Text('Appuyez-moi'),
)
```

## Styles de Bouton

### Bouton Primaire (Par Défaut)
```dart
AsButton(
  style: AsButtonStyle.primary, // Optionnel, c'est le défaut
  onPressed: () {},
  child: const Text('Bouton Primaire'),
)
```

### Bouton Secondaire
```dart
AsButton(
  style: AsButtonStyle.secondary,
  onPressed: () {},
  child: const Text('Bouton Secondaire'),
)
```

### Bouton Contour
```dart
AsButton(
  style: AsButtonStyle.outline,
  onPressed: () {},
  child: const Text('Bouton Contour'),
)
```

## État de Chargement

```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AsButton(
      loading: _isLoading,
      onPressed: _isLoading ? null : () async {
        setState(() => _isLoading = true);
        
        // Simuler une opération asynchrone
        await Future.delayed(const Duration(seconds: 2));
        
        setState(() => _isLoading = false);
      },
      child: const Text('Soumettre'),
    );
  }
}
```

## Couleurs Personnalisées

```dart
AsButton(
  backgroundColor: Colors.green,
  foregroundColor: Colors.white,
  onPressed: () {},
  child: const Text('Couleurs Personnalisées'),
)
```

## État Désactivé

```dart
AsButton(
  onPressed: null, // null désactive le bouton
  child: const Text('Bouton Désactivé'),
)
```

## Bouton Pleine Largeur

```dart
SizedBox(
  width: double.infinity,
  child: AsButton(
    onPressed: () {},
    child: const Text('Bouton Pleine Largeur'),
  ),
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | requis | Le widget enfant du bouton (généralement Text) |
| `onPressed` | `VoidCallback?` | requis | Appelé quand le bouton est pressé. null désactive le bouton |
| `style` | `AsButtonStyle?` | `AsButtonStyle.primary` | Style visuel du bouton |
| `loading` | `bool` | `false` | Affiche un spinner de chargement quand true |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan personnalisée |
| `foregroundColor` | `Color?` | null | Couleur du texte/icône personnalisée |
| `borderRadius` | `BorderRadius?` | null | Rayon de bordure personnalisé |
| `padding` | `EdgeInsetsGeometry?` | null | Espacement personnalisé |
| `elevation` | `double?` | null | Élévation d'ombre (Material seulement) |
| `semanticsLabel` | `String?` | null | Étiquette d'accessibilité |

### AsButtonStyle

- `AsButtonStyle.primary` - Bouton rempli avec couleur primaire
- `AsButtonStyle.secondary` - Bouton rempli avec couleur secondaire
- `AsButtonStyle.outline` - Bouton avec contour et arrière-plan transparent
- `AsButtonStyle.text` - Bouton texte seulement sans arrière-plan

## Différences de Plateforme

### Material (Android/Web)
- Utilise `ElevatedButton`, `OutlinedButton`, ou `TextButton`
- Support de l'élévation Material et des effets de vague
- Suit les directives Material Design 3

### Cupertino (iOS/macOS)
- Utilise `CupertinoButton`
- Animation d'état pressé de style iOS
- Suit les directives iOS Human Interface Guidelines

## Accessibilité

AsButton inclut automatiquement :
- Rôles sémantiques appropriés
- Application de taille de cible tactile (minimum 44x44 points)
- Support de focus et navigation clavier
- Compatibilité lecteur d'écran

## Exemples

### Avec Icône
```dart
AsButton(
  onPressed: () {},
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.download),
      const SizedBox(width: 8),
      const Text('Télécharger'),
    ],
  ),
)
```

### Bouton Arrondi
```dart
AsButton(
  borderRadius: BorderRadius.circular(30),
  onPressed: () {},
  child: const Text('Arrondi'),
)
```

### Grand Bouton
```dart
AsButton(
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  onPressed: () {},
  child: const Text('Grand Bouton'),
)
```

## Voir Aussi

- [AsIconButton](./as-icon-button) - Pour les boutons icône uniquement
- [AsLinkButton](./as-link-button) - Pour les boutons de lien basés sur du texte
- [Exemples de Boutons](https://ui.alphasow.dev/buttons) - Démo en direct