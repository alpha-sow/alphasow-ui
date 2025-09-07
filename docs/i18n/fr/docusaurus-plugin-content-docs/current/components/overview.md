---
sidebar_position: 1
---

# Aperçu des Composants

Alphasow UI fournit une collection complète de composants d'interface utilisateur Flutter conçus pour un thème cohérent et une adaptation de plateforme. Tous les composants basculent automatiquement entre le style Material Design et Cupertino selon la plateforme actuelle.

## Catégories de Composants

### 🔘 Boutons
Éléments interactifs pour les actions utilisateur.

- **[AsButton](./buttons/as-button)** - Boutons primaires et secondaires avec variantes
- **[AsIconButton](./buttons/as-icon-button)** - Boutons basés sur des icônes avec effets de survol
- **[AsLinkButton](./buttons/as-link-button)** - Boutons de lien basés sur du texte

### 📝 Contrôles de Formulaire
Composants de saisie pour la collecte de données.

- **[AsTextField](./forms/as-text-field)** - Champ de saisie de texte avec support de validation
- **[AsCheckbox](./forms/as-checkbox)** - Case à cocher avec style personnalisé

### 🚨 Alertes et Notifications
Composants pour afficher des messages et attirer l'attention de l'utilisateur.

- **[AsAlertDialog](./alerts/as-alert-dialog)** - Boîtes de dialogue modales
- **[AsAlertBanner](./alerts/as-alert-banner)** - Alertes bannières en ligne
- **[AsBottomSheet](./alerts/as-bottom-sheet)** - Modales de feuille inférieure
- **[Système de Bannières](./alerts/banner-system)** - Overlay de notifications globales

### 🧭 Navigation et Mise en Page
Composants pour la structure d'application et la navigation.

- **[AsScaffold](./layout/as-scaffold)** - Scaffold adaptatif de plateforme
- **[AsAppBar](./layout/as-app-bar)** - Composant de barre d'application
- **AsNavigationRail** - Navigation latérale
- **AsListTile** - Composant d'élément de liste

### 🎨 Éléments Visuels
Composants pour la présentation visuelle et le retour d'information.

- **AsAvatar** - Composant d'avatar utilisateur
- **AsCard** - Composant de conteneur de carte
- **AsLabel** - Étiquettes de texte avec style
- **AsDivider** - Séparateurs visuels

### ⏳ Indicateurs de Chargement
Composants pour afficher les états de chargement.

- **[AsLoadingCircular](./loaders/as-loading-circular)** - Indicateur de progression circulaire
- **[AsLoadingSpinner](./loaders/as-loading-spinner)** - Animation de spinner personnalisée

### 📋 Menus
Composants de menus déroulants et contextuels.

- **AsMenuDropdown** - Composant de menu déroulant
- **AsMenuDown** - Menus déroulants contextuels
- **AsMenuDrawer** - Composant de tiroir de navigation

## Adaptation de Plateforme

Tous les composants adaptent automatiquement leur apparence selon la plateforme actuelle :

### iOS/macOS (Cupertino)
- Langage de conception natif iOS
- Couleurs et typographie Cupertino
- Animations et transitions de style iOS

### Android/Web (Material)
- Principes Material Design 3
- Système de couleurs Material
- Mouvement et élévation Material

## Propriétés Communes

La plupart des composants Alphasow UI partagent ces propriétés communes :

### Style
- **`style`** - Options de style personnalisées
- **`color`** - Remplacement de couleur primaire
- **`backgroundColor`** - Remplacement de couleur d'arrière-plan

### Comportement
- **`onPressed`** - Callback de tap/clic (composants interactifs)
- **`disabled`** - Désactiver l'interaction
- **`loading`** - Afficher l'état de chargement (le cas échéant)

### Accessibilité
- **`semanticsLabel`** - Description pour lecteur d'écran
- **`excludeSemantics`** - Exclure de l'arbre d'accessibilité

## Modèles d'Utilisation

### Utilisation de Base des Composants
```dart
AsButton(
  onPressed: () {
    // Gérer le clic du bouton
  },
  child: const Text('Appuyez-moi'),
)
```

### Avec Style Personnalisé
```dart
AsButton(
  style: AsButtonStyle.secondary,
  backgroundColor: Colors.green,
  onPressed: () {
    // Gérer le clic du bouton
  },
  child: const Text('Bouton Personnalisé'),
)
```

### Avec État de Chargement
```dart
AsButton(
  loading: isLoading,
  onPressed: isLoading ? null : () {
    // Gérer le clic du bouton
  },
  child: const Text('Soumettre'),
)
```

## Commencer

1. **Importez le package :**
   ```dart
   import 'package:alphasow_ui/alphasow_ui.dart';
   ```

2. **Enveloppez votre application avec AlphasowUiApp :**
   ```dart
   AlphasowUiApp(
     home: MyHomePage(),
   )
   ```

3. **Commencez à utiliser les composants :**
   ```dart
   AsButton(
     onPressed: () => context.showBanner(
       message: 'Bonjour !',
       type: AlertType.success,
     ),
     child: const Text('Afficher la Bannière'),
   )
   ```

## Prochaines Étapes

- Explorez la [documentation spécifique des composants](./buttons/as-button)
- Consultez la [démo en direct](https://ui.alphasow.dev) pour voir les composants en action