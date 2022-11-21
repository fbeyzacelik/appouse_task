import 'package:appouse_task/constants/constants.dart';
import 'package:appouse_task/products_model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Response response;
  Dio dio = new Dio();

  Future<ProductResponse> getLaptop() async {
    var data = {'q': 'Laptop'};
    dio.options.headers['Content-Type'] = 'application/json';

    response =
        await dio.get(ApplicationConstants.laptop_url, queryParameters: data);

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.data);
    }
  }

  Future<ProductResponse> getTelephone() async {
    dio.options.headers['Content-Type'] = 'application/json';

    response = await dio.get(ApplicationConstants.telephone_url);

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.data);
    }
  }
}
