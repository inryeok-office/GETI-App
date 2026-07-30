import 'package:geti_app/features/counter/presentation/view/counter_view.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'counter',
        builder: (context, state) => const CounterView(),
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
