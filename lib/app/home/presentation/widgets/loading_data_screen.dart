import 'dart:async';

import 'package:body_health/app/home/presentation/screens/home_screen.dart';
import 'package:body_health/core/utils/components.dart';
import 'package:flutter/material.dart';

class loadingData extends StatefulWidget {
  const loadingData({
    Key? key,
  }) : super(key: key);

  @override
  _loadingDataState createState() => _loadingDataState();
}

class _loadingDataState extends State<loadingData> {
  late Timer timer;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  statrDelay() {
    timer =
        Timer(Duration(seconds: 2), () => NavAndFinish(context, HomeScreen())
            // () => router.navigateTo(
            //   context,
            //   '${AppRouts.places_detailesScreenRoute}?index=${widget.index}',
            // ),
            );
  }

  @override
  void initState() {
    super.initState();
    statrDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        body:
            // Center(
            //   child: CircleAvatar(
            //     radius: 70,
            //     backgroundColor: Colors.amber,
            //   ),
            // ),
            Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
