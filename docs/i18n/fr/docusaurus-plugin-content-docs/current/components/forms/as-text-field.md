---
sidebar_position: 1
---

# AsTextField

Un composant de saisie de texte polyvalent avec un style adaptatif à la plateforme, support de validation et apparence personnalisable.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsTextField(
  labelText: 'Entrez votre nom',
  onChanged: (value) {
    print('Texte modifié : $value');
  },
)
```

## Avec Texte d'Aide et Assistant

```dart
AsTextField(
  labelText: 'Email',
  hintText: 'exemple@domaine.com',
  helperText: 'Nous ne partagerons jamais votre email',
  onChanged: (value) {},
)
```

## Champ Mot de Passe

```dart
AsTextField(
  labelText: 'Mot de passe',
  obscureText: true,
  suffixIcon: Icons.visibility,
  onChanged: (value) {},
)
```

## Avec Validation

```dart
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AsTextField(
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir un email';
              }
              if (!value.contains('@')) {
                return 'Veuillez saisir un email valide';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          AsButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Le formulaire est valide
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
```

## Champ de Texte Multiligne

```dart
AsTextField(
  labelText: 'Description',
  maxLines: 4,
  minLines: 2,
  onChanged: (value) {},
)
```

## Avec Préfixe et Suffixe

```dart
AsTextField(
  labelText: 'Téléphone',
  prefixIcon: Icons.phone,
  suffixText: 'Requis',
  keyboardType: TextInputType.phone,
  onChanged: (value) {},
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `controller` | `TextEditingController?` | null | Contrôle le texte en cours d'édition |
| `labelText` | `String?` | null | Texte d'étiquette affiché au-dessus du champ |
| `hintText` | `String?` | null | Texte d'indice affiché quand le champ est vide |
| `helperText` | `String?` | null | Texte d'aide affiché sous le champ |
| `errorText` | `String?` | null | Texte d'erreur affiché quand la validation échoue |
| `obscureText` | `bool` | `false` | Si le texte en cours d'édition doit être masqué |
| `enabled` | `bool` | `true` | Si le champ de texte est activé |
| `readOnly` | `bool` | `false` | Si le champ de texte est en lecture seule |
| `maxLines` | `int?` | `1` | Nombre maximum de lignes |
| `minLines` | `int?` | null | Nombre minimum de lignes |
| `maxLength` | `int?` | null | Nombre maximum de caractères |
| `keyboardType` | `TextInputType?` | null | Type de clavier à afficher |
| `textInputAction` | `TextInputAction?` | null | Bouton d'action sur le clavier |
| `validator` | `String? Function(String?)?` | null | Fonction de validation de formulaire |
| `onChanged` | `ValueChanged<String>?` | null | Appelé quand le texte change |
| `onSubmitted` | `ValueChanged<String>?` | null | Appelé quand l'utilisateur soumet |
| `prefixIcon` | `IconData?` | null | Icône affichée au début |
| `suffixIcon` | `IconData?` | null | Icône affichée à la fin |
| `prefixText` | `String?` | null | Texte affiché au début |
| `suffixText` | `String?` | null | Texte affiché à la fin |

## Exemples

### Champ de Recherche
```dart
AsTextField(
  labelText: 'Recherche',
  prefixIcon: Icons.search,
  hintText: 'Rechercher des éléments...',
  onChanged: (value) {
    // Effectuer la recherche
  },
)
```

### Saisie Numérique
```dart
AsTextField(
  labelText: 'Âge',
  keyboardType: TextInputType.number,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez saisir votre âge';
    }
    final age = int.tryParse(value);
    if (age == null || age < 0 || age > 150) {
      return 'Veuillez saisir un âge valide';
    }
    return null;
  },
  onChanged: (value) {},
)
```

### Saisie de Devise
```dart
AsTextField(
  labelText: 'Prix',
  prefixText: '€',
  keyboardType: TextInputType.numberWithOptions(decimal: true),
  onChanged: (value) {},
)
```

### Saisie Contrôlée
```dart
class ControlledTextField extends StatefulWidget {
  @override
  _ControlledTextFieldState createState() => _ControlledTextFieldState();
}

class _ControlledTextFieldState extends State<ControlledTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AsTextField(
          controller: _controller,
          labelText: 'Saisie Contrôlée',
          onChanged: (value) {},
        ),
        AsButton(
          onPressed: () {
            _controller.clear();
          },
          child: Text('Effacer'),
        ),
      ],
    );
  }
}
```

## Différences de Plateforme

### Material (Android/Web)
- Utilise `TextFormField` avec le style Material
- Décoration d'entrée Material Design
- États de focus et d'erreur Material

### Cupertino (iOS/macOS)
- Utilise `CupertinoTextFormFieldRow`
- Style de saisie iOS
- Comportement clavier iOS natif

## Voir Aussi

- [AsCheckbox](./as-checkbox) - Pour les saisies booléennes
- [Exemples de Formulaires](https://ui.alphasow.dev/forms) - Démo en direct