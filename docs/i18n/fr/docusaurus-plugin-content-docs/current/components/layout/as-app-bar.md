---
sidebar_position: 2
---

# AsAppBar

Un composant de barre d'application adaptatif à la plateforme qui fournit la navigation, les titres et les actions en haut des écrans.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsAppBar(
  title: Text('Mon Application'),
)
```

## Avec Actions

```dart
AsAppBar(
  title: Text('Messages'),
  actions: [
    AsIconButton(
      icon: Icons.search,
      onPressed: () => _openSearch(),
    ),
    AsIconButton(
      icon: Icons.more_vert,
      onPressed: () => _showMenu(),
    ),
  ],
)
```

## Avec Widget Principal

```dart
AsAppBar(
  leading: AsIconButton(
    icon: Icons.menu,
    onPressed: () => Scaffold.of(context).openDrawer(),
  ),
  title: Text('Principal Personnalisé'),
  centerTitle: true,
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `title` | `Widget?` | null | Widget du titre de la barre d'application |
| `leading` | `Widget?` | null | Widget principal (généralement bouton retour ou menu) |
| `actions` | `List<Widget>?` | null | Widgets d'action sur le côté droit |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan |
| `foregroundColor` | `Color?` | null | Couleur du texte et des icônes |
| `elevation` | `double?` | null | Élévation de l'ombre (Material uniquement) |
| `centerTitle` | `bool?` | null | Si le titre doit être centré |
| `automaticallyImplyLeading` | `bool` | `true` | Si le bouton retour doit être affiché automatiquement |

## Exemples

### Barre d'Application de Recherche
```dart
class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AsAppBar(
      title: _isSearching
          ? AsTextField(
              controller: _searchController,
              hintText: 'Rechercher...',
              autofocus: true,
            )
          : Text('Démo Recherche'),
      leading: _isSearching
          ? AsIconButton(
              icon: Icons.arrow_back,
              onPressed: () {
                setState(() => _isSearching = false);
                _searchController.clear();
              },
            )
          : null,
      actions: [
        if (!_isSearching)
          AsIconButton(
            icon: Icons.search,
            onPressed: () => setState(() => _isSearching = true),
          ),
        if (_isSearching)
          AsIconButton(
            icon: Icons.clear,
            onPressed: () => _searchController.clear(),
          ),
      ],
    );
  }
}
```

## Voir Aussi

- [AsScaffold](./as-scaffold) - Pour la structure d'écran
- [Exemples de Mise en Page](https://ui.alphasow.dev/layout) - Démo en direct