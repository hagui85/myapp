import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path/path.dart' as p;

class VideoUtils {
  /// Génère une vignette à partir d'une URL ou chemin de vidéo
  static Future<Uint8List?> getThumbnailData({
    required String videoUrl,
    int maxWidth = 128,
    int quality = 75,
  }) async {
    try {
      return await VideoThumbnail.thumbnailData(
        video: videoUrl,
        imageFormat: ImageFormat.JPEG,
        maxWidth: maxWidth,
        quality: quality,
      );
    } catch (e) {
      debugPrint("Erreur génération thumbnail: $e");
      return null;
    }
  }

  /// Génère une vignette et la sauvegarde en fichier local
  static Future<String?> getThumbnailFile({
    required String videoUrl,
    int maxWidth = 128,
    int quality = 75,
  }) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = '${_getSanitizedFileName(videoUrl)}.jpg';
      final outputPath = p.join(directory.path, 'thumbnails', fileName);

      // Vérifie si le fichier existe déjà
      final outputFile = File(outputPath);
      if (await outputFile.exists()) return outputFile.path;

      // Sinon on génère et sauvegarde
      final data = await getThumbnailData(
        videoUrl: videoUrl,
        maxWidth: maxWidth,
        quality: quality,
      );

      if (data == null) return null;

      await outputFile.create(recursive: true);
      await outputFile.writeAsBytes(data);
      return outputPath;
    } catch (e) {
      debugPrint("Erreur sauvegarde thumbnail: $e");
      return null;
    }
  }

  /// Nettoie l'URL pour obtenir un nom de fichier valide
  static String _getSanitizedFileName(String url) {
    return url
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_')
        .replaceAll('__', '_')
        .toLowerCase();
  }

  /// Supprime tous les thumbnails générés localement
  static Future<void> clearThumbnailsCache() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final thumbnailsDir = Directory(p.join(directory.path, 'thumbnails'));
      if (await thumbnailsDir.exists()) {
        await thumbnailsDir.delete(recursive: true);
        debugPrint('Thumbnails supprimés');
      }
    } catch (e) {
      debugPrint("Erreur nettoyage des thumbnails: $e");
    }
  }
}
