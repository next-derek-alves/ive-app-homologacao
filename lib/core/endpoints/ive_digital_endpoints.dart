import 'package:ivedigital/core/config_env.dart';

class IveDigitalEndpoints {
  static String login() => ConfigEnv.apiUrl + "/login";

  static String storeAccount() => ConfigEnv.apiUrl + "/store";

  static String getAllCourses() => ConfigEnv.apiUrl + "/all-courses";

  static String allInfoCourse(slug) =>
      ConfigEnv.apiUrl + "/course/all-info/$slug";

  static String paymentInfo(id) =>
      ConfigEnv.apiUrl + "/course/payment-info/$id";

  static String progressCourse() => ConfigEnv.apiUrl + "/course/progress-state";
}
