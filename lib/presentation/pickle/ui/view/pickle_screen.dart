import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maeumgagym_flutter/presentation/pickle/view_model/web_view_controller_state_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PickleScreen extends StatelessWidget {
  const PickleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebViewControllerStateCubit, WebViewController>(
      builder: (_, state) {
        return Scaffold(
          body: SafeArea(
            child: WebViewWidget(
              controller: state,
            ),
          ),
        );
      },
    );
  }
}
