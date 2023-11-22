import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextController1Validator;
  // State field(s) for txtEmailcadastro widget.
  FocusNode? txtEmailcadastroFocusNode;
  TextEditingController? txtEmailcadastroController;
  String? Function(BuildContext, String?)? txtEmailcadastroControllerValidator;
  // State field(s) for TxtSenhaDCadastro widget.
  FocusNode? txtSenhaDCadastroFocusNode;
  TextEditingController? txtSenhaDCadastroController;
  late bool txtSenhaDCadastroVisibility;
  String? Function(BuildContext, String?)? txtSenhaDCadastroControllerValidator;
  // State field(s) for txtSenhaCadastroConfirma widget.
  FocusNode? txtSenhaCadastroConfirmaFocusNode;
  TextEditingController? txtSenhaCadastroConfirmaController;
  late bool txtSenhaCadastroConfirmaVisibility;
  String? Function(BuildContext, String?)?
      txtSenhaCadastroConfirmaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    txtSenhaDCadastroVisibility = false;
    txtSenhaCadastroConfirmaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldFocusNode1?.dispose();
    emailTextController1?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController1?.dispose();

    txtEmailcadastroFocusNode?.dispose();
    txtEmailcadastroController?.dispose();

    txtSenhaDCadastroFocusNode?.dispose();
    txtSenhaDCadastroController?.dispose();

    txtSenhaCadastroConfirmaFocusNode?.dispose();
    txtSenhaCadastroConfirmaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
