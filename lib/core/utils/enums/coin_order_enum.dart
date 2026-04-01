import 'package:freezed_annotation/freezed_annotation.dart';

enum CoinOrder {
  @JsonValue('market_cap_desc')
  marketCapDesc,
  @JsonValue('market_cap_asc')
  marketCapAsc,
  @JsonValue('volume_desc')
  volumeDesc,
  @JsonValue('volume_asc')
  volumeAsc,
  @JsonValue('id_desc')
  idDesc,
  @JsonValue('id_asc')
  idAsc,
}
