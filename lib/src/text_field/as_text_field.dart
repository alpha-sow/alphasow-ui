import 'dart:ui';

import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the input types with specific keyboard and behavior configurations.
///
/// Each type automatically configures the appropriate keyboard type and
/// handles specific input behaviors like password obscuring.
enum Type {
  /// Email input type with email keyboard
  email,

  /// Password input type with obscured text
  password
}

/// Extension providing keyboard type mapping for input types.
///
/// This extension automatically maps input types to their appropriate
/// keyboard configurations for better user experience.
extension TypeExtension on Type {
  /// Returns the appropriate keyboard type for this input type.
  TextInputType get keyboardType {
    switch (this) {
      case Type.email:
        return TextInputType.emailAddress;
      case Type.password:
        return TextInputType.emailAddress;
    }
  }
}

/// A comprehensive input widget with built-in styling and label support.
///
/// This widget provides a consistent text input experience with automatic
/// styling, label management, and support for various input types. It wraps
/// Flutter's TextField with additional functionality like automatic password
/// obscuring and themed styling.
class AsTextField extends StatelessWidget {
  /// Creates a customizable input field with extensive configuration options.
  ///
  /// [type] Preset input type (email, password) with automatic configuration
  /// [controller] Text editing controller for managing input value
  /// [label] Optional label text displayed above the input
  /// [hintText] Placeholder text shown when input is empty
  /// [description] Optional description text displayed below the input
  /// [disabled] Whether the input is disabled (deprecated, use enabled instead)
  ///
  /// All other parameters correspond to TextField parameters with the same names.
  const AsTextField({
    super.key,
    this.type,
    this.controller,
    this.label,
    this.hintText,
    this.description,
    this.disabled,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints = const <String>[],
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.stylusHandwritingEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.prefix,
    this.suffix,
  });

  /// The preset input type (email, password) with automatic configuration
  final Type? type;

  /// Optional label text displayed above the input field
  final String? label;

  /// Placeholder text shown when the input is empty
  final String? hintText;

  /// Optional description text displayed below the input field
  final String? description;

  /// Controller for managing the input's text value
  final TextEditingController? controller;

  /// Whether the input is disabled (deprecated, use enabled instead)
  final bool? disabled;

  /// Focus node for managing input focus state
  final FocusNode? focusNode;

  /// Custom input decoration (overrides default styling)
  final InputDecoration? decoration;

  /// The type of keyboard to display (overrides type-based keyboard)
  final TextInputType? keyboardType;

  /// The action button to display on the keyboard
  final TextInputAction? textInputAction;

  /// How to capitalize text being entered
  final TextCapitalization textCapitalization;

  /// The style to use for the input text
  final TextStyle? style;

  /// The strut style to use for the input text
  final StrutStyle? strutStyle;

  /// How to align the text horizontally
  final TextAlign textAlign;

  /// How to align the text vertically
  final TextAlignVertical? textAlignVertical;

  /// The directionality of the text
  final TextDirection? textDirection;

  /// Whether the input is read-only
  final bool readOnly;

  /// Whether to show the cursor
  final bool? showCursor;

  /// Whether the input should be focused initially
  final bool autofocus;

  /// Character used to obscure text in password fields
  final String obscuringCharacter;

  /// Whether to obscure the entered text (overrides type-based obscuring)
  final bool? obscureText;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Configuration for smart dashes
  final SmartDashesType? smartDashesType;

  /// Configuration for smart quotes
  final SmartQuotesType? smartQuotesType;

  /// Whether to show input suggestions
  final bool enableSuggestions;

  /// Maximum number of lines for the input
  final int? maxLines;

  /// Minimum number of lines for the input
  final int? minLines;

  /// Whether the input should expand to fill available space
  final bool expands;

  /// Maximum number of characters allowed
  final int? maxLength;

  /// How to enforce the maximum length
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Callback called when the input value changes
  final ValueChanged<String>? onChanged;

  /// Callback called when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback called when the input is submitted
  final ValueChanged<String>? onSubmitted;

