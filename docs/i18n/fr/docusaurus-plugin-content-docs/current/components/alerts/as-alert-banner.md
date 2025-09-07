---
sidebar_position: 1
---

# AsAlertBanner

Un composant de bannière intégré pour afficher des alertes, notifications et messages d'état avec différents niveaux de gravité.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsAlertBanner(
  message: 'Ceci est un message informatif',
  type: AlertType.info,
)
```

## Types d'Alerte

### Bannière d'Information
```dart
AsAlertBanner(
  message: 'Information : Votre profil a été mis à jour',
  type: AlertType.info,
)
```

### Bannière de Succès
```dart
AsAlertBanner(
  message: 'Succès : Vos modifications ont été sauvegardées',
  type: AlertType.success,
)
```

### Bannière d'Avertissement
```dart
AsAlertBanner(
  message: 'Avertissement : Cette action ne peut pas être annulée',
  type: AlertType.warning,
)
```

### Bannière d'Erreur
```dart
AsAlertBanner(
  message: 'Erreur : Échec de la sauvegarde de vos modifications',
  type: AlertType.error,
)
```

## Avec Bouton d'Action

```dart
AsAlertBanner(
  message: 'Votre session va bientôt expirer',
  type: AlertType.warning,
  action: AsLinkButton(
    text: 'Prolonger la Session',
    onPressed: () {
      // Gérer l'extension de session
    },
  ),
)
```

## Bannière Rejetable

```dart
class DismissibleBanner extends StatefulWidget {
  @override
  _DismissibleBannerState createState() => _DismissibleBannerState();
}

class _DismissibleBannerState extends State<DismissibleBanner> {
  bool _showBanner = true;

  @override
  Widget build(BuildContext context) {
    if (!_showBanner) return SizedBox.shrink();
    
    return AsAlertBanner(
      message: 'Cette bannière peut être rejetée',
      type: AlertType.info,
      onDismiss: () {
        setState(() {
          _showBanner = false;
        });
      },
    );
  }
}
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `message` | `String` | requis | Le message à afficher |
| `type` | `AlertType` | requis | Le type/gravité de l'alerte |
| `action` | `Widget?` | null | Bouton ou widget d'action optionnel |
| `onDismiss` | `VoidCallback?` | null | Appelé quand le bouton de rejet est pressé |
| `icon` | `IconData?` | null | Icône personnalisée (remplace l'icône de type par défaut) |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan personnalisée |
| `textColor` | `Color?` | null | Couleur de texte personnalisée |
| `borderRadius` | `BorderRadius?` | null | Rayon de bordure personnalisé |

### AlertType

- `AlertType.info` - Palette de couleurs bleue avec icône d'information
- `AlertType.success` - Palette de couleurs verte avec icône de validation
- `AlertType.warning` - Palette de couleurs orange avec icône d'avertissement
- `AlertType.error` - Palette de couleurs rouge avec icône d'erreur

## Exemples

### Custom Styled Banner
```dart
AsAlertBanner(
  message: 'Custom styled banner',
  type: AlertType.info,
  backgroundColor: Colors.purple.shade100,
  textColor: Colors.purple.shade800,
  icon: Icons.star,
)
```

### Multiple Actions
```dart
AsAlertBanner(
  message: 'Multiple actions available',
  type: AlertType.warning,
  action: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      AsLinkButton(
        text: 'Cancel',
        onPressed: () {},
      ),
      SizedBox(width: 16),
      AsButton(
        style: AsButtonStyle.secondary,
        onPressed: () {},
        child: Text('Confirm'),
      ),
    ],
  ),
)
```

### Form Validation Banner
```dart
class FormWithBanner extends StatefulWidget {
  @override
  _FormWithBannerState createState() => _FormWithBannerState();
}

class _FormWithBannerState extends State<FormWithBanner> {
  String? _errorMessage;
  String? _successMessage;

  void _submitForm() {
    setState(() {
      _errorMessage = null;
      _successMessage = null;
    });

    // Simulate form submission
    if (/* validation fails */) {
      setState(() {
        _errorMessage = 'Please fix the errors below';
      });
    } else {
      setState(() {
        _successMessage = 'Form submitted successfully!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_errorMessage != null)
          AsAlertBanner(
            message: _errorMessage!,
            type: AlertType.error,
            onDismiss: () {
              setState(() => _errorMessage = null);
            },
          ),
        if (_successMessage != null)
          AsAlertBanner(
            message: _successMessage!,
            type: AlertType.success,
            onDismiss: () {
              setState(() => _successMessage = null);
            },
          ),
        // Form fields here
        AsButton(
          onPressed: _submitForm,
          child: Text('Submit'),
        ),
      ],
    );
  }
}
```

### Animated Banner
```dart
class AnimatedBanner extends StatefulWidget {
  @override
  _AnimatedBannerState createState() => _AnimatedBannerState();
}

class _AnimatedBannerState extends State<AnimatedBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: AsAlertBanner(
            message: 'Animated banner',
            type: AlertType.success,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

## Différences de Plateforme

### Material (Android/Web)
- Style d'alerte Material Design
- Palette de couleurs Material
- Icônes et typographie Material

### Cupertino (iOS/macOS)
- Apparence d'alerte de style iOS
- Palette de couleurs Cupertino
- Icônes système iOS

## Voir Aussi

- [AsAlertDialog](./as-alert-dialog) - Pour les alertes modales
- [AsBottomSheet](./as-bottom-sheet) - Pour les alertes en feuille inférieure
- [Système de Bannières](./banner-system) - Pour les bannières de superposition globale
- [Exemples d'Alertes](https://ui.alphasow.dev/alerts) - Démo en direct