import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
]);
final addressValidator = MultiValidator([
  RequiredValidator(errorText: 'address is required'),
  MinLengthValidator(12, errorText: 'address must be at least 12 digits and alphabetic long'),
]);
final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  PatternValidator(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$', errorText: 'email must have @')
]);
final requireValidator = MultiValidator([
  RequiredValidator(errorText: ' this failed is  required'),
]);
String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'phone is required'),
  MinLengthValidator(11, errorText: 'password must be at least 11 digits long'),
  PatternValidator(patttern, errorText: ' must have 11 number')
]);
