// ignore_for_file: constant_identifier_names

const RootRoute = "/";

const DashboardPageDisplayName = 'Dashboard';
const DashboardPageRoute = '/dashboard';

const OrdersPageDisplayName = 'Orders';
const OrdersPageRoute = '/order';



const ProductPageDisplayName = 'Product';
const ProductPageRoute = '/product';

const BookingPageDisplayName = 'Booking';
const BookingPageRoute = '/booking';


const ReviewsPageDisplayName = 'Review';
const ReviewsPageRoute = '/review';

const AccountsPageDisplayName = 'My Account';
const AccountsPageRoute = '/account';



const ReportsPageDisplayName = 'Report';
const ReportsPageRoute = '/report';

const AuthenticationDisplayName = 'Log Out';
const AuthenticationPageRoute = '/auth';

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(DashboardPageDisplayName, DashboardPageRoute),
  MenuItem(OrdersPageDisplayName, OrdersPageRoute),

  MenuItem(ProductPageDisplayName, ProductPageRoute),
  
  MenuItem(BookingPageDisplayName, BookingPageRoute),

  MenuItem(ReviewsPageDisplayName, ReviewsPageRoute),
  MenuItem(AccountsPageDisplayName, AccountsPageRoute),

  MenuItem(ReportsPageDisplayName, ReportsPageRoute),
  MenuItem(AuthenticationDisplayName, AuthenticationPageRoute),
];
