import 'package:conference_app/models/login_provider.dart';
import 'package:conference_app/models/user_model.dart';
import 'package:conference_app/views/components/stacked_background.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class EditAccountView extends StatefulWidget {
  const EditAccountView({super.key});

  @override
  State<EditAccountView> createState() => _EditAccountViewState();
}

class _EditAccountViewState extends State<EditAccountView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final ValueNotifier<List<Map<String, String>>> _links = ValueNotifier([]);

  final _formKey = GlobalKey<FormState>();

  void addLink(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddLinkBottomSheet(_links),
          ),
    );
  }

  void removeLink(BuildContext context, Map<String, String> link) {
    _links.value.removeWhere((element) => element.hashCode == link.hashCode);
    _links.value =
        _links.value.map((e) => Map<String, String>.from(e)).toList();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Link removed!", textAlign: TextAlign.center)),
    );
  }

  void saveUserInfo(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      UserModel user = Provider.of<UserModel>(context, listen: false);
      await user.updateUserData(
        _userNameController.text,
        _bioController.text,
        _links.value,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Changed saved!", textAlign: TextAlign.center),
          ),
        );
      }
    }
  }

  void deleteAccount(
    BuildContext context,
    UserModel user,
    LoginProvider loginProvider,
  ) async {
    bool? confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Confirm account deletion.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            content: Text("Are you sure you want to delete your account?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text("Confirm"),
              ),
            ],
          ),
    );

    if (confirm == true) {
      user.deleteAccount();
      loginProvider.logout();
      if (context.mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of(context, listen: false);
    LoginProvider loginProvider = Provider.of(context, listen: false);

    _userNameController.text = user.userName;
    _bioController.text = user.bio;
    _links.value = user.links.map((e) => Map<String, String>.from(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: TextButton(
              onPressed: () => saveUserInfo(context),
              child: Text("Save"),
            ),
          ),
        ],
      ),
      body: StackedBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "User Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a username";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _bioController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Bio",
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Links:",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  ListenableBuilder(
                    listenable: _links,
                    builder: (context, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_links.value.isEmpty)
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                              child: Text(
                                "You don't have any website links yet.",
                              ),
                            ),
                          for (Map<String, String> link in _links.value)
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Icon(Icons.link),
                                  SizedBox(width: 6),
                                  Text(
                                    link["name"]!,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge?.copyWith(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.tertiary,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () => removeLink(context, link),
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  FilledButton.icon(
                    onPressed: () => addLink(context),
                    label: Text("Add a new link"),
                    icon: Icon(Icons.add_link),
                  ),
                  SizedBox(height: 12),
                  FilledButton(
                    onPressed:
                        () => deleteAccount(context, user, loginProvider),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.error,
                      ),
                    ),
                    child: Text("Delete Account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddLinkBottomSheet extends StatefulWidget {
  const AddLinkBottomSheet(this.links, {super.key});

  final ValueNotifier<List<Map<String, String>>> links;

  @override
  State<AddLinkBottomSheet> createState() => _AddLinkBottomSheetState();
}

class _AddLinkBottomSheetState extends State<AddLinkBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void addLink(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.links.value.add({
        "name": _nameController.text,
        "url": _urlController.text,
      });

      // Clone the list so the value notifier is triggered.
      widget.links.value =
          widget.links.value.map((e) => Map<String, String>.from(e)).toList();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                Expanded(
                  child: Text("Add website link", textAlign: TextAlign.center),
                ),
                TextButton(
                  onPressed: () => addLink(context),
                  child: Text("Add"),
                ),
              ],
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Display Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the display name";
                }

                return null;
              },
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "URL",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the website URL";
                } else if (!Uri.parse(value).isAbsolute) {
                  return "Please enter a valid URL (i.e. https://site.com)";
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
