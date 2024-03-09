import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../views/home_view.dart';

part 'connection_controller.g.dart';

StateProvider<SSHClient?> clientProvider = StateProvider(
  (ref) => null,
);

///using riverpod's [AsyncValue] to write cleaner code and seperating business logic from ui

@Riverpod(keepAlive: true)

/// [keepAlive] is set to true to cache the data for the current session
class ConnectToLG extends _$ConnectToLG {
  @override
  //build method which returns initial value of the provider
  Future<bool> build() async {
    return false;
  }

  Future<bool> connect(
      String userName, String host, int port, String password) async {
    try {
      //extract loading state while performing asynchronous tasks
      state = const AsyncValue.loading();
      ref.read(clientProvider.notifier).state = SSHClient(
          await SSHSocket.connect(host, port,
              timeout: const Duration(seconds: 5)),
          username: userName,
          onPasswordRequest: () => password,
          );

      ///update the [state] if result is true
      //this sets the return value to true which was initially false
      state = const AsyncData(true);
      ref.read(isConnectedProvider.notifier).setState(true);
      return true;
    } on SocketException catch (e) {
      ///return state as false on error
      state = const AsyncValue.data(false);
      ref.read(isConnectedProvider.notifier).setState(false);
      return false;
    }
  }
}

@Riverpod(keepAlive: true)
class IsConnected extends _$IsConnected {
  @override
  bool build() {
    return false;
  }

  void setState(bool isconnected) {
    state = isconnected;
  }
}

//close the connection to client

@riverpod
class Disconnect extends _$Disconnect {
  @override
  void build() {
    return;
  }

  Future<void> disconnect() async {
    try {
      ref.read(clientProvider)!.close();
      ref.read(isConnectedProvider.notifier).state = false;
    } catch (e) {
      print(e);
    }
  }
}

//relaunch lg using the command available at liquid-galaxy/gnu_linux/home/lg/bin/lg-relaunch and relaunching lg on each slave

@riverpod
class Relaunch extends _$Relaunch {
  @override
  void build() {
    return;
  }

  Future<void> relaunchLG() async {
    //hardcoded for demonstration

    String passWord = 'lg';
    String username = 'lg';
    for (int i = 0; i < ref.read(rigsProvider); i++) {
      String cmd = """RELAUNCH_CMD="\\
          if [ -f /etc/init/lxdm.conf ]; then
            export SERVICE=lxdm
          elif [ -f /etc/init/lightdm.conf ]; then
            export SERVICE=lightdm
          else
            exit 1
          fi
          if  [[ \\\$(service \\\$SERVICE status) =~ 'stop' ]]; then
            echo $passWord | sudo -S service \\\${SERVICE} start
          else
            echo $passWord | sudo -S service \\\${SERVICE} restart
          fi
          " && sshpass -p $passWord ssh -x -t lg@lg$i "\$RELAUNCH_CMD\"""";

      await ref
          .read(clientProvider)
          ?.run('"/home/$username/bin/lg-relaunch" > /home/$passWord/log.txt');

      await ref.read(clientProvider)!.run(cmd);
    }
  }
}
