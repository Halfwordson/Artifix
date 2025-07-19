import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'router/app_router.dart'; // ← aktivera GoRouter igen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ArtifixApp());
}

class ArtifixApp extends StatelessWidget {
  const ArtifixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Artifix',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, // ← använd vår router
    );
  }
}
