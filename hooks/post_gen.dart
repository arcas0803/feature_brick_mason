import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final logger = context.logger;
  logger.info('Running post_gen.dart');

  final featureName = context.vars['name'] as String;

  final brickRepos = context.vars['repository'] as List<dynamic>;

  for (var repo in brickRepos) {
    String name = repo['name'] as String;
    bool params = repo['params'] as bool;
    bool voidReturn = repo['void'] as bool;

    if (params) {
      String paramsName = name.toSnakeCase() + '_params';
      // Create a new file in the model folder
      final file = File(
        '${featureName}/models/$paramsName.dart',
      )..createSync(recursive: true);

      // save the file
      file.writeAsStringSync('''
            // ignore: unused_import
            import 'package:freezed_annotation/freezed_annotation.dart';

            part '$paramsName.freezed.dart';
            part '$paramsName.g.dart';

            @freezed
            class ${paramsName.toPascalCase()} with _\$${paramsName.toPascalCase()} {
              const factory ${paramsName.toPascalCase()}() = _${paramsName.toPascalCase()};

              const ${paramsName.toPascalCase()}._();

              factory ${paramsName.toPascalCase()}.fromJson(Map<String, dynamic> json) => _\$${paramsName.toPascalCase()}FromJson(json);

              
        }
      ''');

      // close the file

    }

    if (!voidReturn) {
      String responseName = name.toSnakeCase() + '_response';

      // Create a new file in the model folder
      final file = File(
        '${featureName}/models/$responseName.dart',
      )..createSync(recursive: true);

      // save the file
      file.writeAsStringSync('''
            // ignore: unused_import
            import 'package:freezed_annotation/freezed_annotation.dart';

            part '$responseName.freezed.dart';
            part '$responseName.g.dart';

            @freezed
            class ${responseName.toPascalCase()} with _\$${responseName.toPascalCase()} {
              const factory ${responseName.toPascalCase()}() = _${responseName.toPascalCase()};

              const ${responseName.toPascalCase()}._();

              factory ${responseName.toPascalCase()}.fromJson(Map<String, dynamic> json) => _\$${responseName.toPascalCase()}FromJson(json);

              
        }
      ''');

      // close the file

      // Run `flutter packages get` after generation.
      await Process.run('flutter', ['run', 'build_runner', 'build']);
    }
  }
}
