import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/services/revenuecat_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ffwelfbcuwvzichpgneq.supabase.co',
    anonKey: 'sb_publishable_EQoAnL4cVCEwTfrb4UJREw_cBlhyOAS',
  );

  await RevenueCatService.initialize();

  runApp(const NifunzeApp());
}

class NifunzeApp extends StatelessWidget {
  const NifunzeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nifunze',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
