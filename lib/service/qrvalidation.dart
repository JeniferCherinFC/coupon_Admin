
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/global_variable.dart';
import '../constant/headers.dart';
import '../constant/utilities.dart';
import '../pages/alreadyclaimed.dart';
import '../pages/create_user.dart';
import '../pages/successclaim.dart';

class QrValidation{


  Future<void> qrvalid({

    required String ? qrId,
    required String ? branch,
    required String ? user,
    required String ? adminId,
    required context,
  }) async {
    // Define the URL of your API endpoint
    final String apiUrl = '$baseUrl/qrUpdate';


    // Create a FormData object

    FormData formData = FormData.fromMap({
      'qr_id': qrId,
      'claimed_branch': branch,
      'admin_user': user,
      'admin_id': adminId,

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

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  SuccessClaim(mess:message),
          ),
        );


      }else{
        var ermessage=response.data['response'];
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  Notclaimed(mess:ermessage),
          ),
        );

      }

    } else {
      // Handle errors here
      print('API request failed with status code ${response.statusCode}');
    }
  }

}

