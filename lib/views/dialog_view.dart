import 'package:beautiful_dialog/dialogs/dialog_class.dart';
import 'package:beautiful_dialog/dialogs/notif_dialog.dart';
import 'package:beautiful_dialog/dialogs/yes_no_dialog.dart';
import 'package:beautiful_dialog/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogView extends StatefulWidget {
  const DialogView({super.key});

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Beautiful Dialogs"),
        actions: [
          GestureDetector(
            onTap: () {
              _launchUrl(
                  'https://github.com/Docteur-Parfait/beautiful_dialog.git');
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 40,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/github.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Contribute",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            children: [
              CustomButton(
                text: "Yes or No confirmation",
                author: "Tech Pastor",
                onTap: () => YesOrNoDialog.showYesNoConfirmationDialog(
                  context,
                  title: "Confirm",
                  subtitle: "Do you want to confirm?",
                ),
              ),
              CustomButton(
                text: "Ok confirmation",
                author: "Tech Pastor",
                onTap: () => DialogClass.showOkConfirmationDialog(
                  context,
                  title: "Confirm",
                  message: "Action confirmed successfully",
                ),
              ),
              CustomButton(
                text: "Danger alert",
                author: "Tech Pastor",
                onTap: () => DialogClass.showDangerAlertDialog(
                  context,
                  warningMessage: "Do you want to log out?",
                ),
              ),
              CustomButton(
                text: "Success alert",
                author: "Just2sire",
                onTap: () => DialogClass.showSuccessDialog(
                  context,
                  message:
                      "Congrats! You will now enjoy our new updates for next year.",
                ),
              ),
              CustomButton(
                text: "Expanding alert",
                author: "littleDarkBug",
                onTap: () => DialogClass.showExpandingDialog(
                  context,
                  message: "Try to close it on the first try.",
                ),
              ),
              CustomButton(
                text: "Warning alert",
                author: "gotflo",
                onTap: () => DialogClass.showWarningAlertDialog(
                  context,
                  warningMessage:
                      "Are you sure you want to delete this post? This action\ncannot be undone.",
                ),
              ),
              CustomButton(
                  text: "Feedback dialog",
                  author: "prosmaw",
                  onTap: () => DialogClass.feedback(context)),
              CustomButton(
                text: "Switch theme alert",
                author: "Lecodeur",
                onTap: () => DialogClass.showSwitchThemeDialog(context),
              ),
              CustomButton(
                text: "Error Alert",
                author: "shubhanshu-02",
                onTap: () => DialogClass.showErrorDialog(
                  context,
                  message: "An error occurred while processing your request.",
                ),
              ),
              CustomButton(
                text: "Show notification Dialog",
                author: "Armel Bogue",
                onTap: () => NotifDialog.showNotifDialog(context),
              ),
              CustomButton(
                text: "PingPong Dialog",
                author: "littleDarkBug",
                onTap: () => DialogClass.showPingPongDialog(
                  context,
                  message: "Please, wait while we're doing the magic!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
