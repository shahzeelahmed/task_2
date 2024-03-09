import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';

import '../controllers/connection_controller.dart';

class PopupContainer extends ConsumerStatefulWidget {
  const PopupContainer({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PopupContainerState();
}

@override
class _PopupContainerState extends ConsumerState<PopupContainer>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController rigsController = TextEditingController();
  late final AnimationController _controller = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(isConnectedProvider);
    // final isconnected = ref.watch(connectToLGProvider);

    final double mWidth = MediaQuery.of(context).size.width;
    final double mHeight = MediaQuery.of(context).size.width;

    return Material(
      borderOnForeground: false,
      color: Colors.transparent,
      child: GlassmorphicContainer(
          height: mHeight * 0.4,
          width: mWidth * 0.4,
          borderRadius: 20,
          blur: 10,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.05),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [
                0.1,
                1,
              ]),
          borderGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffcc208e),
              Color(0xff6713d2),
              //  Color(0xFF23ffe2)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.pink,
                    gradient: LinearGradient(
                        colors: [Colors.pink, Colors.pink.shade400])),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: userNameController,
                            onChanged: (text) {},
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                labelText: 'username',
                                hintText: 'example: lg',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintStyle:
                                    const TextStyle(color: Colors.white54)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid username';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextFormField( style: const TextStyle(color: Colors.white),
                            controller: passWordController,
                            onChanged: (text) {},
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                labelText: 'password',
                                hintText: 'Example: lg',
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white54)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid IP address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextFormField( style: const TextStyle(color: Colors.white),
                            controller: ipController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                labelText: 'IP Address',
                                hintText: 'Example: 192.168.201.3',
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintStyle:
                                    const TextStyle(color: Colors.white54)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid IP address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextFormField( style: const TextStyle(color: Colors.white),
                            controller: portController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                labelText: 'port',
                                hintText: 'Example: 22',
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white54)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid IP address';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                         
                            _controller.forward(from: 0);
                  
                            isConnected
                                ? await ref
                                    .read(disconnectProvider.notifier)
                                    .disconnect()
                                : await ref
                                    .read(connectToLGProvider.notifier)
                                    .connect(
                                        userNameController.text,
                                        ipController.text,
                                        int.parse(portController.text),
                                        passWordController.text);
                          },
                          child: ref.watch(connectToLGProvider).when(
                              data: (data) => LottieBuilder.asset(
                                      controller: _controller,
                                      isConnected
                                          ? 'assets/disconnect_animation.json'
                                          : 'assets/connect_animation.json',
                                      height: mHeight * 0.07,
                                      width: mWidth * 0.07,
                                      reverse: false,
                                      repeat: false, onLoaded: (composition) {
                                    _controller.duration =
                                        const Duration(milliseconds: 1200);
                                  }),
                              error: (error, stc) => const Text('error'),
                              loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ))),
                    ],
                  )),
            ],
          )),
    );
  }
}
