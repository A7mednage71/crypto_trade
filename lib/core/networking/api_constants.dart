class ApiConstants {
  static const String apiBaseUrl = 'https://elshamypharmacies.com/api/';
  static const String contentType = 'content-type';
  static const String accept = 'Accept';
  static const String authorization = 'Authorization';
  static const String language = 'locale';

  static const String register = 'register';
  static const String verify = 'verify';
  static const String login = 'login';
  static const String forgetPassword = 'forget-password';
  static const String resetPassword = 'reset-password';
  static const String profile = 'profile-info';
  static const String logout = 'logout';
  static const String deleteAccount = 'delete-account';
  static const String homeData = 'home_data';
  static const String getProducts = 'products';
  static const String filterProducts = 'filter-products';

  // favorites
  static const String addFavorite = 'add-to-favourites';
  static const String removeFavorite = 'delete-from-favourites';
  static const String getFavorites = 'my-favourites';

  // cart
  static const String addToCart = 'add-to-cart';
  static const String getCart = 'show-cart';
  static const String removeFromCart = 'delete-cart';
  static const String updateCart = 'edit-cart';

  // edit user data
  static const String editPersonalInfo = 'change-personal-info';
  static const String changePassword = 'change-password';

  // notifications
  static const String getNotifications = 'my-notifications';
  static const String readNotification = 'mark-notifications-read';

  // medicines reminder
  static const String getReminders = 'my-reminders';
  static const String addReminder = 'add-reminder';
  static const String deleteReminder = 'delete-reminder';
  static const String updateReminder = 'edit-reminder';

  // addresses
  static const String getAddresses = 'my-addresses';
  static const String addAddress = 'add-address';
  static const String deleteAddress = 'delete-address';
  static const String updateAddress = 'edit-address';
  static const String getCities = 'cities';
  static const String getAreas = 'areas';

  // pescriptions
  static const String getPrescriptions = 'my-prescriptions';
  static const String addPrescription = 'add-prescription';
  static const String deletePrescription = 'delete-prescription';
  static const String updatePrescription = 'edit-prescription';

  // orders
  static const String getOrders = 'my-orders';
  static const String orderInfo = 'order-info';
  static const String cancelOrder = 'cancel-order';

  // points
  static const String getMyPoints = 'my-points';

  // checkout
  static const String makeOrder = 'make-order';
  static const String couponDiscount = 'coupon-discount';
  static const String checkoutInfo = 'checkout-info';

  // monthly subscriptions
  static const String getSubscriptions = 'my-subscription';
  static const String addSubscription = 'add-subscription';
  static const String editSubscription = 'edit-subscription';
  static const String suspendSubscription = 'suspend-subscription';
  static const String reactivateSubscription = 'reactivate-subscription';
  static const String deleteSubscription = 'delete-subscription';
}
