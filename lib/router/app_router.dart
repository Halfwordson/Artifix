import 'package:go_router/go_router.dart';
import '../screens/guest/guest_home_screen.dart';
import '../screens/interest/interest_form_screen.dart';
import '../screens/auth/login_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GuestHomeScreen(),
      ),
      GoRoute(
        path: '/interest-form',
        builder: (context, state) => const InterestFormScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
