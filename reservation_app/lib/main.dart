import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/routes/app_router.dart';
import 'package:reservation_app/src/core/utils/theme/app_theme.dart';
import 'package:reservation_app/src/features/admin/dashboard/providers/dashboard_provider.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';
import 'package:reservation_app/src/features/admin/presets/providers/preset_provider.dart';
import 'package:reservation_app/src/features/admin/reservation/providers/manage_reservation_provider.dart';
import 'package:reservation_app/src/features/admin/scoreboard/providers/manage_scoreboard_provider.dart';
import 'package:reservation_app/src/features/admin/tables/providers/manage_tables_provider.dart';
import 'package:reservation_app/src/features/auth/login/providers/login_provider.dart';
import 'package:reservation_app/src/features/customer/chat/providers/chat_provider.dart';
import 'package:reservation_app/src/features/customer/clubs/provider/customer_club_provider.dart';
import 'package:reservation_app/src/features/customer/explore/providers/explore_provider.dart';
import 'package:reservation_app/src/features/customer/main/providers/main_provider.dart';
import 'package:reservation_app/src/features/customer/profile/providers/profile_provider.dart';
import 'package:reservation_app/src/features/customer/scoreboard/providers/scoreboard_provider.dart';
import 'package:reservation_app/src/features/customer/tables/providers/tables_provider.dart';
import 'package:reservation_app/src/features/onboarding/providers/complete_profile_provider.dart';
import 'package:reservation_app/src/features/super%20admin/admins/providers/admin_provider.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/providers/manage_clubs_provider.dart';
import 'src/features/admin/clubs/providers/manage_clubs_provider.dart';
import 'src/features/auth/register/providers/register_provider.dart';
import 'src/features/customer/payment/providers/add_card_provider.dart';
import 'src/features/customer/reservations/providers/reservation_provider.dart';
import 'src/features/customer/tables/providers/table_description_provider.dart';
import 'src/features/super admin/main/providers/super_admin_main_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CompleteProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerClubsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReservationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExploreProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TableDescriptionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddCardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminManageScoreboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScoreboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminMainProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ManageTablesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClubProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ManageReservationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PresetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SuperAdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ManageClubProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerTablesProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.scaffoldBackgroundColor,
    ));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
