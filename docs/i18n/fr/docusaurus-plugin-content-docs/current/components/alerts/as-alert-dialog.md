---
sidebar_position: 2
---

# AsAlertDialog

Un composant de dialogue modal pour afficher des messages importants, confirmations et interactions utilisateur.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsAlertDialog.show(
  context: context,
  title: 'Confirmation',
  message: 'Êtes-vous sûr de vouloir continuer ?',
  actions: [
    AsAlertDialogAction(
      text: 'Annuler',
      onPressed: () => Navigator.of(context).pop(),
    ),
    AsAlertDialogAction(
      text: 'Continuer',
      isDestructive: true,
      onPressed: () {
        Navigator.of(context).pop();
        // Gérer l'action continuer
      },
    ),
  ],
)
```

## Dialogue d'Information

```dart
AsAlertDialog.show(
  context: context,
  title: 'Information',
  message: 'Votre profil a été mis à jour avec succès.',
  actions: [
    AsAlertDialogAction(
      text: 'OK',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

## Dialogue de Confirmation

```dart
void _showDeleteConfirmation() {
  AsAlertDialog.show(
    context: context,
    title: 'Supprimer l'Élément',
    message: 'Cette action ne peut pas être annulée. Êtes-vous sûr de vouloir supprimer cet élément ?',
    type: AlertType.error,
    actions: [
      AsAlertDialogAction(
        text: 'Annuler',
        onPressed: () => Navigator.of(context).pop(false),
      ),
      AsAlertDialogAction(
        text: 'Supprimer',
        isDestructive: true,
        onPressed: () {
          Navigator.of(context).pop(true);
          _deleteItem();
        },
      ),
    ],
  ).then((confirmed) {
    if (confirmed == true) {
      // L'élément a été supprimé
    }
  });
}
```

## Dialogue Personnalisé

```dart
AsAlertDialog(
  title: Text('Dialogue Personnalisé'),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Ceci est un dialogue personnalisé avec plusieurs widgets'),
      SizedBox(height: 16),
      AsTextField(
        labelText: 'Saisissez une valeur',
        onChanged: (value) {},
      ),
    ],
  ),
  actions: [
    AsAlertDialogAction(
      text: 'Annuler',
      onPressed: () => Navigator.of(context).pop(),
    ),
    AsAlertDialogAction(
      text: 'Save',
      onPressed: () => Navigator.of(context).pop(),
    ),
  ],
)
```

## Référence API

### AsAlertDialog Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `Widget?` | null | Dialog title widget |
| `content` | `Widget?` | null | Dialog content widget |
| `actions` | `List<Widget>?` | null | List of action buttons |
| `type` | `AlertType?` | null | Alert type for styling |
| `barrierDismissible` | `bool` | `true` | Whether dialog can be dismissed by tapping outside |

### AsAlertDialog.show Parameters

| Parameter | Type | Default | Description |
|----------|------|---------|-------------|
| `context` | `BuildContext` | required | Build context |
| `title` | `String?` | null | Dialog title text |
| `message` | `String?` | null | Dialog message text |
| `type` | `AlertType?` | null | Alert type for styling |
| `actions` | `List<AsAlertDialogAction>?` | null | List of action buttons |
| `barrierDismissible` | `bool` | `true` | Whether dialog can be dismissed by tapping outside |

### AsAlertDialogAction Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | required | Button text |
| `onPressed` | `VoidCallback?` | required | Button press callback |
| `isDestructive` | `bool` | `false` | Whether action is destructive (uses warning colors) |
| `isDefault` | `bool` | `false` | Whether action is the default action |

## Examples

### Loading Dialog
```dart
class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AsAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AsLoadingSpinner(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// Usage
void _performAsyncOperation() async {
  LoadingDialog.show(context);
  try {
    await someAsyncOperation();
    LoadingDialog.hide(context);
    // Show success
  } catch (e) {
    LoadingDialog.hide(context);
    // Show error
  }
}
```

### Input Dialog
```dart
Future<String?> _showInputDialog() {
  final controller = TextEditingController();
  
  return showDialog<String>(
    context: context,
    builder: (context) => AsAlertDialog(
      title: Text('Enter Name'),
      content: AsTextField(
        controller: controller,
        labelText: 'Name',
        autofocus: true,
      ),
      actions: [
        AsAlertDialogAction(
          text: 'Annuler',
          onPressed: () => Navigator.of(context).pop(),
        ),
        AsAlertDialogAction(
          text: 'Save',
          isDefault: true,
          onPressed: () => Navigator.of(context).pop(controller.text),
        ),
      ],
    ),
  );
}
```

### Choice Dialog
```dart
Future<String?> _showChoiceDialog() {
  return AsAlertDialog.show(
    context: context,
    title: 'Choose Option',
    message: 'Please select one of the following options:',
    actions: [
      AsAlertDialogAction(
        text: 'Option A',
        onPressed: () => Navigator.of(context).pop('A'),
      ),
      AsAlertDialogAction(
        text: 'Option B',
        onPressed: () => Navigator.of(context).pop('B'),
      ),
      AsAlertDialogAction(
        text: 'Annuler',
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
}
```

### Error Dialog with Details
```dart
void _showErrorDialog(String error, String details) {
  AsAlertDialog.show(
    context: context,
    title: 'Error Occurred',
    message: error,
    type: AlertType.error,
    actions: [
      AsAlertDialogAction(
        text: 'Details',
        onPressed: () {
          Navigator.of(context).pop();
          _showDetailDialog(details);
        },
      ),
      AsAlertDialogAction(
        text: 'OK',
        isDefault: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
}
```

## Différences de Plateforme

### Material (Android/Web)
- Utilise `AlertDialog` avec le style Material
- Disposition de boutons Material Design
- Animations et transitions Material

### Cupertino (iOS/macOS)
- Utilise `CupertinoAlertDialog`
- Disposition et espacement de boutons de style iOS
- Animations iOS natives

## Bonnes Pratiques

1. **Utiliser avec parcimonie** - Les dialogues interrompent le flux utilisateur
2. **Actions claires** - Utilisez des étiquettes de bouton descriptives
3. **Actions destructives** - Marquez les actions dangereuses avec `isDestructive: true`
4. **Action par défaut** - Marquez l'action principale avec `isDefault: true`
5. **Barrière rejetable** - Permettez aux utilisateurs de fermer les dialogues non critiques

## Voir Aussi

- [AsAlertBanner](./as-alert-banner) - Pour les alertes intégrées
- [AsBottomSheet](./as-bottom-sheet) - Pour les modales en feuille inférieure
- [Exemples de Dialogues](https://ui.alphasow.dev/alerts) - Démo en direct