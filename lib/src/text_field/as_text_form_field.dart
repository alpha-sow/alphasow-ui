import 'dart:ui';

import 'package:alphasow_ui/alphasow_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A form field widget that wraps [AsTextField] with validation support.
///
/// This widget extends Flutter's FormField to provide automatic form validation,
/// state management, and integration with Form widgets. It maintains all the
/// functionality of [AsTextField] while adding form-specific features like
/// validators, onSaved callbacks, and automatic error display.
class AsTextFormField extends FormField<String> {
  /// Creates a form field with text input and validation capabilities.
  ///
  /// [validator] Function that validates the input value
  /// [onSaved] Callback called when the form is saved
  /// [initialValue] Initial value for the field (cannot be used with controller)
  /// [autovalidateMode] When to automatically validate the field
  ///
  /// All other parameters correspond to [AsTextField] parameters with the same names.
  AsTextFormField({
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
    this.stylusHandwritingEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.spellCheckConfiguration,
    this.magnifierConfiguration,
    this.prefix,
    this.suffix,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.autovalidateMode,
    super.enabled,
    super.restorationId,
  })  : assert(
          controller == null || initialValue == null,
          'Cannot provide both a controller and an initialValue.',
        ),
        super(
          builder: (FormFieldState<String> field) {
            final state = field as _AsTextFormFieldState;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AsTextField(
                  type: state._asTextFormField.type,
                  controller: state._effectiveController,
                  label: state._asTextFormField.label,
                  hintText: state._asTextFormField.hintText,
                  description: state._asTextFormField.description,
                  disabled: state._asTextFormField.disabled,
                  focusNode: state._asTextFormField.focusNode,
                  decoration: state._asTextFormField.decoration,
                  keyboardType: state._asTextFormField.keyboardType,
                  textInputAction: state._asTextFormField.textInputAction,
                  textCapitalization: state._asTextFormField.textCapitalization,
                  style: state._asTextFormField.style,
                  strutStyle: state._asTextFormField.strutStyle,
                  textAlign: state._asTextFormField.textAlign,
                  textAlignVertical: state._asTextFormField.textAlignVertical,
                  textDirection: state._asTextFormField.textDirection,
                  readOnly: state._asTextFormField.readOnly,
                  showCursor: state._asTextFormField.showCursor,
                  autofocus: state._asTextFormField.autofocus,
                  obscuringCharacter: state._asTextFormField.obscuringCharacter,
                  obscureText: state._asTextFormField.obscureText,
                  autocorrect: state._asTextFormField.autocorrect,
                  smartDashesType: state._asTextFormField.smartDashesType,
                  smartQuotesType: state._asTextFormField.smartQuotesType,
                  enableSuggestions: state._asTextFormField.enableSuggestions,
                  maxLines: state._asTextFormField.maxLines,
                  minLines: state._asTextFormField.minLines,
                  expands: state._asTextFormField.expands,
                  maxLength: state._asTextFormField.maxLength,
                  maxLengthEnforcement:
                      state._asTextFormField.maxLengthEnforcement,
                  onChanged: (value) {
                    field.didChange(value);
                    state._asTextFormField.onChanged?.call(value);
                  },
                  onEditingComplete: state._asTextFormField.onEditingComplete,
                  onSubmitted: state._asTextFormField.onSubmitted,
                  onAppPrivateCommand:
                      state._asTextFormField.onAppPrivateCommand,
                  inputFormatters: state._asTextFormField.inputFormatters,
                  enabled: state._asTextFormField.enabled,
                  cursorWidth: state._asTextFormField.cursorWidth,
                  cursorHeight: state._asTextFormField.cursorHeight,
                  cursorRadius: state._asTextFormField.cursorRadius,
                  cursorColor: state._asTextFormField.cursorColor,
                  selectionHeightStyle:
                      state._asTextFormField.selectionHeightStyle,
                  selectionWidthStyle:
                      state._asTextFormField.selectionWidthStyle,
                  keyboardAppearance: state._asTextFormField.keyboardAppearance,
                  scrollPadding: state._asTextFormField.scrollPadding,
                  dragStartBehavior: state._asTextFormField.dragStartBehavior,
                  enableInteractiveSelection:
                      state._asTextFormField.enableInteractiveSelection,
                  selectionControls: state._asTextFormField.selectionControls,
                  onTap: state._asTextFormField.onTap,
                  onTapOutside: state._asTextFormField.onTapOutside,
                  mouseCursor: state._asTextFormField.mouseCursor,
                  buildCounter: state._asTextFormField.buildCounter,
                  scrollController: state._asTextFormField.scrollController,
                  scrollPhysics: state._asTextFormField.scrollPhysics,
                  autofillHints: state._asTextFormField.autofillHints,
                  contentInsertionConfiguration:
                      state._asTextFormField.contentInsertionConfiguration,
                  clipBehavior: state._asTextFormField.clipBehavior,
                  restorationId: state._asTextFormField.restorationId,
                  stylusHandwritingEnabled:
                      state._asTextFormField.stylusHandwritingEnabled,
                  enableIMEPersonalizedLearning:
                      state._asTextFormField.enableIMEPersonalizedLearning,
                  canRequestFocus: state._asTextFormField.canRequestFocus,
                  spellCheckConfiguration:
                      state._asTextFormField.spellCheckConfiguration,
                  magnifierConfiguration:
                      state._asTextFormField.magnifierConfiguration,
                  prefix: state._asTextFormField.prefix,
                  suffix: state._asTextFormField.suffix,
                ),
                if (field.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 12),
                    child: Text(
                      field.errorText ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(field.context).colorScheme.error,
                      ),
                    ),
                  ),
              ],
            );
          },
        );

  /// The preset input type (email, password) with automatic configuration
  final Type? type;

  /// Controller for managing the input's text value
  final TextEditingController? controller;

  /// Optional label text displayed above the input field
  final String? label;

  /// Placeholder text shown when the input is empty
  final String? hintText;

  /// Optional description text displayed below the input field
  final String? description;

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
  FormFieldState<String> createState() => _AsTextFormFieldState();
}

class _AsTextFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _asTextFormField.controller ?? _controller!;

  AsTextFormField get _asTextFormField => widget as AsTextFormField;

  @override
  void initState() {
    super.initState();
    if (_asTextFormField.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      _asTextFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(AsTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_asTextFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _asTextFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _asTextFormField.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }
      if (_asTextFormField.controller != null) {
        setValue(_asTextFormField.controller!.text);
        if (oldWidget.controller == null) {
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _asTextFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
