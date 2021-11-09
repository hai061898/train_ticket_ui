import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trainticket/app/modules/pilih_tiket/pilih_tiket_controller.dart';

import 'components/item_status.dart';

class PilihTiketView extends StatelessWidget {
  const PilihTiketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PilihTiketController controller = Get.put(PilihTiketController());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Select Your\nSeat",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333E63),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Commuter Line (A)",
                        ),
                        Text(
                          "Wagon 1 -3A",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF656CEE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ItemStatus(
                      status: "Available",
                      color: Colors.white,
                    ),
                    ItemStatus(
                      status: "Filled",
                      color: Color(0xFFFF8B2D),
                    ),
                    ItemStatus(
                      status: "Selected",
                      color: Color(0xFF656CEE),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Wagon",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "A",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "D",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "E",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.traincar.length,
                                        (index) => GestureDetector(
                                          onTap: () =>
                                              controller.changeCarriage(index),
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            height: 150,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black38,
                                              ),
                                              color: controller.indexTraincar
                                                          .value ==
                                                      index
                                                  ? const Color(0xFF656CEE)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  child: Obx(
                                    () => GridView.builder(
                                      padding: const EdgeInsets.all(10),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 5,
                                      ),
                                      itemCount: controller
                                          .traincar[
                                              controller.indexTraincar.value]
                                          .length,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                        onTap: () =>
                                            controller.select(index),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black38,
                                            ),
                                            color: controller.traincar[
                                                            controller
                                                                .indexTraincar
                                                                .value][index]
                                                        ["status"] ==
                                                    "available"
                                                ? Colors.white
                                                : controller.traincar[controller
                                                                .indexTraincar
                                                                .value][index]
                                                            ["status"] ==
                                                        "filled"
                                                    ? const Color(0xFFFF8B2D)
                                                    : const Color(0xFF656CEE),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("SELECT YOUR SEAT"),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF656CEE),
                      fixedSize: Size(Get.width * 0.8, 50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
