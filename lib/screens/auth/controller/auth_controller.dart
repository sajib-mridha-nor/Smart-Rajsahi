import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rcc/models/login_response.dart';
import 'package:rcc/models/profile_response.dart';
import 'package:rcc/screens/auth/login/login_page.dart';
import 'package:rcc/screens/auth/register/verify_otp_page.dart';
import 'package:rcc/screens/auth/reset_password/reset_password_page.dart';
import 'package:rcc/screens/profile/create/profile_create_page.dart';
import 'package:rcc/utils/constants.dart';
import 'package:rcc/utils/extensitons.dart';
import 'package:rcc/utils/network/dio_client.dart';
import 'package:rcc/utils/network/network_exceptions.dart';

class AuthController extends GetxController {

  final DioClient? _dioClient = DioClient(BASE_URL, dio.Dio());
  final _box = GetStorage();

  RxBool loginLoading = false.obs;
  RxBool sendOtpLoading = false.obs;
  RxBool verifyOtpLoading = false.obs;
  RxBool forgotPasswordLoading = false.obs;
  RxBool resetPasswordLoading = false.obs;


  void resetPassword(mobile, otp, password) async {
    try{
      resetPasswordLoading(true);
      //api
      dio.FormData formData = dio.FormData.fromMap({
        "username ": mobile,
        "password": password,
        "otp": otp,
      });
      final response = await _dioClient?.post("/api/v1/auth/password/reset/?username=$mobile", data: formData);
      successToast("পাসওয়ার্ড রিসেট সফল হয়েছে", "এই পাসওয়ার্ড খুব সাধারণ. অন্য পাসওয়ার্ড টাইপ করুন");
      Get.off(()=> const LoginPage());
      resetPasswordLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      //error parser
      if(message == "Unauthorised request"){
        errorSnackbar("দুঃখিত!", "এই সদস্যনামে কোনো সদস্য নেই।");
      }else{
        errorSnackbar("দুঃখিত!", message);
      }
      resetPasswordLoading(false);
    }
  }

  void forgotPassword(mobile) async {
    try{
      forgotPasswordLoading(true);
      //api
      final response = await _dioClient?.get("/api/v1/auth/password/reset/?username=$mobile");
      successToast("ওটিপি পাঠানো হয়েছে", "অনুগ্রহ করে আপনার ফোন নম্বর চেক করুন");
      forgotPasswordLoading(false);
      Get.to(()=> ResetPasswordPage(mobile: mobile));
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      //checking if user already exist
      if(message == "Unauthorised request"){
        errorSnackbar("দুঃখিত!", "এই সদস্যনামে কোনো সদস্য নেই।");
      }else{
        errorSnackbar("দুঃখিত!", message);
      }

      forgotPasswordLoading(false);
    }
  }
  void login(mobile, password) async {
    try{
      loginLoading(true);

      dio.FormData formData = dio.FormData.fromMap({
        "username": mobile,
        "password": password,
      });
      final response = await _dioClient?.post("/api/v1/auth/login/", data: formData);
      final loginResponse = LoginResponse.fromJson(response);
      
      //save token
      _box.write("token", loginResponse.token);
      _box.write("user", loginResponse.user);
      _box.write("expires", loginResponse.expires);

      //check if profile complete
      final profileRes = await _dioClient?.get("/api/v1/auth/user/");
      final profileResponse = ProfileResponse.fromJson(profileRes);
      _box.write("profile", profileRes);
      if(profileResponse.isCompletedProfile == true){
        //go to home page
      }else{
        //go to create profile page
        Get.offAll(()=> const ProfileCreatePage());
      }
      //check if profile complete
      successToast("স্বাগতম", "লগইন সফল");
      loginLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      loginLoading(false);
    }
  }

  void sendOtp(mobile) async {
    try{
      sendOtpLoading(true);
      //api
      final response = await _dioClient?.get("/api/v1/auth/register/?username=$mobile");
      successToast("ওটিপি পাঠানো হয়েছে", "অনুগ্রহ করে আপনার ফোন নম্বর চেক করুন");
      Get.to(() => VerifyOtpPage(mobile: mobile));
      sendOtpLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);
      errorSnackbar("দুঃখিত!", message);
      sendOtpLoading(false);
    }
  }

  void verifyOtp(mobile, otp, password) async {
    try{
      verifyOtpLoading(true);
      //api
      dio.FormData formData = dio.FormData.fromMap({
        "username ": mobile,
        "password": password,
        "otp": otp,
      });
      final response = await _dioClient?.post("/api/v1/auth/register/?username=$mobile", data: formData);
      successToast("রেজিস্ট্রেশন সফল হয়েছে", "এখন লগইন আপনার ফোন এবং পাসওয়ার্ড দিয়ে লগইন করুন");
      Get.off(()=> const LoginPage());
      verifyOtpLoading(false);
    }catch(e){
      var error = NetworkExceptions.getDioException(e);
      var message = NetworkExceptions.getErrorMessage(error);

      //checking if user already exist
      if(message == "Unauthorised request"){
        errorSnackbar("দুঃখিত!", "এই সদস্যনামে একজন সদস্য আছেন।");
      }else{
        errorSnackbar("দুঃখিত!", message);
      }
      verifyOtpLoading(false);
    }
  }
}