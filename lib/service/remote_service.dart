import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../model/popular_sellers.dart';
import '../model/trending_seller.dart';


class RemoteServices {

  static var client = http.Client();

  static Future<PopularSeller?> Log_in() async {

    var headers = {
      'Accept': 'application/json',
      'lang': 'ar'
    };

    http.Response request = await client.get(Uri.parse('https://documenter.getpostman.com/view/12128834/2s7YYvYh6n'));

    request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    if (request.statusCode == 200) {

      var jsonString = request.body;

      return popularSellerFromJson(jsonString);

    } else {

      //show error message

      return null;

    }
    // Map<String, String> data =response.body
    //
    //
    //
    // if (response.statusCode == 200) {
    //
    //   response.;
    //   print(await response.stream.bytesToString());
    //
    // } else {
    //
    //   print(response.reasonPhrase);
    //
    // }
  }

  static Future<PopularSeller?> fetchPupolar_sellers() async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIx'
          'IiwianRpIjoiM2NjMGI5YTU0NTc0Zjc1NjYzNmE0ZDdlYTI5NmJmNWQ1NTdhZmU0MzljZ'
          'DhjNmE1ODA3Mzk1MTU4YjU2MmIwYjc4YzU0ZTNlOGYxNDZjM2UiLCJpYXQiOjE2MzE3MD'
          'A1MzgsIm5iZiI6MTYzMTcwMDUzOCwiZXhwIjoxNjYzMjM2NTM4LCJzdWIiOiI0Iiwic2N'
          'vcGVzIjpbXX0.sBbbYmRW95gxfOyHHadgGRDlh_j8Zk0OBBEW0jBUgZG1zzNDjnfXO1_1'
          '3yPvT6TSBgg0Py95wpwN7zDqMfI-1myuMJ2zqa6g9AqAEWqDwrfrP-XZpV0HXoycRknFk'
          'KCt3rzVPs05DT864_0fSItpN8MhLsu-P0jbzYSrEWe0OCFglq8Sw2B2N0-wHbNNoreEBE'
          'lvC5nmepnWgVdxuKLi7YcU2VjjT8qOWLuTMbIXjPovXUFhQl6JVry1AOuPsiXRf5Dtm0d'
          '99D8smFmIi7Op9bh6a9iY61EAOGeOz9uUtNJ8enZa92qFGVmUyMDKcO0zGpyUDSOzVGxn'
          'aebfdDipeCCCNnGYtFNgPHv9CWfkYIyNNlAy01ukVOxF3ULZ-BLE2YrJfcu7HwSVHdC_L'
          'U0ACZa29K6kcJU-QJ0Vr5afArqRnB_k-hYWQTcT4FQMIB9XsvnZiFSsaJ_'
          '_7NHvW0AK6mWKVVkepp1X0Nhfl0-IiPDtbHZ0o_Poa0S'
          'sbK_Z7m1bWMq4i9fW_aQ6lJVeekCivIn3EcPltH2EF5HEuhjSqqsk1bq802'
          '5DOI4axoRv-kRp9I2Rl30WbgcH0sKCUbZhtpWnwiQ9-dbh89k6zLIgp7v6b'
          'JgM23W4aemnge1WpEsminyjp3w9f0j7fNT6Ba_ec_LGuNAdVkJoh_AOnb2mK9Q',
      'lang': 'ar',
    };

    // http.Response request = await client.get(Uri.parse('https://yogahez.mountasher.online/api/popular-sellers?lat=29.1931&lng=30.6421&filter=1'));
    var request = http.MultipartRequest('GET', Uri.parse('https://yogahez.mountasher.online/api/popular-sellers?lat=29.1931&lng=30.6421&filter=1'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      // var jsontestString =
      //     '[\r\n'
      //     '{\r\n'
      //     '"lat": 29.1931,'
      //     '"lng": 30.6421,'
      //     '"filter": 1,'
      //     '"name": "family1"'
      //     '}\r\n'
      //     ']\r\n';

      var responseBody = await response.stream.bytesToString();

      // var jsonString = responseBody.b;

      print(responseBody);

      return popularSellerFromJson(responseBody);

    } else {

      //show error message

      return null;

    }

    // Map<String, String> data =response.body
    //
    //
    //
    // if (response.statusCode == 200) {
    //
    //   response.;
    //   print(await response.stream.bytesToString());
    //
    // } else {
    //
    //   print(response.reasonPhrase);
    //
    // }
  }

  static Future<TrendingSeller?> fetchTrending_sellers() async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2NjMGI5YTU0NTc0Zjc1NjYzNmE0ZDdlYTI5NmJmNWQ1NTdhZ'
          'mU0MzljZDhjNmE1ODA3Mzk1MTU4YjU2MmIwYjc4YzU0ZTNlOGYxNDZjM2UiLCJpYXQiOjE2MzE3MDA1MzgsIm5iZiI6MTYzMTcwMDUzOCwiZXhwIjoxNjYzMjM2NTM4LCJ'
          'zdWIiOiI0Iiwic2NvcGVzIjpbXX0.sBbbYmRW95gxfOyHHadgGRDlh_j8Zk0OBBEW0jBUgZG1zzNDjnfXO1_13yPvT6TSBgg0Py95wpwN7zDqMfI-1myuMJ2zqa6g9AqAE'
          'WqDwrfrP-XZpV0HXoycRknFkKCt3rzVPs05DT864_0fSItpN8MhLsu-P0jbzYSrEWe0OCFglq8Sw2B2N0-wHbNNoreEBElvC5nmepnWgVdxuKLi7YcU2VjjT8qOWLuTMbI'
          'XjPovXUFhQl6JVry1AOuPsiXRf5Dtm0d99D8smFmIi7Op9bh6a9iY61EAOGeOz9uUtNJ8enZa92qFGVmUyMDKcO0zGpyUDSOzVGxnaebfdDipeCCCNnGYtFNgPHv9CWfkYI'
          'yNNlAy01ukVOxF3ULZ-BLE2YrJfcu7HwSVHdC_LU0ACZa29K6kcJU-QJ0Vr5afArqRnB_k-hYWQTcT4FQMIB9XsvnZiFSsaJ__7NHvW0AK6mWKVVkepp1X0Nhfl0-IiPDtb'
          'HZ0o_Poa0SsbK_Z7m1bWMq4i9fW_aQ6lJVeekCivIn3EcPltH2EF5HEuhjSqqsk1bq8025DOI4axoRv-kRp9I2Rl30WbgcH0sKCUbZhtpWnwiQ9-dbh89k6zLIgp7v6bJgM'
          '23W4aemnge1WpEsminyjp3w9f0j7fNT6Ba_ec_LGuNAdVkJoh_AOnb2mK9Q',
      'lang': 'ar',
    };

    var request = http.MultipartRequest('GET', Uri.parse('https://yogahez.mountasher.online/api/trending-sellers?lat=29.1931&lng=30.6421&filter=1'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      // var jsontestString =
      //     '[\n'
      //     '{\n'
      //     '"lat": 29.1931,'
      //     '"lng": 30.6421,'
      //     '"filter": 1,'
      //     '"name": "family1"'
      //     '}\n'
      //     ']\n';

      var responseBody = await response.stream.bytesToString();

      // await response.stream.bytesToString();

      var jsonString = jsonDecode(responseBody);

      print(jsonString);

      return trendingSellerFromJson(responseBody);

    } else {

      //show error message
      return null;

    }

  }

  static getcategory() async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzkwYTAw'
          'MjA3ODRlNzk2MDE3NGE2YWY5MDdkMzUwZTAxOTE0NDZjZTQwZTliMDZjNTFkZWZiN2Q4NTBiNzg2YzdmNDIyMjA5ZW'
          'Q1MmRmNTUiLCJpYXQiOjE2Mjk4MTM3NDMsIm5iZiI6MTYyOTgxMzc0MywiZXhwIjoxNjYxMzQ5NzQzLCJzdWIiOiI0'
          'Iiwic2NvcGVzIjpbXX0.Nuw3D7ROTr17Kw0dU5DsDQx-DoA0GibOutevNzbavVXS75xer-wnttPf4-MmP16LL-82sS'
          'WgL0NhjZYRjAUZtiBKlIDvcvlhctdyE4-tKNgpQDhg7dWBpuVZue0BmOvtObiDOl_AeN203E-rSg3pi-8kElkzGvHKa'
          'ALbIjtSAWdCD6pzteYig40eq-Xn1duYlPau3xOSoMsoQrJKEfO99zjacz_vCPBNfWCFQbjXQad72peUmHEVVarOXiwtr'
          'Im6VWjd5vHmzUhjblF40COvgsRI55Cu0D5Q-g2gOZoKQ6hW47sebBjqLemQvfzXSQDCltt_H1Be9U5FN_C8-UWBQXeZN'
          'cXiYaSBJuyaCo-SeO9ZawOhJPlJ62rko5w_uxtj6XbWBt13RlNQmAh8olG3LEnlPtN0axsgDeYS3Sw3c1RfW8M9ApXBT'
          'BhNkSXrS3uH5euU8uD9b-qH8zdf1pvWOvAtMrPck1pD8y-glHMPD79GLfQVrT94'
          'FEjiloDTO9e0iiAgnneGHcfJPYC9XhXHEK1kAMr2595lp0tXfwl9km7sep2Mas3S'
          'dOtneen3BDj0ktFa8-mK4zf3OTtf72iBp2dLz4APcU3kIWHacI5legl79A9NKhj'
          'W0ftkK1rucAanLGGEwjT_NAR5WvlEGhPwcNwb-IB-1S7Fe-Pavrq5C_4',
      'lang': 'en'
    };

    var request = http.MultipartRequest('GET', Uri.parse('https://yogahez.mountasher.online/api/base-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var responseBody = await response.stream.bytesToString();

      var jsonString = jsonDecode(responseBody);

      print(jsonString);

      return mainCategoryFromJson(responseBody);

    } else {

      //show error message

      return null;

    }

    // Map<String, String> data =response.body
    //
    //
    //
    // if (response.statusCode == 200) {
    //
    //   response.;
    //   print(await response.stream.bytesToString());
    //
    // } else {
    //
    //   print(response.reasonPhrase);
    //
    // }


  }

}