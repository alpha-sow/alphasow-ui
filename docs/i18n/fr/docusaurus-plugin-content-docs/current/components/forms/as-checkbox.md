---
sidebar_position: 2
---

# AsCheckbox

Un composant de case à cocher avec un style personnalisable et une apparence adaptative à la plateforme pour les saisies booléennes.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
bool isChecked = false;

AsCheckbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)
```

## Avec Étiquette

```dart
bool acceptTerms = false;

AsCheckbox(
  value: acceptTerms,
  label: 'J'accepte les termes et conditions',
  onChanged: (value) {
    setState(() {
      acceptTerms = value ?? false;
    });
  },
)
```

## Case à Cocher Trois États

```dart
bool? triState = null; // null = indéterminé, true = coché, false = décoché

AsCheckbox(
  value: triState,
  tristate: true,
  onChanged: (value) {
    setState(() {
      triState = value;
    });
  },
)
```

## Case à Cocher Désactivée

```dart
AsCheckbox(
  value: true,
  onChanged: null, // null désactive la case à cocher
  label: 'Case à cocher désactivée',
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `value` | `bool?` | requis | État actuel de la case à cocher |
| `onChanged` | `ValueChanged<bool?>?` | requis | Appelé quand l'état de la case à cocher change. null désactive la case |
| `label` | `String?` | null | Étiquette de texte affichée à côté de la case à cocher |
| `tristate` | `bool` | `false` | Si la case à cocher supporte l'état indéterminé |
| `activeColor` | `Color?` | null | Couleur quand la case à cocher est cochée |
| `checkColor` | `Color?` | null | Couleur de la coche |
| `focusColor` | `Color?` | null | Couleur quand la case à cocher a le focus |
| `hoverColor` | `Color?` | null | Couleur quand la case à cocher est survolée |
| `semanticsLabel` | `String?` | null | Étiquette d'accessibilité |

## Exemples

### Liste de Cases à Cocher de Formulaire
```dart
class CheckboxForm extends StatefulWidget {
  @override
  _CheckboxFormState createState() => _CheckboxFormState();
}

class _CheckboxFormState extends State<CheckboxForm> {
  Map<String, bool> preferences = {
    'notifications': false,
    'newsletter': false,
    'marketing': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsCheckbox(
          value: preferences['notifications'],
          label: 'Activer les notifications',
          onChanged: (value) {
            setState(() {
              preferences['notifications'] = value ?? false;
            });
          },
        ),
        AsCheckbox(
          value: preferences['newsletter'],
          label: 'S'abonner à la newsletter',
          onChanged: (value) {
            setState(() {
              preferences['newsletter'] = value ?? false;
            });
          },
        ),
        AsCheckbox(
          value: preferences['marketing'],
          label: 'Recevoir les emails marketing',
          onChanged: (value) {
            setState(() {
              preferences['marketing'] = value ?? false;
            });
          },
        ),
      ],
    );
  }
}
```

### Case à Cocher Tout Sélectionner
```dart
class SelectAllCheckbox extends StatefulWidget {
  @override
  _SelectAllCheckboxState createState() => _SelectAllCheckboxState();
}

class _SelectAllCheckboxState extends State<SelectAllCheckbox> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];
  Set<String> selectedItems = {};

  bool? get selectAllValue {
    if (selectedItems.isEmpty) return false;
    if (selectedItems.length == items.length) return true;
    return null; // Indéterminé
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsCheckbox(
          value: selectAllValue,
          tristate: true,
          label: 'Tout Sélectionner',
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedItems = Set.from(items);
              } else {
                selectedItems.clear();
              }
            });
          },
        ),
        Divider(),
        ...items.map((item) => AsCheckbox(
          value: selectedItems.contains(item),
          label: item,
          onChanged: (value) {
            setState(() {
              if (value == true) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
            });
          },
        )),
      ],
    );
  }
}
```

### Couleurs Personnalisées
```dart
AsCheckbox(
  value: isChecked,
  activeColor: Colors.green,
  checkColor: Colors.white,
  label: 'Case à cocher avec style personnalisé',
  onChanged: (value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)
```

### Case à Cocher d'Accord
```dart
bool agreedToTerms = false;

Column(
  children: [
    AsCheckbox(
      value: agreedToTerms,
      onChanged: (value) {
        setState(() {
          agreedToTerms = value ?? false;
        });
      },
      label: 'J'ai lu et j'accepte les Conditions de Service',
    ),
    AsButton(
      onPressed: agreedToTerms ? () {
        // Procéder à l'inscription
      } : null,
      child: Text('S'inscrire'),
    ),
  ],
)
```

## Différences de Plateforme

### Material (Android/Web)
- Utilise `Checkbox` avec le style Material
- Effets de vague Material
- Palette de couleurs Material Design

### Cupertino (iOS/macOS)
- Utilise `CupertinoSwitch` stylé comme case à cocher
- Animations de style iOS
- Suit les directives iOS Human Interface Guidelines

## Accessibilité

AsCheckbox inclut automatiquement :
- Rôles sémantiques appropriés pour les lecteurs d'écran
- Support de navigation clavier
- Indicateurs de focus
- Annonces d'état

## Voir Aussi

- [AsTextField](./as-text-field) - Pour la saisie de texte
- [Exemples de Formulaires](https://ui.alphasow.dev/forms) - Démo en direct