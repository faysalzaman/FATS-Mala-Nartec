import 'package:http/http.dart' as http;
import 'package:mala_fats/models/brand_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class GetBrandServices {
  static Future<List<String>> getBrandMethod(String sCode, String mCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    print("Token: $token");

    print("SCode : $sCode");
    print("MCode : $mCode");

    final String url = "${Constant.baseUrl}/getMakeListById";

    print("URL: $url");

    final uri = Uri.parse(url);

    final headers = <String, String>{
      "Authorization": token,
      "Content-Type": "application/json",
    };

    final body = {"TblMakeMainCode": sCode, "tblMajorCode": mCode};

    try {
      var response = await http.post(
        uri,
        headers: headers,
        body: json.encode(body),
      );

      print("Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = json.decode(response.body)["recordset"] as List;

        List<BrandModel> brandList =
            data.map((e) => BrandModel.fromJson(e)).toList();

        for (var brand in brandList) {
          print("Brand: ${brand.tblMakeName}");
        }

        return brandList.map((e) => e.tblMakeName ?? "").toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
