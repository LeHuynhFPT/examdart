import 'dart:convert';

import 'package:dart/model/customer.dart';
import 'package:http/http.dart' as http;

import '../customer_service.dart';

class CustomerServiceImpl implements CustomerService {
  final String baseURL = "http://localhost:8080/customer";




  @override
  Future<List<Customer>> getAllCustomer() async {
    try {
      final response = await http.get(Uri.parse("$baseURL/getAll"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        return data.map((item) => Customer.valueFromJson(item)).toList();
      }
    } catch(e) {
      print(e);
    }
    return <Customer>[];
  }

  @override
  Future<Customer> addCustomer(Customer customer) async {
    try {
      final response = await http.post(
        Uri.parse("$baseURL/save"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(customer.toJson()),
      );

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return Customer.valueFromJson(data);
      }
    } catch (e) {
      print(e);
    }
    // In case of an error or unsuccessful response, return a default Customer
    return Customer(id: 0, fullname: "", birthday: null, address: "", phonenumber: "");
  }
}


