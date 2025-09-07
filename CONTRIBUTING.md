# Contributing to Alphasow UI

Thank you for your interest in contributing to Alphasow UI! This guide will help you get started with contributing to our Flutter UI component library.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Contributing Guidelines](#contributing-guidelines)
- [Component Development](#component-development)
- [Documentation Contributions](#documentation-contributions)
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

This is an open-source project hosted on GitHub. Fork the repository to contribute changes.

## Development Setup

1. **Fork and clone the repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/alphasow-ui.git
   cd alphasow-ui
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Install documentation dependencies** (if contributing to docs):
   ```bash
   cd docs
   npm install
   ```

4. **Run the example app**:
   ```bash
   cd example
   flutter pub get
   flutter run
   ```

5. **Verify setup**:
   ```bash
   flutter analyze
   flutter test
   ```

6. **Start documentation site** (optional):
   ```bash
   cd docs
   npm start
   ```

## Contributing Guidelines

### Types of Contributions

- **Bug fixes**: Fix existing issues or unexpected behaviors
- **New components**: Add new UI components following our design system
- **Component enhancements**: Improve existing components with new features
- **Documentation**: Improve README, code comments, examples, or website docs
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

## Documentation Contributions

### Documentation Structure

The project has two types of documentation:

1. **Code Documentation**: Dartdoc comments in Dart code
2. **Website Documentation**: Markdown files in the `docs/` directory

### Contributing to Website Documentation

The documentation website is built with Docusaurus and deployed automatically.

#### Setup

```bash
cd docs
npm install
npm start  # Starts development server at http://localhost:3000
```

#### Structure

```
docs/
├── docs/
│   ├── intro.md                    # Getting started guide
│   ├── components/
│   │   ├── overview.md             # Component overview
│   │   ├── buttons/
│   │   │   ├── as-button.md        # Individual component docs
│   │   │   └── as-icon-button.md
│   │   └── forms/
│   └── guides/
│       └── quick-start.md
├── src/
│   ├── components/
│   │   └── HomepageFeatures/       # Homepage components
│   ├── css/
│   │   └── custom.css              # Custom styling
│   └── pages/
│       └── index.tsx               # Homepage
└── docusaurus.config.ts            # Site configuration
```

#### Writing Component Documentation

When adding a new component, create comprehensive documentation:

```markdown
---
sidebar_position: 1
---

# AsNewComponent

A brief description of what the component does.

## Import

\`\`\`dart
import 'package:alphasow_ui/alphasow_ui.dart';
\`\`\`

## Basic Usage

\`\`\`dart
AsNewComponent(
  property: 'value',
  onAction: () {},
)
\`\`\`

## API Reference

### Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `property` | `String` | required | Description of the property |

## Examples

### Advanced Usage
\`\`\`dart
// More complex examples
\`\`\`

## See Also

- [Related Component](./related-component)
```

#### Guidelines for Documentation

- **Clear examples**: Include practical, copy-paste ready code examples
- **Complete API coverage**: Document all public properties and methods
- **Cross-references**: Link to related components and guides
- **Platform notes**: Mention platform-specific behavior
- **Accessibility**: Document accessibility features

#### Building and Testing Documentation

```bash
# Build for production
npm run build

# Test the production build locally
npm run serve

# Type check
npm run typecheck
```

#### Documentation Deployment

- **Automatic**: Pushes to main branch automatically deploy to [docs site](https://ui.alphasow.dev)
- **Preview**: Pull requests generate preview deployments
- **Firebase**: Hosted on Firebase Hosting

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
   
   # If documentation changes:
   cd docs
   npm run build          # Test documentation build
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

1. **Automated checks**: GitHub Actions will run:
   - Flutter analyzer (`flutter analyze`)
   - Flutter tests (`flutter test`)
   - Documentation build (for docs changes)
   - Semantic release process (on main branch)
2. **Code review**: Maintainers will review your code
3. **Feedback**: You may receive requests for changes
4. **Preview deployment**: Documentation PRs get preview deployments
5. **Approval**: Once approved, your PR will be merged

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
