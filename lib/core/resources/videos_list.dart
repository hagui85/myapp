import 'dart:convert';

class VideosList {
  static String mockJsonString() {
    final mockJson = {
      "videos": [
        {
          "id": 1,
          "url":
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
          "description": "Lorem ipsum dolor sit amet.",
        },
        {
          "id": 2,
          "url":
              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
          "description": "Consectetur adipiscing elit.",
        },
        {
          "id": 4,
          "url": "https://xproto-chr.eu/video/adm.mp4",
          "description": "chrono xproto",
        },
        {
          "id": 5,
          "url":
              "https://ff9fc1f17ea405db7d92bf7ceca104bfdbf99cc6c5752b0a391167a-apidata.googleusercontent.com/download/storage/v1/b/prod-chr-chr.gcs.wizyemm.app/o/video%2Fdemo.mp4?jk=AXbWWmm5L6aIcoMWpUQTmkH-oJ9RCNWQ_ydqTWbu5FtyzRmNim_Md27Vw34mDdLKBZXyjbqy6FCBWXLtX5yRhvFYg_2yLEGv4VFgw71u8ls35fhpccOa4j_-tz36SKeeMkE9rFghP1Gob_rria7nhCRzoA1X9k-8-UoUBeYEdXN4SxtrfNCSzTt19cFDg3jvYNlaUBUJ_-xlH2CjKB7Whs0FjI50AYucsUi23BmVM6XthbSvN2s9aa37CVTbwJcWrLRXxeh7bkov3r7NPofoIu0H9ioj1u5JPDbfmRdCzY-NcKzbBOT7pu07bmV7M1AdCXsInKCOEKqC2oYJ4kJ-KVIO3RWH7JynL3wgbad_p1gb_hzeeph4ZTI4xi7ABwSMaMvrjKpjEQ3kojGIa5zgXyZoVqhtVohMkuwpTKqwxYI2TVwGdrDmrIoVtliJhUBCGh-3CUjbB_JUziVGs4Gau4YU1SWteiVUsYWDZzo7ywWdvMRr5bnGug8DGHiHaQjLwW6MmRDhvFhulGFUEVxsekMhBiWi_fEdqrkU05IOORt5YzcDkZ-IAKYuruUm_A_ttofY7SxvjEU3TOsNHYIrhOGltqbG_9KZ8fKY96_lgC3M_GsBc9xrxL0vQFzutFoxjzf6aUZLkYGZV3Z__kuYUwQg6U5Hzf4BpWDD6wxQRfX7ExIuzkV_lRojTeAzpASWJ9d4h3k-kE46E29HVwfdOwctcFXGdUMBmIi5ALty92B2QF42e3z9YSnyF8GF-X0GeEIvdfaG1V6R9ZN6h8XXeZjeluZzQhZjqE4X8u-acEDHCziDRnlDi3nipW5u2llvWf9V1gmiyIAORRx-7bRKo9C1P66NkmDE7TIVOyI5mXmLh2hSt1VpfZ_6BVaODW-yhksxo2nXDhr99MyAgOxZE8O3poxVe5_njpybqERKGVoc-VgCF21g9YucyZ7BQxK6pPcYHRMorTtJPN2ginx8_zVLRzavwzQItdNroQR0LRDTuoQINdpy3UoMcGTatVrgKqSMlHAd5j1zACkjEbAkxpPj4Hop2C_X1ecoXfSsQGW057q3grepW8tbW4fqanyi9xGxwfgIzT5o30hjF2jKkvMes8UL12qb8NBc-ziG0h6X3OhQyqKoFitFRmX6ZqxrKXJB5JI37rqphUe9GY3C3Tnp71rp-2CkYA&isca=1",
          "description": "video in wizzy",
        },
      ],
    };

    return jsonEncode(mockJson);
  }
}
