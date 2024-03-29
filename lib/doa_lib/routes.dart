import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:doa/doa_lib/pages/account_type.dart';
import 'package:doa/doa_lib/pages/face_and_selfie_verification.dart';
import 'package:doa/doa_lib/pages/input_phone_number.dart';
import 'package:doa/doa_lib/pages/ktp_registration.dart';
import 'package:doa/doa_lib/pages/onboarding.dart';
import 'package:doa/doa_lib/pages/opening_account.dart';
import 'package:doa/doa_lib/pages/opening_tnc.dart';
import 'package:doa/doa_lib/pages/preregister.dart';
import 'package:doa/doa_lib/pages/registration_form.dart';
import 'package:doa/doa_lib/pages/registration_form_job_detail.dart';
import 'package:doa/doa_lib/pages/registration_form_office_branch.dart';
import 'package:doa/doa_lib/pages/registration_form_private.dart';
import 'package:doa/doa_lib/pages/take_camera_ktp.dart';

enum ROUTE {
  onBoarding,
  preRegister,
  openingAccount,
  openingTnc,
  inputPhoneNumber,
  accountType,
  ktpRegistration,
  takeCameraKtp,
  registrationForm,
  registrationFormPrivate,
  registrationFormJobDetail,
  registrationFormOfficeBranch,
  faceAndSelfieVerification,
  selfieAndKtpVerification,
}

extension Page on ROUTE {
  String get name {
    switch (this) {
      case ROUTE.onBoarding:
        return '/';
      case ROUTE.preRegister:
        return '/preRegister';
      case ROUTE.openingAccount:
        return '/openingAccount';
      case ROUTE.openingTnc:
        return '/openingTnc';
      case ROUTE.inputPhoneNumber:
        return '/inputPhoneNumber';
      case ROUTE.accountType:
        return '/accountType';
      case ROUTE.ktpRegistration:
        return '/ktpRegistration';
      case ROUTE.takeCameraKtp:
        return '/takeCameraKtp';
      case ROUTE.registrationForm:
        return '/registrationForm';
      case ROUTE.registrationFormPrivate:
        return '/registrationFormPrivate';
      case ROUTE.registrationFormJobDetail:
        return '/registrationFormJobDetail';
      case ROUTE.registrationFormOfficeBranch:
        return '/registrationFormOfficeBranch';
      case ROUTE.faceAndSelfieVerification:
        return '/faceAndSelfieVerification';
      default:
        return "";
    }
  }
}

List<GetPage> get routePage {
  return [
    GetPage(name: ROUTE.onBoarding.name, page: () => OnBoarding()),
    GetPage(name: ROUTE.preRegister.name, page: () => const PreRegister()),
    GetPage(
        name: ROUTE.openingAccount.name, page: () => const OpeningAccount()),
    GetPage(name: ROUTE.openingTnc.name, page: () => OpeningTnc()),
    GetPage(name: ROUTE.inputPhoneNumber.name, page: () => InputPhoneNumber()),
    GetPage(name: ROUTE.accountType.name, page: () => AccountType()),
    GetPage(name: ROUTE.ktpRegistration.name, page: () => KtpRegistration()),
    GetPage(name: ROUTE.takeCameraKtp.name, page: () => TakeCameraKtp()),
    GetPage(name: ROUTE.registrationForm.name, page: () => RegistrationForm()),
    GetPage(
        name: ROUTE.registrationFormPrivate.name,
        page: () => RegistrationFormPrivate()),
    GetPage(
        name: ROUTE.registrationFormJobDetail.name,
        page: () => RegistrationFormJobDetail()),
    GetPage(
        name: ROUTE.registrationFormOfficeBranch.name,
        page: () => RegistrationFormOfficeBranch()),
    GetPage(
        name: ROUTE.faceAndSelfieVerification.name,
        page: () => FaceAndAndSelfieVerication()),
  ];
}
