import 'package:flutter/material.dart';
import 'package:artifix_app/router/app_router.dart';


void main() {
  runApp(const ArtifixApp());
}

class ArtifixApp extends StatelessWidget {
  const ArtifixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Artifix',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      routeInformationParser: appRouter.routeInformationParser,
      routerDelegate: appRouter.routerDelegate,
      routeInformationProvider: appRouter.routeInformationProvider,
    );
  }
}
