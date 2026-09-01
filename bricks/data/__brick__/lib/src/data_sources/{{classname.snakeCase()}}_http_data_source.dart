import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';

/// Single source: implements the domain contract directly, so there is no
/// intermediate repository class (rule A). If the feature coordinates several
/// sources, add a `{{classname.snakeCase()}}_repository_single_source.dart`.
final class {{classname.pascalCase()}}HttpDataSource implements {{classname.pascalCase()}}Repository {}
