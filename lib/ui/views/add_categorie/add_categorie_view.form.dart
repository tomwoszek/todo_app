// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';
const String BeschreibungckValueKey = 'beschreibungck';

final Map<String, TextEditingController>
    _AddCategorieViewTextEditingControllers = {};

final Map<String, FocusNode> _AddCategorieViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddCategorieViewTextValidations =
    {
  NameValueKey: null,
  BeschreibungckValueKey: null,
};

mixin $AddCategorieView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get beschreibungckController =>
      _getFormTextEditingController(BeschreibungckValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get beschreibungckFocusNode =>
      _getFormFocusNode(BeschreibungckValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddCategorieViewTextEditingControllers.containsKey(key)) {
      return _AddCategorieViewTextEditingControllers[key]!;
    }

    _AddCategorieViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddCategorieViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddCategorieViewFocusNodes.containsKey(key)) {
      return _AddCategorieViewFocusNodes[key]!;
    }
    _AddCategorieViewFocusNodes[key] = FocusNode();
    return _AddCategorieViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));
    beschreibungckController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));
    beschreibungckController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
          BeschreibungckValueKey: beschreibungckController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddCategorieViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddCategorieViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddCategorieViewTextEditingControllers.clear();
    _AddCategorieViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get beschreibungckValue =>
      this.formValueMap[BeschreibungckValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_AddCategorieViewTextEditingControllers.containsKey(NameValueKey)) {
      _AddCategorieViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set beschreibungckValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BeschreibungckValueKey: value}),
    );

    if (_AddCategorieViewTextEditingControllers.containsKey(
        BeschreibungckValueKey)) {
      _AddCategorieViewTextEditingControllers[BeschreibungckValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasBeschreibungck =>
      this.formValueMap.containsKey(BeschreibungckValueKey) &&
      (beschreibungckValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasBeschreibungckValidationMessage =>
      this.fieldsValidationMessages[BeschreibungckValueKey]?.isNotEmpty ??
      false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get beschreibungckValidationMessage =>
      this.fieldsValidationMessages[BeschreibungckValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setBeschreibungckValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BeschreibungckValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
    beschreibungckValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      BeschreibungckValueKey: getValidationMessage(BeschreibungckValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddCategorieViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddCategorieViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
      BeschreibungckValueKey: getValidationMessage(BeschreibungckValueKey),
    });
