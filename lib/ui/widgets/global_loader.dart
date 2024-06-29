import 'package:flutter/material.dart';

class GlobalLoaderWidget extends StatefulWidget {
  const GlobalLoaderWidget({super.key});

  @override
  State<GlobalLoaderWidget> createState() => _GlobalLoaderWidgetState();
}

class _GlobalLoaderWidgetState extends State<GlobalLoaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
        ),
      ),
    );
  }
}