  /// Callback for handling app private commands
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// List of input formatters to apply
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the input is enabled
  final bool? enabled;

  /// Width of the cursor
  final double cursorWidth;

  /// Height of the cursor
  final double? cursorHeight;

  /// Radius of the cursor corners
  final Radius? cursorRadius;

  /// Color of the cursor
  final Color? cursorColor;

  /// How to handle the height of selected text
  final BoxHeightStyle selectionHeightStyle;

  /// How to handle the width of selected text
  final BoxWidthStyle selectionWidthStyle;

  /// Brightness of the keyboard
  final Brightness? keyboardAppearance;

  /// Padding around the scrollable area
  final EdgeInsets scrollPadding;

  /// How to handle drag start behavior
  final DragStartBehavior dragStartBehavior;

  /// Whether to enable interactive text selection
  final bool? enableInteractiveSelection;

  /// Custom text selection controls
  final TextSelectionControls? selectionControls;

  /// Callback called when the input is tapped
  final GestureTapCallback? onTap;

  /// Callback called when tapping outside the input
  final TapRegionCallback? onTapOutside;

  /// The mouse cursor to display
  final MouseCursor? mouseCursor;

  /// Builder for the character counter widget
  final InputCounterWidgetBuilder? buildCounter;

  /// Controller for scrolling behavior
  final ScrollController? scrollController;

  /// Physics for scrolling behavior
  final ScrollPhysics? scrollPhysics;

  /// Hints for autofill behavior
  final Iterable<String>? autofillHints;

  /// Configuration for content insertion
  final ContentInsertionConfiguration? contentInsertionConfiguration;

  /// How to clip the input content
  final Clip clipBehavior;

  /// Restoration ID for state restoration
  final String? restorationId;

  /// Whether to enable stylus handwriting
  final bool stylusHandwritingEnabled;

  /// Whether to enable IME personalized learning
  final bool enableIMEPersonalizedLearning;

  /// Whether the input can request focus
  final bool canRequestFocus;

  /// Configuration for spell checking
  final SpellCheckConfiguration? spellCheckConfiguration;

  /// Configuration for text magnification
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// Widget to display before the input field
  final Widget? prefix;

