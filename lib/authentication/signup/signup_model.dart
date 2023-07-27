import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignupModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool emailSignUp = false;

  bool phoneSignUp = false;

  bool pass = false;

  bool passConfirm = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Phone widget.
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 9) {
      return 'Invalid Phone Number';
    }
    if (val.length > 15) {
      return 'Invalid Phone Number';
    }

    return null;
  }

  // State field(s) for Password1 widget.
  TextEditingController? password1Controller;
  late bool password1Visibility;
  String? Function(BuildContext, String?)? password1ControllerValidator;
  String? _password1ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Password should be at least 6 characters long';
    }

    return null;
  }

  // State field(s) for Password2 widget.
  TextEditingController? password2Controller;
  late bool password2Visibility;
  String? Function(BuildContext, String?)? password2ControllerValidator;
  String? _password2ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Password should be at least 6 characters long';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
    password1Visibility = false;
    password1ControllerValidator = _password1ControllerValidator;
    password2Visibility = false;
    password2ControllerValidator = _password2ControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    password1Controller?.dispose();
    password2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
