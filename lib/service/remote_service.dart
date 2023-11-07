import 'package:http/http.dart' as http;

import '../model/category.dart';
import '../model/popular_sellers.dart';
import '../model/trending_seller.dart';


class RemoteServices {

  static var client = http.Client();

  static Future<List<PopularSeller>?> fetchPupolar_sellers() async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2NjMGI5YTU0NTc0Zjc1NjYzNmE0ZDdlYTI5NmJmNWQ1NTdhZmU0Mzlj'
          'ZDhjNmE1ODA3Mzk1MTU4YjU2MmIwYjc4YzU0ZTNlOGYxNDZjM2UiLCJpYXQiOjE2MzE3MDA1MzgsIm5iZiI6MTYzMTcwMDUzOCwiZXhwIjoxNjYzMjM2NTM4LCJzdWIiOiI0Iiwic'
          '2NvcGVzIjpbXX0.sBbbYmRW95gxfOyHHadgGRDlh_j8Zk0OBBEW0jBUgZG1zzNDjnfXO1_13yPvT6TSBgg0Py95wpwN7zDqMfI-1myuMJ2zqa6g9AqAEWqDwrfrP-XZpV0HXoycRk'
          'nFkKCt3rzVPs05DT864_0fSItpN8MhLsu-P0jbzYSrEWe0OCFglq8Sw2B2N0-wHbNNoreEBElvC5nmepnWgVdxuKLi7YcU2VjjT8qOWLuTMbIXjPovXUFhQl6JVry1AOuPsiXRf5D'
          'tm0d99D8smFmIi7Op9bh6a9iY61EAOGeOz9uUtNJ8enZa92qFGVmUyMDKcO0zGpyUDSOzVGxnaebfdDipeCCCNnGYtFNgPHv9CWfkYIyNNlAy01ukVOxF3ULZ-BLE2YrJfcu7HwSVH'
          'dC_LU0ACZa29K6kcJU-QJ0Vr5afArqRnB_k-hYWQTcT4FQMIB9XsvnZiFSsaJ__7NHvW0AK6mWKVVkepp1X0Nhfl0-IiPDtbHZ0o_Poa0SsbK_Z7m1bWMq4i9fW_aQ6lJVeekCivIn'
          '3EcPltH2EF5HEuhjSqqsk1bq8025DOI4axoRv-kRp9I2Rl30WbgcH0sKCUbZhtpWnwiQ9-dbh89k6zLIgp7v6bJgM23W4aemnge1WpEsminyjp3w9f0j7fNT6Ba_ec_LGuNAdVkJoh'
          '_AOnb2mK9Q',
      'lang': 'ar',
    };

    http.Response request = await client.get(Uri.parse('http://yogahez.fatoorah.sa/api/popular-sellers?lat=29.1931&lng=30.6421&filter=1'));

    request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    if (request.statusCode == 200) {

      // var jsontestString =
      //     '[\r\n'
      //     '{\r\n'
      //     '"lat": 29.1931,'
      //     '"lng": 30.6421,'
      //     '"filter": 1,'
      //     '"name": "family1"'
      //     '}\r\n'
      //     ']\r\n';

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

  static Future<List<TrendingSeller>?> fetchTrending_sellers() async {

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

    http.Response request = await client.get(Uri.parse('http://yogahez.fatoorah.sa/api/trending-sellers?lat=29.1931&lng=30.6421&filter=1'));

    request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    if (request.statusCode == 200) {

      // var jsontestString =
      //     '[\n'
      //     '{\n'
      //     '"lat": 29.1931,'
      //     '"lng": 30.6421,'
      //     '"filter": 1,'
      //     '"name": "family1"'
      //     '}\n'
      //     ']\n';

      var jsonString = request.body;

      return trendingSellerFromJson(jsonString);

    } else {

      //show error message
      return null;

    }

  }

  static Future<List<Category>?> getcategory() async {

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzkwYTAwMjA3O'
          'DRlNzk2MDE3NGE2YWY5MDdkMzUwZTAxOTE0NDZjZTQwZTliMDZjNTFkZWZiN2Q4NTBiNzg2YzdmNDIyMjA5ZWQ1MmRmNTU'
          'iLCJpYXQiOjE2Mjk4MTM3NDMsIm5iZiI6MTYyOTgxMzc0MywiZXhwIjoxNjYxMzQ5NzQzLCJzdWIiOiI0Iiwic2NvcGVzI'
          'jpbXX0.Nuw3D7ROTr17Kw0dU5DsDQx-DoA0GibOutevNzbavVXS75xer-wnttPf4-MmP16LL-82sSWgL0NhjZYRjAUZtiB'
          'KlIDvcvlhctdyE4-tKNgpQDhg7dWBpuVZue0BmOvtObiDOl_AeN203E-rSg3pi-8kElkzGvHKaALbIjtSAWdCD6pzteYig'
          '40eq-Xn1duYlPau3xOSoMsoQrJKEfO99zjacz_vCPBNfWCFQbjXQad72peUmHEVVarOXiwtrIm6VWjd5vHmzUhjblF40CO'
          'vgsRI55Cu0D5Q-g2gOZoKQ6hW47sebBjqLemQvfzXSQDCltt_H1Be9U5FN_C8-UWBQXeZNcXiYaSBJuyaCo-SeO9ZawOhJ'
          'PlJ62rko5w_uxtj6XbWBt13RlNQmAh8olG3LEnlPtN0axsgDeYS3Sw3c1RfW8M9ApXBTBhNkSXrS3uH5euU8uD9b-qH8zd'
          'f1pvWOvAtMrPck1pD8y-glHMPD79GLfQVrT94FEjiloDTO9e0iiAgnneGHcfJPYC9XhXHEK1kAMr2595lp0tXfwl9km7se'
          'p2Mas3SdOtneen3BDj0ktFa8-mK4zf3OTtf72iBp2dLz4APcU3kIWHacI5legl79A9NKhjW0ftkK1rucAanLGGEwjT_NAR5'
          'WvlEGhPwcNwb-IB-1S7Fe-Pavrq5C_4',
      'lang': 'ar'
    };

    http.Response request = await client.get(Uri.parse('http://yogahez.fatoorah.sa/api/base-categories'));

    request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    if (request.statusCode == 200) {

      var jsonString = request.body;

      return categoryFromJson(jsonString);

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