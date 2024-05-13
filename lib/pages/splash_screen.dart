
import 'dart:async';

import 'package:echolens_v1/pages/select_bonded_device_page.dart';
import 'package:echolens_v1/pages/controls_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;


  @override
  void initState() {
    super.initState();
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if ((await FlutterBluetoothSerial.instance.isEnabled) ?? false) {
        return false;
      }
      await Future.delayed(const Duration(milliseconds: 0xDD));
      return true;
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
        _bluetoothState = state;
    });

    enableBluetooth();
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets\\images\\background.jpeg'),
                fit: BoxFit.fill)),
        child: Center(
          child: ListTile(
            contentPadding:const EdgeInsets.only(left: 60, right: 60),
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor:const Color.fromARGB(255, 59, 101, 255),
                backgroundColor:const Color.fromARGB(255, 98, 208, 205),
              ),
              child: const Text(
                '\nCONNECT TO A PAIRED DEVICE\n',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              onPressed: () async {
                final BluetoothDevice? selectedDevice =
                    await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SelectBondedDevicePage(
                          checkAvailability: false);
                    },
                  ),
                );

                if (selectedDevice != null) {
                  print('Connect -> selected ' + selectedDevice.address);
                  _connect(context, selectedDevice);
                } else {
                  print('Connect -> no device selected');
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future showPariedDevices() async {}

  Future enableBluetooth() async {
    if (_bluetoothState.isEnabled) {
      print("Already enabled");
      return;
    } else {
      await FlutterBluetoothSerial.instance.requestEnable();
    }
  }

  void _connect(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ControlsPage(server: server);
        },
      ),
    );
  }
}