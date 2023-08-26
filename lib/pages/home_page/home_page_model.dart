import 'package:flutter/material.dart';

import '/backend/api_requests/api_calls.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';

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
