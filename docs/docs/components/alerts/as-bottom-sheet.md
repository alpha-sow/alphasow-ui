---
sidebar_position: 3
---

# AsBottomSheet

A modal bottom sheet component that slides up from the bottom of the screen for contextual actions and content.

## Import

```dart
import 'package:alphasow_ui/alphasow_ui.dart';
```

## Basic Usage

```dart
AsBottomSheet.show(
  context: context,
  builder: (context) => Container(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Bottom Sheet Content'),
        SizedBox(height: 16),
        AsButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    ),
  ),
)
```

## Action Bottom Sheet

```dart
void _showActionSheet() {
  AsBottomSheet.show(
    context: context,
    builder: (context) => AsBottomSheet(
      title: 'Choose Action',
      actions: [
        AsBottomSheetAction(
          icon: Icons.share,
          title: 'Share',
          onPressed: () {
            Navigator.pop(context);
            _shareContent();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.edit,
          title: 'Edit',
          onPressed: () {
            Navigator.pop(context);
            _editContent();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.delete,
          title: 'Delete',
          isDestructive: true,
          onPressed: () {
            Navigator.pop(context);
            _deleteContent();
          },
        ),
      ],
    ),
  );
}
```

## Scrollable Bottom Sheet

```dart
AsBottomSheet.show(
  context: context,
  isScrollControlled: true,
  builder: (context) => DraggableScrollableSheet(
    expand: false,
    builder: (context, scrollController) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: ListView(
        controller: scrollController,
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.grey,
            ),
          ),
          // Content
          ...List.generate(20, (index) => ListTile(
            title: Text('Item $index'),
          )),
        ],
      ),
    ),
  ),
)
```

## Modal with Form

```dart
void _showFormBottomSheet() {
  AsBottomSheet.show(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Item',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16),
            AsTextField(
              labelText: 'Name',
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            AsTextField(
              labelText: 'Description',
              maxLines: 3,
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AsButton(
                    style: AsButtonStyle.secondary,
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AsButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _addItem();
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
```

## API Reference

### AsBottomSheet Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `title` | `String?` | null | Bottom sheet title |
| `actions` | `List<AsBottomSheetAction>?` | null | List of action items |
| `child` | `Widget?` | null | Custom child widget |
| `backgroundColor` | `Color?` | null | Background color |
| `borderRadius` | `BorderRadius?` | null | Border radius |

### AsBottomSheet.show Parameters

| Parameter | Type | Default | Description |
|----------|------|---------|-------------|
| `context` | `BuildContext` | required | Build context |
| `builder` | `WidgetBuilder` | required | Builder function |
| `isScrollControlled` | `bool` | `false` | Whether sheet can be scrolled |
| `isDismissible` | `bool` | `true` | Whether sheet can be dismissed |
| `enableDrag` | `bool` | `true` | Whether sheet can be dragged |
| `backgroundColor` | `Color?` | null | Background color |
| `elevation` | `double?` | null | Shadow elevation |
| `shape` | `ShapeBorder?` | null | Custom shape |

### AsBottomSheetAction Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `icon` | `IconData` | required | Action icon |
| `title` | `String` | required | Action title |
| `onPressed` | `VoidCallback` | required | Action callback |
| `isDestructive` | `bool` | `false` | Whether action is destructive |

## Examples

### Settings Bottom Sheet
```dart
void _showSettingsSheet() {
  AsBottomSheet.show(
    context: context,
    builder: (context) => AsBottomSheet(
      title: 'Settings',
      actions: [
        AsBottomSheetAction(
          icon: Icons.account_circle,
          title: 'Account',
          onPressed: () {
            Navigator.pop(context);
            _openAccount();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.notifications,
          title: 'Notifications',
          onPressed: () {
            Navigator.pop(context);
            _openNotifications();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.privacy_tip,
          title: 'Privacy',
          onPressed: () {
            Navigator.pop(context);
            _openPrivacy();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.help,
          title: 'Help',
          onPressed: () {
            Navigator.pop(context);
            _openHelp();
          },
        ),
      ],
    ),
  );
}
```

### Photo Options Sheet
```dart
void _showPhotoOptions() {
  AsBottomSheet.show(
    context: context,
    builder: (context) => AsBottomSheet(
      title: 'Select Photo',
      actions: [
        AsBottomSheetAction(
          icon: Icons.camera_alt,
          title: 'Take Photo',
          onPressed: () {
            Navigator.pop(context);
            _takePhoto();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.photo_library,
          title: 'Choose from Library',
          onPressed: () {
            Navigator.pop(context);
            _chooseFromLibrary();
          },
        ),
        AsBottomSheetAction(
          icon: Icons.delete,
          title: 'Remove Photo',
          isDestructive: true,
          onPressed: () {
            Navigator.pop(context);
            _removePhoto();
          },
        ),
      ],
    ),
  );
}
```

### Filter Bottom Sheet
```dart
class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String _selectedCategory = 'All';
  double _priceRange = 100;
  bool _inStock = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 16),
          
          // Category filter
          Text('Category'),
          DropdownButton<String>(
            value: _selectedCategory,
            items: ['All', 'Electronics', 'Clothing', 'Books']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {
              setState(() => _selectedCategory = value!);
            },
          ),
          
          SizedBox(height: 16),
          
          // Price range
          Text('Max Price: \$${_priceRange.round()}'),
          Slider(
            value: _priceRange,
            max: 500,
            divisions: 10,
            onChanged: (value) {
              setState(() => _priceRange = value);
            },
          ),
          
          // In stock filter
          AsCheckbox(
            value: _inStock,
            label: 'In Stock Only',
            onChanged: (value) {
              setState(() => _inStock = value ?? false);
            },
          ),
          
          SizedBox(height: 16),
          
          // Actions
          Row(
            children: [
              Expanded(
                child: AsButton(
                  style: AsButtonStyle.secondary,
                  onPressed: () {
                    setState(() {
                      _selectedCategory = 'All';
                      _priceRange = 100;
                      _inStock = false;
                    });
                  },
                  child: Text('Reset'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: AsButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'category': _selectedCategory,
                      'price': _priceRange,
                      'inStock': _inStock,
                    });
                  },
                  child: Text('Apply'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## Platform Differences

### Material (Android/Web)
- Uses `showModalBottomSheet` with Material styling
- Material Design animations
- Material elevation and shadows

### Cupertino (iOS/macOS)
- Uses `CupertinoActionSheet` for action sheets
- iOS-style animations and transitions
- Native iOS appearance

## Best Practices

1. **Use for contextual actions** - Bottom sheets work best for actions related to current content
2. **Keep it simple** - Don't overload with too many options
3. **Handle keyboard** - Use `isScrollControlled: true` for forms
4. **Provide handle** - Add visual drag handle for scrollable sheets
5. **Consider alternatives** - Use dialogs for critical decisions

## See Also

- [AsAlertDialog](./as-alert-dialog) - For modal dialogs
- [AsAlertBanner](./as-alert-banner) - For inline alerts
- [Bottom Sheet Examples](https://ui.alphasow.dev/alerts) - Live demo