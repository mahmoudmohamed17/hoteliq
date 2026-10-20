enum AppFlowState {
  /// User is not authenticated and needs to log in.
  login,

  /// User is authenticated and should land on home.
  home,
}
