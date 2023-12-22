class signupwithemailpasswordfailure implements Exception {
  final String message;

  signupwithemailpasswordfailure([this.message = "unknown error occured"]);

  factory signupwithemailpasswordfailure.Code(String code) {
    switch (code) {
      case "email-already-in-use":
        return signupwithemailpasswordfailure("Email already in use");
      case "invalid-email":
        return signupwithemailpasswordfailure("Invalid email address");
      case "operation-not-allowed":
        return signupwithemailpasswordfailure("Operation not allowed");
      case "weak-password":
        return signupwithemailpasswordfailure("Weak password");
      default:
        return signupwithemailpasswordfailure();
    }
  }
}