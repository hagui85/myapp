import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:myapp/core/resources/app_strings.dart';

class NetworkUtils {
  NetworkUtils._();

  static String getAuthenticationCode() {
    initializeDateFormatting('fr_FR'); // Initialize the locale data
    final format = DateFormat("yyyyMMdd", 'fr_FR');
    String date = format.format(DateTime.now());
    int day = int.parse(date.substring(6, 8));
    int month = int.parse(date.substring(4, 6));
    String year = date.substring(0, 4);

    String dayStr = day < 10 ? "0$day" : day.toString();
    String monthStr = month < 10 ? "0$month" : month.toString();

    String source = year + dayStr + monthStr;

    try {
      var sha = SHA1sum(utf8.encode(source));
      if (sha != null) {
        return convertHash(sha).substring(0, 8);
      } else {
        // Handle null case here (if necessary)
        return "11111";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return "11111";
    }
  }

  static Uint8List? SHA1sum(List<int> convertme) {
    var md = sha1;
    var bytes = md.convert(convertme).bytes;
    // ignore: unnecessary_null_comparison
    return bytes != null ? Uint8List.fromList(bytes) : null;
  }

  static BigInt convertByteToLong(Uint8List sha1) {
    var buffer = ByteData.view(sha1.buffer);
    var a = buffer.getInt64(0, Endian.little);
    return a > 0 ? BigInt.from(a) : parseBigIntegerPositive(a.toString(), 64);
  }

  static BigInt parseBigIntegerPositive(String num, int bitlen) {
    var b = BigInt.parse(num);
    if (b < BigInt.zero) {
      b += BigInt.one << bitlen;
    }
    return b;
  }

  static String convertHash(Uint8List hashData) {
    const mapping = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var base10 = convertByteToLong(hashData);
    final List<String> result = [];

    do {
      final remainder = base10.remainder(BigInt.from(36)).toInt();
      result.insert(0, mapping[remainder]);
      base10 = base10 ~/ BigInt.from(36);
    } while (base10 > BigInt.zero);

    return result.join().padLeft(8, '0');
  }

  static Future<String> getBaseUrl(String endPoint) async {
    String baseUrl;
    if (kDebugMode) {
      baseUrl = AppStrings.PFI_URL;
    } else {
      baseUrl = AppStrings.PROD_URL;
    }

    return baseUrl + endPoint;
  }
}
