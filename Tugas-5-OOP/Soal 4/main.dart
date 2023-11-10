import 'employee.dart';

void main(List<String> args) {
  var employee1 = new Employee.id(22);
  var employee2 = new Employee.name("Fachrul");
  var employee3 = new Employee.department("IT");

  print(employee1.id);
  print(employee2.name);
  print(employee3.department);
}
