import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/features/admin/main/screens/admin_home.dart';
import 'package:reservation_app/src/features/admin/presets/screens/preset_screen.dart';
import 'package:reservation_app/src/features/auth/register/screens/register_screen.dart';
import 'package:reservation_app/src/features/auth/screens/auth_screen.dart';
import 'package:reservation_app/src/features/customer/clubs/screens/club_description_screen.dart';
import 'package:reservation_app/src/features/customer/forgot%20password/screens/forgot_password_screen.dart';
import 'package:reservation_app/src/features/customer/forgot%20password/screens/otp_screen.dart';
import 'package:reservation_app/src/features/customer/forgot%20password/screens/reset_password_screen.dart';
import 'package:reservation_app/src/features/customer/forgot%20password/screens/sucess_screen.dart';
import 'package:reservation_app/src/features/customer/main/screens/main_screen.dart';
import 'package:reservation_app/src/features/customer/notifications/screens/notification_setting_screen.dart';
import 'package:reservation_app/src/features/customer/payment/screens/add_card_screen.dart';
import 'package:reservation_app/src/features/customer/payment/screens/edit_card_screen.dart';
import 'package:reservation_app/src/features/customer/payment/screens/payment_complete.dart';
import 'package:reservation_app/src/features/customer/payment/screens/payment_screen.dart';
import 'package:reservation_app/src/features/customer/profile/screens/edit_profile.dart';
import 'package:reservation_app/src/features/customer/reservations/screens/reservation_screen.dart';
import 'package:reservation_app/src/features/customer/settings/screens/help_support_screen.dart';
import 'package:reservation_app/src/features/customer/settings/screens/password_setting_screen.dart';
import 'package:reservation_app/src/features/customer/settings/screens/terms_condition_screen.dart';
import 'package:reservation_app/src/features/customer/tables/screens/table_description_screen.dart';
import 'package:reservation_app/src/features/customer/tables/screens/table_screen.dart';
import 'package:reservation_app/src/features/onboarding/screens/complete_profile_screen.dart';
import 'package:reservation_app/src/features/super%20admin/main/screens/super_admin_home.dart';
import '../../features/auth/login/screens/login_screen.dart';
import '../../features/customer/chat/screens/chat_screen.dart';
import '../../features/customer/clubs/screens/club_screen.dart';
import '../../features/customer/settings/screens/settings_screen.dart';
import 'package:reservation_app/src/features/admin/clubs/screens/manage_clubs_screen.dart';
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth_screen',
    routes: [
      GoRoute(
        path: '/auth_screen',
        builder: (context, state) {
          return const AuthScreen();
        },
      ),GoRoute(
        path: '/ManageClubsScreen',
        builder: (context, state) {
          return const ManageClubsScreen();
        },
      ),
      GoRoute(
        path: '/login_screen',
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register_screen',
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/complete_profile_screen',
        builder: (context, state) {
          return const CompleteProfileScreen();
        },
      ),
      GoRoute(
        path: '/forgot_password_screen',
        builder: (context, state) {
          return const ForgotPasswordScreen();
        },
      ),
      GoRoute(
        path: '/otp_screen',
        builder: (context, state) {
          return const OTPScreen();
        },
      ),
      GoRoute(
        path: '/reset_password_screen',
        builder: (context, state) {
          return const ResetPasswordScreen();
        },
      ),
      GoRoute(
        path: '/success_screen',
        builder: (context, state) {
          return const SuccessScreen();
        },
      ),
      GoRoute(
        path: '/main_screen',
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        path: '/reservation_screen',
        builder: (context, state) {
          return const ReservationScreen();
        },
        //page builder with transition
      ),
      GoRoute(
        path: '/club_screen',
        builder: (context, state) {
          return const ClubScreen();
        },
      ),
      GoRoute(
        path: '/tables_screen',
        builder: (context, state) {
          return const TableScreen();
        },
      ),
      // GoRoute(
      //   path: '/table_description_screen',
      //   builder: (context, state) {
      //     //decode extra data
      //     return TableDescriptionScreen(
      //     );
      //   },
      // ),
      GoRoute(
        path: '/club_description_screen',
        builder: (context, state) {
          return const ClubDescriptionScreen();
        },
      ),
      GoRoute(
        path: '/payment_screen',
        builder: (context, state) {
          return const PaymentScreen();
        },
      ),
      GoRoute(
        path: '/add_card_screen',
        builder: (context, state) {
          return const AddCardScreen();
        },
      ),
      GoRoute(
        path: '/edit_card_screen',
        builder: (context, state) {
          return const EditCardScreen();
        },
      ),
      GoRoute(
        path: '/payment_complete_screen',
        builder: (context, state) {
          return const PaymentCompleteScreen();
        },
      ),
      GoRoute(
        path: '/settings_screen',
        builder: (context, state) {
          return const SettingScreen();
        },
      ),
      GoRoute(
        path: '/edit_profile_screen',
        builder: (context, state) {
          return const EditProfileScreen();
        },
      ),
      GoRoute(
        path: '/notification_setting_screen',
        builder: (context, state) {
          return const NotificationSettingScreen();
        },
      ),
      GoRoute(
        path: '/help_support_screen',
        builder: (context, state) {
          return const HelpSupportScreen();
        },
      ),
      GoRoute(
        path: '/terms_conditions_screen',
        builder: (context, state) {
          return const TermsConditionScreen();
        },
      ),
      GoRoute(
        path: '/change_password_screen',
        builder: (context, state) {
          return const PasswordSettingScreen();
        },
      ),
      GoRoute(
        path: '/admin_main_screen',
        builder: (context, state) {
          return const AdminMainScreen();
        },
      ),
      GoRoute(
        path: '/table_presets_screen',
        builder: (context, state) {
          return const ManagePresetScreen();
        },
      ),
      GoRoute(
        path: '/super_admin_main_screen',
        builder: (context, state) {
          return const SuperAdminHome();
        },
      ),
      GoRoute(
        path: '/chat_screen',
        builder: (context, state) {
          return const ChatScreen();
        },
      ),
    ],
  );
}
