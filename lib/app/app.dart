import 'package:ecommerce_app/views/home/homeview.dart';
import 'package:ecommerce_app/views/screens/loginview.dart';
import 'package:ecommerce_app/views/screens/signupview.dart';
import 'package:ecommerce_app/views/startup/onboardingview.dart';
import 'package:ecommerce_app/views/startup/splashscreen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: OnboardingPage),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
