import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idwalltest/identification_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _RegisterStepsWidget(onStepCompleted: () {}),
    );
  }
}

class _RegisterStepsWidget extends ConsumerStatefulWidget {
  final Function onStepCompleted;
  const _RegisterStepsWidget({
    required this.onStepCompleted,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterStepsState();
}

class _RegisterStepsState extends ConsumerState<_RegisterStepsWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startIdentificationSdk();
    });
  }

  _startIdentificationSdk() async {
    final identificationClient = ref.read(identificationClientProvider);
    await identificationClient.setup();
  }

  @override
  Widget build(BuildContext context) {
    final client = ref.read(identificationClientProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('idwall-test'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () async {
              await client.startFlow().then((token) {
                print(token);
              }).catchError((error) {
                print(error);
              });
            },
            child: const Text('Start')),
      ),
    );
  }
}
