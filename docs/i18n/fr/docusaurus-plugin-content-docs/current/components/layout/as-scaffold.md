---
sidebar_position: 1
---

# AsScaffold

Un composant de structure adaptatif à la plateforme qui fournit la structure de base pour les écrans avec barre d'application, corps et éléments optionnels.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Utilisation de Base

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('Mon Application'),
  ),
  body: Center(
    child: Text('Bonjour le Monde !'),
  ),
)
```

## Avec Bouton d'Action Flottant

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('Mon Application'),
  ),
  body: ListView(
    children: [
      // Éléments de liste
    ],
  ),
  floatingActionButton: AsIconButton(
    icon: Icons.add,
    onPressed: () {
      // Ajouter un nouvel élément
    },
  ),
)
```

## Avec Navigation du Bas

```dart
class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

## Avec Tiroir

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('Mon Application'),
  ),
  drawer: AsMenuDrawer(
    header: DrawerHeader(
      child: Text('Menu'),
    ),
    items: [
      DrawerItem(
        icon: Icons.home,
        title: 'Home',
        onTap: () => Navigator.pop(context),
      ),
      DrawerItem(
        icon: Icons.settings,
        title: 'Settings',
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ],
  ),
  body: Container(
    child: Text('Main content'),
  ),
)
```

## Référence API

### Propriétés

| Propriété | Type | Défaut | Description |
|----------|------|---------|-------------|
| `appBar` | `PreferredSizeWidget?` | null | Widget de la barre d'application |
| `body` | `Widget?` | null | Widget du contenu principal |
| `floatingActionButton` | `Widget?` | null | Bouton d'action flottant |
| `floatingActionButtonLocation` | `FloatingActionButtonLocation?` | null | Emplacement du bouton d'action flottant |
| `drawer` | `Widget?` | null | Widget du tiroir gauche |
| `endDrawer` | `Widget?` | null | Widget du tiroir droit |
| `bottomNavigationBar` | `Widget?` | null | Barre de navigation du bas |
| `bottomSheet` | `Widget?` | null | Feuille inférieure persistante |
| `backgroundColor` | `Color?` | null | Couleur d'arrière-plan |
| `resizeToAvoidBottomInset` | `bool?` | null | Si le redimensionnement doit avoir lieu quand le clavier apparaît |
| `primary` | `bool` | `true` | Si la structure est la structure principale |
| `extendBody` | `bool` | `false` | Si le corps s'étend derrière la navigation du bas |
| `extendBodyBehindAppBar` | `bool` | `false` | Si le corps s'étend derrière la barre d'application |

## Exemples

### Écran Simple
```dart
class SimpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: Text('Simple Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16),
            AsButton(
              onPressed: () {},
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Form Screen
```dart
class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: Text('New Contact'),
        actions: [
          AsIconButton(
            icon: Icons.check,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _saveContact();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AsTextField(
                labelText: 'Name',
                validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
              ),
              SizedBox(height: 16),
              AsTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value?.contains('@') ?? false ? null : 'Invalid email',
              ),
              SizedBox(height: 16),
              AsTextField(
                labelText: 'Phone',
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() {
    // Save contact logic
    Navigator.pop(context);
  }
}
```

### Settings Screen with Sections
```dart
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSection('Account', [
            AsListTile(
              leading: Icon(Icons.person),
              title: 'Profile',
              subtitle: 'Manage your profile',
              onTap: () => _openProfile(),
            ),
            AsListTile(
              leading: Icon(Icons.security),
              title: 'Privacy',
              subtitle: 'Privacy settings',
              onTap: () => _openPrivacy(),
            ),
          ]),
          _buildSection('Preferences', [
            AsListTile(
              leading: Icon(Icons.notifications),
              title: 'Notifications',
              subtitle: 'Manage notifications',
              trailing: Switch(value: true, onChanged: (v) {}),
            ),
            AsListTile(
              leading: Icon(Icons.palette),
              title: 'Theme',
              subtitle: 'App appearance',
              onTap: () => _openTheme(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        ...items,
        SizedBox(height: 8),
      ],
    );
  }
}
```

### Master-Detail Layout
```dart
class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return AsScaffold(
      appBar: AsAppBar(
        title: Text('Items'),
      ),
      body: Row(
        children: [
          // Master list
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final item = 'Item $index';
                return AsListTile(
                  title: item,
                  selected: selectedItem == item,
                  onTap: () {
                    setState(() => selectedItem = item);
                  },
                );
              },
            ),
          ),
          VerticalDivider(width: 1),
          // Detail view
          Expanded(
            flex: 2,
            child: selectedItem != null
                ? _buildDetailView(selectedItem!)
                : Center(child: Text('Select an item')),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailView(String item) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text('Details for $item'),
          SizedBox(height: 16),
          AsButton(
            onPressed: () => _editItem(item),
            child: Text('Edit'),
          ),
        ],
      ),
    );
  }
}
```

## Différences de Plateforme

### Material (Android/Web)
- Utilise `Scaffold` avec le style Material
- Barre d'application et navigation Material
- Bouton d'action flottant Material

### Cupertino (iOS/macOS)
- Utilise `CupertinoPageScaffold`
- Barre de navigation de style iOS
- Comportement de défilement iOS natif

## Bonnes Pratiques

1. **Structure cohérente** - Utilisez AsScaffold pour tous les écrans principaux
2. **Utilisation de la barre d'application** - Incluez la barre d'application pour le contexte de navigation
3. **Zone sécurisée** - AsScaffold gère automatiquement la zone sécurisée
4. **Gestion du clavier** - Utilisez `resizeToAvoidBottomInset` pour les formulaires
5. **Bouton d'action flottant** - À utiliser uniquement pour les actions principales

## Voir Aussi

- [AsAppBar](./as-app-bar) - Pour le composant de barre d'application
- [Exemples de Mise en Page](https://ui.alphasow.dev/layout) - Démo en direct