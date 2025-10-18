---
sidebar_position: 1
---

# Component Overview

Alphasow UI provides a comprehensive collection of Flutter UI components designed for consistent theming and platform adaptation. All components automatically switch between Material Design and Cupertino styling based on the current platform.

## Component Categories

### 🔘 Buttons
Interactive elements for user actions.

- **[AsButton](./buttons/as-button)** - Primary and secondary buttons with variants
- **[AsIconButton](./buttons/as-icon-button)** - Icon-based buttons with hover effects  
- **[AsLinkButton](./buttons/as-link-button)** - Text-based link buttons

### 📝 Forms & Input
Components for data collection and form validation.

- **[AsForm](./forms/as-form)** - Form wrapper with validation and state management
- **[AsTextFormField](./forms/as-text-form-field)** - Text input with built-in form validation
- **[AsTextField](./forms/as-text-field)** - Basic text input field
- **[AsCheckbox](./forms/as-checkbox)** - Checkbox with custom styling

### 🚨 Alerts & Notifications
Components for displaying messages and getting user attention.

- **[AsAlertDialog](./alerts/as-alert-dialog)** - Modal dialog boxes
- **[AsAlertBanner](./alerts/as-alert-banner)** - In-line banner alerts
- **[AsBottomSheet](./alerts/as-bottom-sheet)** - Bottom sheet modals
- **[Banner System](./alerts/banner-system)** - Global notification overlay

### 🧭 Navigation & Layout
Components for app structure and navigation.

- **[AsScaffold](./layout/as-scaffold)** - Platform-adaptive scaffold
- **[AsAppBar](./layout/as-app-bar)** - Application bar component
- **AsNavigationRail** - Side navigation
- **AsListTile** - List item component

### 🎨 Visual Elements
Components for visual presentation and feedback.

- **AsAvatar** - User avatar component
- **AsCard** - Card container component
- **AsLabel** - Text labels with styling
- **AsDivider** - Visual separators

### ⏳ Loading Indicators
Components for showing loading states.

- **[AsLoadingCircular](./loaders/as-loading-circular)** - Circular progress indicator
- **[AsLoadingSpinner](./loaders/as-loading-spinner)** - Custom spinner animation

### 📋 Menus
Dropdown and contextual menu components.

- **AsMenuDropdown** - Dropdown menu component
- **AsMenuDown** - Contextual dropdown menus
- **AsMenuDrawer** - Navigation drawer component

## Platform Adaptation

All components automatically adapt their appearance based on the current platform:

### iOS/macOS (Cupertino)
- Native iOS design language
- Cupertino colors and typography
- iOS-style animations and transitions

### Android/Web (Material)
- Material Design 3 principles
- Material color system
- Material motion and elevation

## Common Properties

Most Alphasow UI components share these common properties:

### Styling
- **`style`** - Custom styling options
- **`color`** - Primary color override
- **`backgroundColor`** - Background color override

### Behavior
- **`onPressed`** - Tap/click callback (interactive components)
- **`disabled`** - Disable interaction
- **`loading`** - Show loading state (where applicable)

### Accessibility
- **`semanticsLabel`** - Screen reader description
- **`excludeSemantics`** - Exclude from accessibility tree

## Usage Patterns

### Basic Component Usage
```dart
AsButton(
  onPressed: () {
    // Handle button press
  },
  child: const Text('Press Me'),
)
```

### With Custom Styling
```dart
AsButton(
  style: AsButtonStyle.secondary,
  backgroundColor: Colors.green,
  onPressed: () {
    // Handle button press
  },
  child: const Text('Custom Button'),
)
```

### With Loading State
```dart
AsButton(
  loading: isLoading,
  onPressed: isLoading ? null : () {
    // Handle button press
  },
  child: const Text('Submit'),
)
```

## Getting Started

1. **Import the package:**
   ```dart
   import 'package:alphasow_ui/alphasow_ui.dart';
   ```

2. **Wrap your app with AlphasowUiApp:**
   ```dart
   AlphasowUiApp(
     home: MyHomePage(),
   )
   ```

3. **Start using components:**
   ```dart
   AsButton(
     onPressed: () => context.showBanner(
       message: 'Hello!',
       type: AlertType.success,
     ),
     child: const Text('Show Banner'),
   )
   ```

## Next Steps

- Explore specific [component documentation](./buttons/as-button)
- Check out the [live demo](https://ui.alphasow.dev) to see components in action