/// Central place for every user-facing text in Hoteliq.
///
/// Usage: `Text(AppStrings.loginTitle)`
/// For strings with dynamic values, call the method: `AppStrings.welcomeUser('Mahmoud')`
abstract final class AppStrings {
  // ───────────────────────── App ─────────────────────────

  // App branding
  static const String appName = 'Hoteliq';
  static const String appTagline = 'Find your perfect stay, anywhere.';

  // ───────────────────────── Common ─────────────────────────

  // Shared actions and labels used across multiple screens
  static const String seeAll = 'See all';
  static const String readMore = 'Read more. . .';
  static const String readLess = 'Read less';
  static const String perNight = '/night';
  static const String next = 'Next';
  static const String back = 'Back';
  static const String cancel = 'Cancel';
  static const String confirm = 'Confirm';
  static const String save = 'Save';
  static const String done = 'Done';
  static const String retry = 'Try again';
  static const String loading = 'Just a moment...';
  static const String or = 'or';

  // ───────────────────────── Onboarding ─────────────────────────

  // Onboarding / welcome screen
  static const String onboardingTitle = 'Your next getaway starts here';
  static const String onboardingSubtitle =
      'Discover hotels, homestays and apartments handpicked for comfort and value.';
  static const String getStarted = 'Get Started';
  static const String alreadyHaveAccount = 'I already have an account';

  // ───────────────────────── Login ─────────────────────────

  // Login screen
  static const String loginTitle = 'Welcome back';
  static const String loginSubtitle = 'Sign in to pick up your bookings right where you left off.';
  static const String emailLabel = 'Email address';
  static const String emailHint = 'name@example.com';
  static const String passwordLabel = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String forgotPassword = 'Forgot password?';
  static const String loginButton = 'Log In';
  static const String loginWithGoogle = 'Continue with Google';
  static const String noAccountYet = "Don't have an account? ";
  static const String loginSuccess = 'Signed in successfully. Enjoy your stay!';
  static const String loginFailed = 'We couldn\'t sign you in. Please check your details and try again.';

  // ───────────────────────── Sign up ─────────────────────────

  // Sign up screen
  static const String signupTitle = 'Create your account';
  static const String signupSubtitle = 'Join Hoteliq to book faster and save your favorite stays.';
  static const String fullNameLabel = 'Full name';
  static const String fullNameHint = 'e.g. Mahmoud Mohamed';
  static const String phoneLabel = 'Phone number';
  static const String phoneHint = '+20 1X XXXX XXXX';
  static const String confirmPasswordLabel = 'Confirm password';
  static const String confirmPasswordHint = 'Re-enter your password';
  static const String signupButton = 'Create Account';
  static const String agreeToTermsPrefix = 'By signing up, you agree to our ';
  static const String termsOfService = 'Terms of Service';
  static const String andSeparator = ' and ';
  static const String privacyPolicy = 'Privacy Policy';
  static const String haveAccountAlready = 'Already have an account? ';
  static const String signupSuccess = 'Your account is ready. Welcome aboard!';
  static const String signupFailed = 'Something went wrong while creating your account. Please try again.';

  // ───────────────────────── Forgot password ─────────────────────────

  // Forgot password / reset flow
  static const String forgotPasswordTitle = 'Reset your password';
  static const String forgotPasswordSubtitle =
      "Enter the email linked to your account and we'll send you a reset link.";
  static const String sendResetLink = 'Send Reset Link';
  static const String resetLinkSent = 'Check your inbox. A reset link is on its way.';
  static const String backToLogin = 'Back to Log In';

  // ───────────────────────── Form validation ─────────────────────────

  // Validation messages shown under text fields
  static const String fieldRequired = 'This field is required';
  static const String invalidEmail = 'Please enter a valid email address';
  static const String invalidPhone = 'Please enter a valid phone number';
  static const String nameTooShort = 'Name must be at least 3 characters';
  static const String passwordTooShort = 'Password must be at least 8 characters';
  static const String passwordNeedsNumber = 'Password must include at least one number';
  static const String passwordsDontMatch = 'Passwords do not match';

  // ───────────────────────── Bottom navigation ─────────────────────────

  // Bottom navigation bar tabs
  static const String navHome = 'Home';
  static const String navExplore = 'Explore';
  static const String navBookings = 'Bookings';
  static const String navFavorites = 'Favorites';
  static const String navProfile = 'Profile';

  // ───────────────────────── Home ─────────────────────────

  // Home screen: search and category chips
  static const String homeGreeting = 'Where to next?';
  static const String searchHint = 'Search hotels, cities or places';
  static const String categoryHotel = 'Hotel';
  static const String categoryHomestay = 'Homestay';
  static const String categoryApartment = 'Apartment';

