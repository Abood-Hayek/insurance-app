import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConsultantIdentityModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool emailSignUp = false;

  bool phoneSignUp = false;

  bool pass = false;

  bool passConfirm = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ID widget.
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  // State field(s) for agencyCode widget.
  TextEditingController? agencyCodeController;
  String? Function(BuildContext, String?)? agencyCodeControllerValidator;
  // State field(s) for agency widget.
  TextEditingController? agencyController;
  String? Function(BuildContext, String?)? agencyControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    idController?.dispose();
    agencyCodeController?.dispose();
    agencyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
