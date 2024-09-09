import 'package:fcmapp/app/permissions/notification_permissions.dart';
import 'package:fcmapp/app/services/server_key_service.dart';
import 'package:flutter/material.dart';
import 'services/notification_service.dart';

class UiView extends StatefulWidget {

  const UiView({Key? key}) : super(key: key);

  @override
  State<UiView> createState() => _UiViewState();
}

class _UiViewState extends State<UiView> {
  NotificationPermissions notificationPermissions = NotificationPermissions();
  ServerKeyService  serverKeyService = ServerKeyService();
  final notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationPermissions.requestNotificationPermission();
    notificationService.firebaseInit(context);
    notificationService.bgAndTrSatate(context);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Notification Example App'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // PaddedElevatedButton(
          //   buttonText: 'Show simple notification with custom sound',
          //   onPressed: () async {
          //     await NotificationService().showNotificationCustomSound();
          //   },
          // ),
          // PaddedElevatedButton(
          //   buttonText: 'Schedule notification with custom sound',
          //   onPressed: () async {
          //     await NotificationService().scheduleNotificationCustomSound();
          //   },
          // ),
          //
          PaddedElevatedButton(
            buttonText: 'Server Key',
            onPressed: () async {
             String key =  await serverKeyService.getServiceKey();
             String? deviceToken =  await notificationPermissions.getDeviceToken();

             print("Key is $key");
             print("Token is $deviceToken");
            },
          ),
        ],
      ),
    ),
  );
}

class PaddedElevatedButton extends StatelessWidget {
  const PaddedElevatedButton({
    required this.buttonText,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),



    ),
  );
}