  /// Widget to display after the input field
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              label!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          )
        else
          const SizedBox.shrink(),
        SizedBox(
          height: 44,
          child: PlatformType.currentPlatform() == PlatformType.cupertino
              ? _CupertinoTextFieldWidget(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: decoration,
                  keyboardType:
                      keyboardType ?? type?.keyboardType ?? TextInputType.text,
                  textInputAction: textInputAction,
                  textCapitalization: textCapitalization,
                  style: style,
                  strutStyle: strutStyle,
                  textAlign: textAlign,
                  textAlignVertical: textAlignVertical,
                  textDirection: textDirection,
                  readOnly: readOnly,
                  showCursor: showCursor,
                  autofocus: autofocus,
                  obscuringCharacter: obscuringCharacter,
                  obscureText: obscureText ?? (type == Type.password),
                  autocorrect: autocorrect,
                  smartDashesType: smartDashesType,
                  smartQuotesType: smartQuotesType,
                  enableSuggestions: enableSuggestions,
                  maxLines: maxLines,
                  minLines: minLines,
                  expands: expands,
                  maxLength: maxLength,
                  maxLengthEnforcement: maxLengthEnforcement,
                  onChanged: onChanged,
                  onEditingComplete: onEditingComplete,
                  onSubmitted: onSubmitted,
                  inputFormatters: inputFormatters,
                  enabled: enabled ?? (disabled != null ? !disabled! : null),
                  cursorWidth: cursorWidth,
                  cursorHeight: cursorHeight,
                  cursorRadius: cursorRadius,
                  cursorColor: cursorColor,
                  keyboardAppearance: keyboardAppearance,
                  scrollPadding: scrollPadding,
                  dragStartBehavior: dragStartBehavior,
                  enableInteractiveSelection: enableInteractiveSelection,
                  onTap: onTap,
                  scrollController: scrollController,
                  scrollPhysics: scrollPhysics,
                  autofillHints: autofillHints,
                  clipBehavior: clipBehavior,
                  restorationId: restorationId,
                  enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                  hintText: hintText,
                  prefix: prefix,
                  suffix: suffix,
                )
              : _MaterialTextFieldWidget(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: decoration,
                  keyboardType:
                      keyboardType ?? type?.keyboardType ?? TextInputType.text,
                  textInputAction: textInputAction,
                  textCapitalization: textCapitalization,
                  style: style ?? const TextStyle(fontSize: 14),
                  strutStyle: strutStyle,
                  textAlign: textAlign,
                  textAlignVertical: textAlignVertical,
                  textDirection: textDirection,
                  readOnly: readOnly,
                  showCursor: showCursor,
                  autofocus: autofocus,
                  obscuringCharacter: obscuringCharacter,
                  obscureText: obscureText ?? (type == Type.password),
                  autocorrect: autocorrect,
                  smartDashesType: smartDashesType,
                  smartQuotesType: smartQuotesType,
                  enableSuggestions: enableSuggestions,
                  maxLines: maxLines,
                  minLines: minLines,
                  expands: expands,
                  maxLength: maxLength,
                  maxLengthEnforcement: maxLengthEnforcement,
                  onChanged: onChanged,
                  onEditingComplete: onEditingComplete,
                  onSubmitted: onSubmitted,
                  onAppPrivateCommand: onAppPrivateCommand,
                  inputFormatters: inputFormatters,
                  enabled: enabled ?? (disabled != null ? !disabled! : null),
                  cursorWidth: cursorWidth,
                  cursorHeight: cursorHeight,
                  cursorRadius: cursorRadius,
                  cursorColor: cursorColor,
                  selectionHeightStyle: selectionHeightStyle,
                  selectionWidthStyle: selectionWidthStyle,
                  keyboardAppearance: keyboardAppearance,
                  scrollPadding: scrollPadding,
                  dragStartBehavior: dragStartBehavior,
                  enableInteractiveSelection: enableInteractiveSelection,
                  selectionControls: selectionControls,
                  onTap: onTap,
                  onTapOutside: onTapOutside,
                  mouseCursor: mouseCursor,
                  buildCounter: buildCounter,
                  scrollController: scrollController,
                  scrollPhysics: scrollPhysics,
                  autofillHints: autofillHints,
                  contentInsertionConfiguration: contentInsertionConfiguration,
                  clipBehavior: clipBehavior,
                  restorationId: restorationId,
                  stylusHandwritingEnabled: stylusHandwritingEnabled,
                  enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
                  canRequestFocus: canRequestFocus,
                  spellCheckConfiguration: spellCheckConfiguration,
                  magnifierConfiguration: magnifierConfiguration,
                  hintText: hintText,
                  prefix: prefix,
                  suffix: suffix,
                ),
        ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(description!),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}

