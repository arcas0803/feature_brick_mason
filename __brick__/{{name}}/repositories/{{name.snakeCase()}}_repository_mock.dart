



// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
// ignore: unused_import
import '{{name.snakeCase()}}_repository.dart';
// ignore: unused_import
import '../models/models.dart';

 class {{name.pascalCase()}}RepositoryMock extends Mock implements {{name.pascalCase()}}Repository {

 
 }


 final {{name.snakeCase()}}RepositoryMockProvider = Provider<{{name.pascalCase()}}Repository>((ref) {
  return {{name.pascalCase()}}RepositoryMock();
});