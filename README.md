# Alphasow UI

A Flutter package that provides a collection of reusable UI components with a consistent theming system.

#### Configure pub to use repo.alphasow.dev

Create or update your pub credentials configuration:

```bash
# Set the hosted URL for pub
flutter pub deps --hosted-url=https://repo.alphasow.dev/artifactory/api/pub/repo-pub
```

Or configure it globally by creating/editing `~/.pub-cache/credentials.json`:

```json
{
  "hosted": [
    {
      "name": "repo.alphasow.dev",
      "url": "https://repo.alphasow.dev/artifactory/api/pub/repo-pub"
    }
  ]
}
```

## Getting Started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  alphasow_ui: ^1.0.0
```

Then run:
```bash
flutter pub get
```

## Usage

### Initialize Theme

Before using any components, initialize the theme:

```dart
import 'package:alphasow_ui/alphasow_ui.dart';

void main() {
  ThemeUI.init();
  runApp(MyApp());
}
```

## Example

Check out the `/example` folder for a complete demonstration of all available components.

To run the example:

```bash
cd example
flutter pub get
flutter run
```

## Architecture

- **ThemeUI**: Singleton class managing global theme configuration
- **Component Structure**: Each component follows the pattern `[name].dart` (export) and `[name]_ui.dart` (implementation)
- **Consistent Styling**: All components use the centralized theme system for colors and styling

## Configuration

### Using Custom Repository Host

This package is hosted on a private repository. To use `pub get` with the custom host `repo.alphasow.dev`, you need to configure your pub client.



#### Installing the package

Once configured, install the package normally:

```yaml
dependencies:
  alphasow_ui: ^1.0.0
```

```bash
flutter pub get
```

**Steps to update:**

1. Open `pubspec.yaml` in your project root
2. Locate the `publish_to` field (currently points to `https://repo.alphasow.dev/artifactory/api/pub/repo-pub`)
3. Replace with your new repository URL
4. Update `homepage`, `repository`, and `documentation` URLs if needed
5. Run `flutter pub get` to apply changes

**Note:** Make sure your new repository URL supports Dart package publishing and you have proper authentication configured.

## Additional Information

- **Version**: 1.0.0
- **Flutter SDK**: >=3.16.0
- **Dart SDK**: ^3.5.3

For issues and contributions, please refer to the project repository.
