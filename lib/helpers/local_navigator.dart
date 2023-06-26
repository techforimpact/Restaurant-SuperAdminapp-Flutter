
import 'package:flutter/cupertino.dart';

import '../constants/controller.dart';
import '../routing/router.dart';
import '../routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: DashboardPageRoute,
    );
