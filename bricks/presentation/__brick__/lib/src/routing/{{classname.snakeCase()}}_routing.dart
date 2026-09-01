/// Navigation port: the feature emits intents / outcomes / dismissals, and the
/// composition-side implementation translates them into concrete navigation.
/// Name by event (`on…Requested`, `on…Successful`, `onDismiss…`), never by
/// imperative (`navigateTo…`, `push…`).
abstract interface class {{classname.pascalCase()}}Routing {
  // TODO: declare this screen's navigation events.
}
