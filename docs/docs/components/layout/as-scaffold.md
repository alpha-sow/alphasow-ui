---
sidebar_position: 1
---

# AsScaffold

A platform-adaptive scaffold component that provides the basic structure for screens with app bar, body, and optional elements.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('My App'),
  ),
  body: Center(
    child: Text('Hello, World!'),
  ),
)
```

## With Floating Action Button

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('My App'),
  ),
  body: ListView(
    children: [
      // List items
    ],
  ),
  floatingActionButton: AsIconButton(
    icon: Icons.add,
    onPressed: () {
      // Add new item
    },
  ),
)
```

## With Bottom Navigation

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

## With Drawer

```dart
AsScaffold(
  appBar: AsAppBar(
    title: Text('My App'),
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

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `appBar` | `PreferredSizeWidget?` | null | App bar widget |
| `body` | `Widget?` | null | Main content widget |
| `floatingActionButton` | `Widget?` | null | Floating action button |
| `floatingActionButtonLocation` | `FloatingActionButtonLocation?` | null | FAB location |
| `drawer` | `Widget?` | null | Left drawer widget |
| `endDrawer` | `Widget?` | null | Right drawer widget |
| `bottomNavigationBar` | `Widget?` | null | Bottom navigation bar |
| `bottomSheet` | `Widget?` | null | Persistent bottom sheet |
| `backgroundColor` | `Color?` | null | Background color |
| `resizeToAvoidBottomInset` | `bool?` | null | Whether to resize when keyboard appears |
| `primary` | `bool` | `true` | Whether scaffold is primary scaffold |
| `extendBody` | `bool` | `false` | Whether body extends behind bottom navigation |
| `extendBodyBehindAppBar` | `bool` | `false` | Whether body extends behind app bar |

## Examples

### Simple Screen
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

## Platform Differences

### Material (Android/Web)
- Uses `Scaffold` with Material styling
- Material app bar and navigation
- Material floating action button

### Cupertino (iOS/macOS)
- Uses `CupertinoPageScaffold`
- iOS-style navigation bar
- Native iOS scrolling behavior

## Best Practices

1. **Consistent structure** - Use AsScaffold for all main screens
2. **App bar usage** - Include app bar for navigation context
3. **Safe area** - AsScaffold handles safe area automatically
4. **Keyboard handling** - Use `resizeToAvoidBottomInset` for forms
5. **Floating action button** - Use for primary actions only

## See Also

- [AsAppBar](./as-app-bar) - For app bar component
- [AsListTile](./as-list-tile) - For list items
- [AsNavigationRail](./as-navigation-rail) - For side navigation
- [Layout Examples](https://ui.alphasow.dev/layout) - Live demo