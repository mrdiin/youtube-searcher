import '/backend/api_requests/api_calls.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for userSearchText widget.
  TextEditingController? userSearchTextController;
  String? Function(BuildContext, String?)? userSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (Search YouTube)] action in userSearchText widget.
  ApiCallResponse? searchResultsUserSearch;
  // Model for LoadingAnimation component.
  late LoadingAnimationModel loadingAnimationModel;
  // Stores action output result for [Backend Call - API (Search YouTube)] action in IconButton widget.
  ApiCallResponse? searchResults;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingAnimationModel = createModel(context, () => LoadingAnimationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    userSearchTextController?.dispose();
    loadingAnimationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
