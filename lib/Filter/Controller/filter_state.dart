part of 'filter_cubit.dart';

@immutable
abstract class FilterState {}

class FilterInitial extends FilterState {}
class SuccessFilterCategory extends FilterState {}
class SuccessFilterControl extends FilterState {}
