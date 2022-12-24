

// ignore: unused_import
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:dio/dio.dart';
// ignore: unused_import
import '{{name.snakeCase()}}_repository.dart';
// ignore: unused_import
import '../models/models.dart';

 class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {

  {{#repository}}
  @override
  Future< {{^void}} {{name.pascalCase()}}Response {{/void}}{{#void}} void{{/void}}>
  {{name.camelCase()}}
  ({ {{#params}}required {{name.pascalCase()}}Params params,{{/params}}{{#cancel}}CancelToken? cancelToken,{{/cancel}} }) async {
  
    throw UnimplementedError();
  }

  {{/repository}}



 }


 final {{name.snakeCase()}}RepositoryImplProvider = Provider<{{name.pascalCase()}}Repository>((ref) {
  return {{name.pascalCase()}}RepositoryImpl();
});