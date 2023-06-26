import 'package:flutter/material.dart';


import '../pages/booking/booking_page.dart';
import '../pages/myAccount/myAccount.dart';
import '../pages/orders/orders.dart';
import '../pages/overview/overview.dart';
import '../pages/product/product_page.dart';
import '../pages/reports/reports.dart';
import '../pages/reviews/reviews.dart';
import 'routes.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardPageRoute:
      return _getPageRoute(const OverviewPage());
    case OrdersPageRoute:
      return _getPageRoute(const OrderPage());

    case ProductPageRoute:
      return _getPageRoute(const ProductPage());
    case BookingPageRoute:
      return _getPageRoute(const BookingPage());


    case ReviewsPageRoute:
      return _getPageRoute(const ReviewsPage());
    case AccountsPageRoute:
      return _getPageRoute(AccountsPage());

    case ReportsPageRoute:
      return _getPageRoute(const ReportsPage());

    default:
      return _getPageRoute(const OverviewPage());
  }
}

Route<dynamic>? _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
