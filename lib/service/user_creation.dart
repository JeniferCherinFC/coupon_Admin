
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/global_variable.dart';
import '../constant/headers.dart';
import '../constant/utilities.dart';
import '../pages/password.dart';

class UserCreateAd{


  Future<void> createuser({
    required String? mobileNumber,
   required String? name,
   required String? email,
   required String? branch,
   required String? location,
   required String? address,
   required String? city,
   required String? state,
   required String? pincode,
   required String? country,
   required String? sDate,
   required String? eDate,
   required String? paymentMode,
   required String? amountPaid,
   required String? createdBy,
   required int? isBreakfast,
   required int? isDinner,
   required int? isLunch,
    required context,
  }) async {
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/usercreation';


    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String ? cname = prefs.getString("name");
    // Create a FormData object

    FormData formData = FormData.fromMap({
      'phone_number':mobileNumber,
      'name':name,
      'email':email,
      'customerbranch':branch,
      'location':location,
      'address':address,
      'city':city,
      'state':state,
      'pincode':pincode,
      'country':country,
      'startdate':sDate,
      'enddate':eDate,
      'paymentmode':paymentMode,
      'amountpaid':amountPaid,
      'createdby':createdBy,
      'isBreakfast':isBreakfast,
      'isDinner':isDinner,
      'isLunch':isLunch,

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

   print(mobileNumber);
   print(name);
    print(email);
    print(branch);
   print(location);
   print(address);
   print(city);
   print(state);
    print(pincode);
   print(country);
   print(sDate);
 print(eDate);
   print(paymentMode);
   print(amountPaid);
   print(createdBy);
    print(isBreakfast);
  print(isDinner);
  print(isLunch);








    if (response.statusCode == 200  ) {
      // Handle a successful response

      if(response.data['status']== "1") {

        print('API response: ${response.data}');
        var message=response.data['response'];
        var message_two=message['data'];

          print(message_two);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
             Password(password:message_two.toString()), // Replace with your actual profile page
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

