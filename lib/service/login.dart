
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/global_variable.dart';
import '../constant/headers.dart';
import '../constant/utilities.dart';
import '../pages/create_user.dart';

class Login{


  Future<void> login({

    required String ? mobileNumber,
    required String ? password,
    required context,
  }) async {
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/adlogin';


    // Create a FormData object

    FormData formData = FormData.fromMap({
      'phone_number':mobileNumber,
      'password':password,

    });

    print(apiUrl);

    Dio dio = Dio();
    Response response = await dio.post(
      apiUrl,
      data: formData,
      options: Options(
        headers:ApplicationHeader,
      ),
    );


    if (response.statusCode == 200  ) {
      // Handle a successful response

      if(response.data['status']== "1") {

        print('API response: ${response.data}');
        var message=response.data['response'];

        var message_two=message['data'];


        SharedPreferences prefs = await SharedPreferences.getInstance();
        var adminId= message_two['adminid'];
        var phoneNumber= message_two['phone'];
        var branch =message_two['branchcode'];
        var name =message_two['username'];

        await prefs.setString("adminId", "$adminId");
        await prefs.setString("mobileNumber", "$phoneNumber");
        await prefs.setString("branchCode", "$branch");
        await prefs.setString("branchCode", "$name");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
            const CreateUser(), // Replace with your actual profile page
          ),
        );



      }else{
        showCustomSnackBar(
          context: context,
          text:response.data['response'].toString(),
        );
      }

    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }
  }

}

