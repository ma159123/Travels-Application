import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trips/models/data_model.dart';

class DataServices {
  static String baseUrl = 'http://mark.bslmeiyu.com/api';

   Future<List<DataModel>> getData() async {
    var apiUrl = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();  //convert to map

      } else {
        return <DataModel>[];
      }
    } catch (error) {
      print(error.toString());
      return <DataModel>[];
    }
  }
}
