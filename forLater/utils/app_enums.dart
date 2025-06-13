


enum TrialBookingState {
  loading,
  selectingSlot,
  confirming,
  completed, 
}

enum AuthNavState {
  loading,
  landing,
  verifyPhone,
  phoneSecondary,
  emailSecondary,
  basicDetails,
}

enum TrialStatus {
  available,
  limitReached,
  tooManyActiveSessions,
  exists
}

enum AuthMethod {
  apple,
  phone,
  google
}