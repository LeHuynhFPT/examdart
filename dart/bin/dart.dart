import 'package:dart/dart.dart' as dart;
import 'package:dart/model/customer.dart';
import 'package:dart/service/customer_service.dart';
import 'package:dart/service/impl/customer_service_impl.dart';

void main(List<String> arguments) async {
  CustomerService customerService = CustomerServiceImpl();
  List<Customer> customers = await customerService.getAllCustomer();
  print("customer: $customers");
  Customer newCustomer = Customer(
    id: null,
    fullname: "John Doe",
    birthday: DateTime(1990, 5, 15),
    address: "123 Main St",
    phonenumber: "555-1234",
  );

  // Call the addCustomer method
  Customer addedCustomer = await customerService.addCustomer(newCustomer);

}
