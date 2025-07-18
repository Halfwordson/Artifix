import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/auth/login_screen.dart';
import '../screens/guest/guest_home_screen.dart';
import '../screens/interest/interest_list_screen.dart';
import '../screens/booking/add_booking_screen.dart';
import '../screens/user/user_home_screen.dart'; // Se till att denna fil finns

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const GuestHomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/add-booking',
      builder: (context, state) => const AddBookingScreen(),
    ),
    GoRoute(
      path: '/user-home',
      builder: (context, state) => const UserHomeScreen(),
    ),
    GoRoute(
      path: '/interests',
      builder: (context, state) => const InterestListScreen(),
    ),
  ],
);
