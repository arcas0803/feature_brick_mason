

// ignore: unused_import
import 'package:dio/dio.dart';
// ignore: unused_import
import '../models/models.dart';






/// {{name.pascalCase()}}Repository
/// This repository is resposible for all the business logic of the {{name.pascalCase()}} feature
/// 
abstract class {{name.pascalCase()}}Repository {


  {{#repository}}

    /// {{name.pascalCase()}}
    /// 
    /// Description: 
    /// 
   {{#params}}
    /// Params:
    /// 
    ///   - [params] as {{name.pascalCase()}}Params: 
    /// 
    {{/params}}
    {{#void}}
    /// Returns:
    /// 
    ///   - Nothing
    {{/void}}
    {{^void}}
    /// Returns:
    /// 
    ///  - {{^void}} [{{name.pascalCase()}}Response] {{/void}} :
    /// 
    {{/void}}
    /// Exceptions:
    /// 
    /// 
    Future< {{^void}} {{name.pascalCase()}}Response {{/void}}{{#void}} void{{/void}}>
    {{name.camelCase()}}
    ({ {{#params}}required {{name.pascalCase()}}Params params,{{/params}}{{#cancel}}CancelToken? cancelToken,{{/cancel}} });

  {{/repository}}
}