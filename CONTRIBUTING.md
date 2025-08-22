# Contributing to Alphasow UI

Thank you for your interest in contributing to Alphasow UI! This guide will help you get started with contributing to our Flutter UI component library.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contributing Guidelines](#contributing-guidelines)
- [Component Development](#component-development)
- [Testing](#testing)
- [Code Style](#code-style)
- [Submitting Changes](#submitting-changes)
- [Review Process](#review-process)

## Code of Conduct

By participating in this project, you agree to abide by our Code of Conduct. Please be respectful and constructive in all interactions.

## Getting Started

### Prerequisites

- **Flutter SDK**: >=3.16.0
- **Dart SDK**: ^3.5.3
- Git
- A code editor (VS Code, Android Studio, etc.)

### Repository Access

This project uses a private repository. Ensure you have proper access and authentication configured for `repo.alphasow.dev`.

## Development Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/alpha-sow/alphasow-ui.git
   cd alphasow-ui
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the example app**:
   ```bash
   cd example
   flutter pub get
   flutter run
   ```

4. **Verify setup**:
   ```bash
   flutter analyze
   flutter test
   ```

## Contributing Guidelines

### Types of Contributions

- **Bug fixes**: Fix existing issues or unexpected behaviors
- **New components**: Add new UI components following our design system
- **Component enhancements**: Improve existing components with new features
- **Documentation**: Improve README, code comments, or examples
- **Tests**: Add or improve test coverage
- **Performance**: Optimize component performance

### Before Contributing

1. **Check existing issues**: Search for existing issues or feature requests
2. **Create an issue**: If none exists, create a detailed issue using our templates
3. **Discuss approach**: For significant changes, discuss your approach first
4. **Fork and branch**: Create a feature branch for your changes

## Component Development

### Component Structure

Follow the established pattern for new components:

```
lib/src/[category]/
├── [category].dart          # Export file
├── as_[component].dart      # Component implementation
└── README.md               # Component documentation (optional)
```

### Naming Conventions

- **Components**: `As[ComponentName]` (e.g., `AsButton`, `AsTextField`)
- **Files**: `as_[component_name].dart` (snake_case)
- **Directories**: Use category names (button, alert, loader, etc.)

### Component Requirements

1. **Platform Adaptation**: Support both Material and Cupertino styling
2. **Accessibility**: Include proper semantic labels and behaviors
3. **Theme Integration**: Use the centralized theme system
4. **Documentation**: Include comprehensive dartdoc comments
5. **Examples**: Provide usage examples in the example app

### Example Component Structure

```dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/// A custom button component that adapts to platform styling.
///
/// This button automatically switches between Material and Cupertino
/// styling based on the current platform.
///
/// Example usage:
/// ```dart
/// AsButton(
///   onPressed: () => print('Pressed'),
///   child: Text('Click me'),
/// )
/// ```
class AsButton extends StatelessWidget {
  /// Creates an adaptive button.
  const AsButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = Variant.primary,
  });

  /// Called when the button is pressed.
  final VoidCallback? onPressed;

  /// The widget to display inside the button.
  final Widget child;

  /// The visual variant of the button.
  final Variant variant;

  @override
  Widget build(BuildContext context) {
    // Implementation here
  }
}
```

## Testing

### Writing Tests

1. **Unit tests**: Test component logic and behavior
2. **Widget tests**: Test component rendering and interactions
3. **Integration tests**: Test component integration in the example app

### Test Structure

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:alphasow_ui/alphasow_ui.dart';

void main() {
  group('AsButton', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AsButton(
            onPressed: () {},
            child: const Text('Test'),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('calls onPressed when tapped', (tester) async {
      var pressed = false;
      
      await tester.pumpWidget(
        MaterialApp(
          home: AsButton(
            onPressed: () => pressed = true,
            child: const Text('Test'),
          ),
        ),
      );

      await tester.tap(find.text('Test'));
      expect(pressed, isTrue);
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/button_test.dart
```

## Code Style

### Formatting

- Use `dart format .` to format code
- Follow the project's analysis options (`analysis_options.yaml`)
- Line length limit is ignored (but keep reasonable lengths)

### Code Quality

- Run `flutter analyze` and fix all issues
- Use meaningful variable and function names
- Add comprehensive dartdoc comments for public APIs
- Follow Flutter/Dart best practices

### Import Organization

```dart
// Dart imports
import 'dart:async';

// Flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Package imports
import 'package:some_package/some_package.dart';

// Local imports
import '../utils/platform.dart';
```

## Submitting Changes

### Pull Request Process

1. **Create a branch**:
   ```bash
   git checkout -b feature/new-component
   ```

2. **Make changes**:
   - Follow the component development guidelines
   - Add tests for new functionality
   - Update documentation as needed

3. **Test thoroughly**:
   ```bash
   flutter analyze
   flutter test
   cd example && flutter run  # Manual testing
   ```

4. **Commit changes**:
   ```bash
   git add .
   git commit -m "feat: add AsNewComponent with platform adaptation"
   ```

5. **Push and create PR**:
   ```bash
   git push origin feature/new-component
   ```

### Commit Message Format

Use conventional commits format:

- `feat:` - New features
- `fix:` - Bug fixes
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

Examples:
- `feat: add AsDatePicker component with Cupertino support`
- `fix: resolve AsButton hover state on web platform`
- `docs: update AsTextField usage examples`

### Pull Request Guidelines

- **Title**: Use descriptive titles that explain the change
- **Description**: Provide detailed description of changes made
- **Screenshots**: Include screenshots for UI changes
- **Testing**: Describe how you tested the changes
- **Breaking Changes**: Clearly document any breaking changes
- **Issue Reference**: Link to related issues

## Review Process

### What to Expect

1. **Automated checks**: CI will run tests and analysis
2. **Code review**: Maintainers will review your code
3. **Feedback**: You may receive requests for changes
4. **Approval**: Once approved, your PR will be merged

### Review Criteria

- **Code quality**: Clean, readable, well-documented code
- **Testing**: Adequate test coverage for new functionality
- **Design consistency**: Follows established patterns
- **Platform support**: Works correctly on all supported platforms
- **Performance**: No significant performance regressions
- **Accessibility**: Maintains accessibility standards

## Getting Help

- **Issues**: Use GitHub issues for bug reports and feature requests
- **Discussions**: Use GitHub discussions for questions and ideas
- **Documentation**: Check the README and example app
- **Live Demo**: Explore components at [ui.alphasow.dev](https://ui.alphasow.dev)

## Release Process

Releases are managed by maintainers and follow semantic versioning:

- **Patch** (1.0.1): Bug fixes
- **Minor** (1.1.0): New features, backwards compatible
- **Major** (2.0.0): Breaking changes

Thank you for contributing to Alphasow UI! 🎉