class _CupertinoTextFieldWidget extends StatelessWidget {
  const _CupertinoTextFieldWidget({
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.onTap,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.hintText,
    this.prefix,
    this.suffix,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;

  /// Converts InputDecoration to BoxDecoration for CupertinoTextField
  BoxDecoration _getBoxDecoration(BuildContext context) {
    if (decoration != null) {
      // Extract properties from InputDecoration
      Border? border;
      BorderRadius? borderRadius;
      Color? fillColor;
      List<BoxShadow>? boxShadow;
      Gradient? gradient;
      DecorationImage? image;
      var shape = BoxShape.rectangle;

      // Get border from enabledBorder, focusedBorder, or border
      final inputBorder = decoration!.enabledBorder ??
          decoration!.focusedBorder ??
          decoration!.border;

      if (inputBorder is OutlineInputBorder) {
        // Handle OutlineInputBorder
        final borderSide = inputBorder.borderSide;
        border = Border.all(
          color: borderSide.color,
          width: borderSide.width,
          style: borderSide.style == BorderStyle.none
              ? BorderStyle.none
              : BorderStyle.solid,
          strokeAlign: borderSide.strokeAlign,
        );
        borderRadius = inputBorder.borderRadius;
      } else if (inputBorder is UnderlineInputBorder) {
        // Handle UnderlineInputBorder
        final borderSide = inputBorder.borderSide;
        border = Border(
          bottom: BorderSide(
            color: borderSide.color,
            width: borderSide.width,
            style: borderSide.style,
            strokeAlign: borderSide.strokeAlign,
          ),
        );
        borderRadius = inputBorder.borderRadius;
      } else if (inputBorder != null && inputBorder != InputBorder.none) {
        // Handle other border types (treat as outline)
        border = Border.all(
          color: CupertinoColors.systemGrey4,
        );
      }

      // Get fill color
      if (decoration!.filled ?? false) {
        fillColor = decoration!.fillColor;
      }

      // Add subtle shadow if there's a border and fill
      if (border != null && fillColor != null) {
        boxShadow = [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ];
      }

      // Determine shape based on borderRadius
      if (borderRadius != null) {
        shape = BoxShape.rectangle;
      }

      return BoxDecoration(
        color: fillColor,
        border: border ??
            Border.all(
              color: CupertinoColors.systemGrey4,
            ),
        borderRadius: shape == BoxShape.rectangle
            ? borderRadius ?? BorderRadius.circular(8)
            : null,
        boxShadow: boxShadow,
        gradient: gradient,
        image: image,
        shape: shape,
      );
    }

    // Default decoration
    return BoxDecoration(
      border: Border.all(
        color: CupertinoColors.systemGrey4,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style ?? const TextStyle(fontSize: 14),
      strutStyle: strutStyle ?? const StrutStyle(height: 1.4),
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      showCursor: showCursor,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      enabled: enabled ?? true,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight ?? 20,
      cursorRadius: cursorRadius ?? const Radius.circular(2),
      cursorColor: cursorColor,
      keyboardAppearance: keyboardAppearance ?? Brightness.light,
      scrollPadding: scrollPadding,
      dragStartBehavior: dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      onTap: onTap,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints ?? const <String>[],
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      placeholder: hintText,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: enabled ?? true ? _getBoxDecoration(context) : null,
      prefix: prefix != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: prefix,
            )
          : null,
      suffix: suffix != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: suffix,
            )
          : null,
    );
  }
}

class _MaterialTextFieldWidget extends StatelessWidget {
  const _MaterialTextFieldWidget({
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection,
    this.selectionControls,
    this.onTap,
    this.onTapOutside,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.contentInsertionConfiguration,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.stylusHandwritingEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.hintText,
    this.prefix,
    this.suffix,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final BoxHeightStyle selectionHeightStyle;
  final BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final ContentInsertionConfiguration? contentInsertionConfiguration;
  final Clip clipBehavior;
  final String? restorationId;
  final bool stylusHandwritingEnabled;
  final bool enableIMEPersonalizedLearning;
  final bool canRequestFocus;
  final SpellCheckConfiguration? spellCheckConfiguration;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      readOnly: readOnly,
      showCursor: showCursor,
      autofocus: autofocus,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onAppPrivateCommand: onAppPrivateCommand,
      inputFormatters: inputFormatters,
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight ?? 20,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      selectionHeightStyle: selectionHeightStyle,
      selectionWidthStyle: selectionWidthStyle,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      dragStartBehavior: dragStartBehavior,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      onTap: onTap,
      onTapOutside: onTapOutside,
      mouseCursor: mouseCursor,
      buildCounter: buildCounter,
      scrollController: scrollController,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      contentInsertionConfiguration: contentInsertionConfiguration,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      stylusHandwritingEnabled: stylusHandwritingEnabled,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
      canRequestFocus: canRequestFocus,
      spellCheckConfiguration: spellCheckConfiguration,
      magnifierConfiguration: magnifierConfiguration,
      decoration: decoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 14,
            ),
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: hintText,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
    );
  }
}
