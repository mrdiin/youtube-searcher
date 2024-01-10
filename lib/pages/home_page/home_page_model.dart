import 'package:flutter/material.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Search YouTube)] action in HomePage widget.
  ApiCallResponse? initialSearchResults;
  // Stores action output result for [Backend Call - API (Search YouTube)] action in Container widget.
  ApiCallResponse? refinementSearchItems;
  // Model for LoadingAnimation component.
  late LoadingAnimationModel loadingAnimationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingAnimationModel = createModel(context, () => LoadingAnimationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingAnimationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