  // Home screen: section titles
  static const String nearLocation = 'Near Location';
  static const String popularHotel = 'Popular Hotel';
  static const String mySchedule = 'My Schedule';

  // Home screen: empty states
  static const String noHotelsNearby = 'No stays found near you yet.';
  static const String noScheduleYet = 'Nothing booked yet. Your upcoming trips will appear here.';

  // Home screen: dynamic text
  static String welcomeUser(String name) => 'Hi $name, ready for a getaway?';

  // ───────────────────────── Hotel details ─────────────────────────

  // Hotel details screen: section titles
  static const String description = 'Description';
  static const String preview = 'Preview';
  static const String facilities = 'Facilities';
  static const String location = 'Location';
  static const String reviews = 'Reviews';

  // Hotel details screen: amenities
  static const String freeWifi = 'Free Wifi';
  static const String freeBreakfast = 'Free Breakfast';
  static const String swimmingPool = 'Swimming Pool';
  static const String parking = 'Parking';

  // Hotel details screen: actions
  static const String bookNow = 'Book Now';
  static const String addedToFavorites = 'Added to your favorites';
  static const String removedFromFavorites = 'Removed from your favorites';

  // ───────────────────────── Booking ─────────────────────────

  // Booking screen: date selection
  static const String bookingTitle = 'Book Your Stay';
  static const String selectDates = 'Select your dates';
  static const String checkIn = 'Check-in';
  static const String checkOut = 'Check-out';
  static const String guests = 'Guests';
  static const String rooms = 'Rooms';
  static const String selectDatesError = 'Please choose both check-in and check-out dates';

  // Booking screen: summary
  static const String bookingSummary = 'Booking Summary';
  static const String total = 'Total';
  static const String confirmBooking = 'Confirm Booking';
  static const String bookingConfirmed = 'Your stay is booked!';
  static const String bookingConfirmedMessage = 'We have saved the details in My Schedule. Pack your bags!';

  // Booking screen: dynamic text
  static String nightsCount(int nights) => nights == 1 ? '1 night' : '$nights nights';
  static String guestsCount(int guests) => guests == 1 ? '1 guest' : '$guests guests';

  // ───────────────────────── Schedule ─────────────────────────

  // My schedule / bookings screen
  static const String scheduleTitle = 'My Schedule';
  static const String upcoming = 'Upcoming';
  static const String completed = 'Completed';
  static const String cancelled = 'Cancelled';
  static const String cancelBooking = 'Cancel Booking';
  static const String cancelBookingConfirm = 'Are you sure you want to cancel this booking?';
  static const String bookingCancelled = 'Your booking has been cancelled';

  // ───────────────────────── Favorites ─────────────────────────

  // Favorites screen
  static const String favoritesTitle = 'Favorites';
  static const String noFavorites = 'Tap the heart on any stay to save it here for later.';

  // ───────────────────────── Search & filters ─────────────────────────

  // Search results and filter sheet
  static const String searchResults = 'Search Results';
  static const String noResults = 'No stays match your search';
  static const String noResultsHint = 'Try a different destination or adjust your filters.';
  static const String filters = 'Filters';
  static const String priceRange = 'Price range';
  static const String rating = 'Rating';
  static const String applyFilters = 'Apply Filters';
  static const String resetFilters = 'Reset';
  static const String sortBy = 'Sort by';

  // ───────────────────────── Profile ─────────────────────────

  // Profile screen
  static const String profileTitle = 'My Profile';
  static const String editProfile = 'Edit Profile';
  static const String myBookings = 'My Bookings';
  static const String paymentMethods = 'Payment Methods';
  static const String notifications = 'Notifications';
  static const String settings = 'Settings';
  static const String helpCenter = 'Help Center';
  static const String aboutUs = 'About Hoteliq';
  static const String logout = 'Log Out';
  static const String logoutConfirm = 'Are you sure you want to log out?';

  // ───────────────────────── Settings ─────────────────────────

  // Settings screen
  static const String settingsTitle = 'Settings';
  static const String language = 'Language';
  static const String darkMode = 'Dark mode';
  static const String pushNotifications = 'Push notifications';
  static const String changePassword = 'Change password';
  static const String deleteAccount = 'Delete account';
  static const String deleteAccountWarning = 'This will permanently remove your account and booking history.';

  // ───────────────────────── Errors ─────────────────────────

  // Generic and network errors
  static const String genericError = 'Something went wrong. Please try again.';
  static const String noInternet = 'No internet connection. Check your network and try again.';
  static const String sessionExpired = 'Your session has expired. Please log in again.';
  static const String loadFailed = "We couldn't load this content right now.";
}
