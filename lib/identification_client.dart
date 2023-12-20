import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idwall_sdk/domain/model/document_model.dart';
import 'package:idwall_sdk/idwall_sdk.dart';
import 'package:idwalltest/api_key_provider.dart';

final identificationClientProvider = Provider(
  (ref) => IdentificationClient(ref.read(apiKeyProvider)),
);

class IdentificationClient {
  final ApiKeyProvider _apiKeyProvider;

  IdentificationClient(this._apiKeyProvider);

  Future<void> setup() async {
    await IdwallSdk.initialize(_apiKeyProvider.idWallAuthKey());
    await IdwallSdk.setupPublic([
      _apiKeyProvider.idWallPublicKeyOne(),
      _apiKeyProvider.idWallPublicKeyTwo(),
    ]);
  }

  Future<String?> startFlow() async => IdwallSdk.startFlow(
        IdwallFlowType.complete,
        [
          IdwallDocumentType.cnh,
          IdwallDocumentType.rg,
        ],
        [
          IdwallDocumentOption.printed,
        ],
      );
}
