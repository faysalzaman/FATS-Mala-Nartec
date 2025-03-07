import 'package:flutter/material.dart';

class Constant {
  // static String baseUrl = 'http://161.97.172.46:7001/api';
  // static String host = '161.97.172.46';

  // static String baseUrl = "http://gs1ksa.org:7001/api";
  // static String host = 'gs1ksa.org:7001';

  static String baseUrl = "https://mala.fatsme.online/api";
  // static String host = 'mala.fatsme.online';

  static String placeHolderImage =
      "https://www.kpriet.ac.in/asset/frontend/images/nodata.png";

  static Color primaryColor = const Color(0xFF00006A);

  static Future<dynamic> showLoadingDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF00006A),
            strokeWidth: 5,
          ),
        );
      },
    );
  }
}
