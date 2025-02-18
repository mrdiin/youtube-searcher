import '/backend/api_requests/api_calls.dart';
import '/components/loading_animation_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for userSearchText widget.
  FocusNode? userSearchTextFocusNode;
  TextEditingController? userSearchTextTextController;
  String? Function(BuildContext, String?)?
      userSearchTextTextControllerValidator;
  // Stores action output result for [Backend Call - API (Search YouTube API)] action in userSearchText widget.
  ApiCallResponse? searchResultsUserSearch;
  // Model for LoadingAnimation component.
  late LoadingAnimationModel loadingAnimationModel;
  // Stores action output result for [Backend Call - API (Search YouTube API)] action in IconButton widget.
  ApiCallResponse? searchResults;

  @override
  void initState(BuildContext context) {
    loadingAnimationModel = createModel(context, () => LoadingAnimationModel());
  }

  @override
  void dispose() {
    userSearchTextFocusNode?.dispose();
    userSearchTextTextController?.dispose();

    loadingAnimationModel.dispose();
  }
}
