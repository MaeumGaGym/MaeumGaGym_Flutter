import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewControllerStateCubit extends Cubit<WebViewController> {
  WebViewControllerStateCubit() : super(
      WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse("https://maeumgagym-webview.xquare.app/"))
  );
}