import 'package:dynamicisland/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var mycontroller = Get.put(MyController());

    return Scaffold(body: Obx(() {
      return SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        mycontroller.openAnimateContainer();

                        mycontroller.opacity(1.0);
                      },
                      child: const Text("show dynamic island")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        mycontroller.changeHoldToRelax();
                      },
                      child: const Text("change hold relax")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        mycontroller.minusNumber();
                      },
                      child: const Text("- number")),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        mycontroller.closeAnimateContainer();
                        await Future.delayed(const Duration(milliseconds: 800));
                        mycontroller.opacityVoid();
                      },
                      child: const Text("close dynamic island")),
                ],
              ),
            ),
            Positioned(
                left: mycontroller.left.value,
                top: mycontroller.top.value,
                child: GestureDetector(
                  onTap: () {},
                  onPanUpdate: (details) {
                    mycontroller.updateDraggable(details);
                  },
                  child: Opacity(
                    opacity: mycontroller.opacity.value,
                    child: AnimatedContainer(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 800),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 60,
                      width: mycontroller.containerWidth.value,
                      child: mycontroller.containerWidth.value == 300
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  mycontroller.txt.value,
                                  style: TextStyle(
                                      color: mycontroller.txt.value == "Hold"
                                          ? Colors.red
                                          : Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${mycontroller.number}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                )),
          ],
        ),
      );
    }));
  }
}
