import 'package:flutter/material.dart';

class LoaderUtils {
  late BuildContext context;

  LoaderUtils(this.context);

  Future<void> showLoader(bool showLoader) async {
    if (showLoader) {
      await _startLoading();
    } else {
      await _stopLoading();
    }
  }

  Future<void> _startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }

  Future<void> _stopLoading() async {
    Navigator.of(context).pop();
  }
// temporary hided
// Future<void> showError(Object? error) async {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       action: SnackBarAction(
//         label: 'Dismiss',
//         onPressed: () {
//           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         },
//       ),
//       backgroundColor: Colors.red,
//       content: Text(),
//     ),
//   );
// }
}
