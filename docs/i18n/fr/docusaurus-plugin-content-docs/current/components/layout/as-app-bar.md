---
sidebar_position: 2
---

# AsAppBar

A platform-adaptive application bar component that provides navigation, titles, and actions at the top of screens.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsAppBar(
  title: Text('My App'),
)
```

## With Actions

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

## With Leading Widget

```dart
AsAppBar(
  leading: AsIconButton(
    icon: Icons.menu,
    onPressed: () => Scaffold.of(context).openDrawer(),
  ),
  title: Text('Custom Leading'),
  centerTitle: true,
)
```

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `Widget?` | null | App bar title widget |
| `leading` | `Widget?` | null | Leading widget (usually back button or menu) |
| `actions` | `List<Widget>?` | null | Action widgets on the right side |
| `backgroundColor` | `Color?` | null | Background color |
| `foregroundColor` | `Color?` | null | Text and icon color |
| `elevation` | `double?` | null | Shadow elevation (Material only) |
| `centerTitle` | `bool?` | null | Whether to center the title |
| `automaticallyImplyLeading` | `bool` | `true` | Whether to show back button automatically |

## Examples

### Search App Bar
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
              hintText: 'Search...',
              autofocus: true,
            )
          : Text('Search Demo'),
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

## See Also

- [AsScaffold](./as-scaffold) - For screen structure
- [Layout Examples](https://ui.alphasow.dev/layout) - Live demo