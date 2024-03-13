import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

class HomeConstants {
  final String txtHome = 'Home';
  final String txtSearchField = 'Search for treatment';
  final String txtViewBooking = 'View Booking Details';
  final String txtRegister = 'Register Now';
  final String txtName = 'Name';
  final String txtNumber = 'Whatsapp Number';
  final String txtAddress = 'Address';
  final String txtLocation = 'Location';
  final String txtBranch = 'Branch';
  final String txtTreatment = 'Treatment';
  final String txtTotalAmount = 'Total Amount';
  final String txtDiscountAmount = 'Discount Amount';
  final String txtAdvanceAmount = 'Advance Amount';
  final String txtBalnceAmount = 'Balance Amount';
  final String txtDate = 'Treatment date';
  final String txtTime = 'Treatment Time';
  final String txtEnterName = 'Enter Your Full Name';
  final String txtWhatsappNumber = 'Enter Your Whatsapp Number';
  final String txtEnterAddress = 'Enter Your Full Address';
  final String txtSave = 'Save';
  final String txtShowBranches = 'Show Branches';
  final String txtShowTreatments = 'Show Treatments';
  final String txtPatientDetails = 'Patient Details';
  final String txtTreatmnts = 'Treatments';
  final String txtBranches = 'Branches';
}

@riverpod
HomeConstants homeConstants(HomeConstantsRef ref) {
  return HomeConstants();
}
