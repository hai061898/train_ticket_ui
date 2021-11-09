import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PilihTiketController extends GetxController {
   var indexTraincar = 0.obs;
   var traincar = List.generate(
    6,
    (indexX) => List<Map<String, dynamic>>.generate(
      75,
      (indexY) {
        if (indexX == 0) {
          // train car 1
          if (indexY >= 24 && indexY <= 26 || indexY >= 40 && indexY <= 44) {
            return {
              "id": "ID-${indexX + 1}-${indexY + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexX + 1}-${indexY + 1}",
              "status": "available",
            };
          }
        } else if (indexX == 1) {
          // train car 2
          if (indexY >= 5 && indexY <= 35) {
            return {
              "id": "ID-${indexX + 1}-${indexY + 1}",
              "status": "filled",
            };
          } else {
            return {
              "id": "ID-${indexX + 1}-${indexY + 1}",
              "status": "available",
            };
          }
        } else {
          return {
            "id": "ID-${indexX + 1}-${indexY + 1}",
            "status": "available",
          };
        }
      },
    ),
  ).obs;



    void changeCarriage(int indexGerbongTerpilih) {
    indexTraincar.value = indexGerbongTerpilih;
    traincar.refresh();
  }

   void reset() {
    for (var element in traincar) {
      for (var element in element) {
        if (element["status"] != "filled") {
          element.update("status", (value) => "available");
        }
      }
    }
  }

  
  void selectKursi(int indexSeat) {
    debugPrint(traincar[indexTraincar.value][indexSeat].toString());
    if (traincar[indexTraincar.value][indexSeat]["status"] ==
        "available") {
      reset();
      traincar[indexTraincar.value][indexSeat]
          .update("status", (value) => "selected");
    }
    traincar.refresh();
  }


}