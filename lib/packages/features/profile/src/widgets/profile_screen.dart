import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_duel_disk/generated/locale_keys.g.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

import '../profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ProviderMixin {
  @override
  Widget build(BuildContext context) {
    final stringProvider = getStringProvider(context);

    return Scaffold(
      appBar: SddAppBar(
        title: stringProvider.getString(LocaleKeys.profile_screen_title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenMarginLarge),
      child: Column(
        children: const [
          _UserAvatar(),
          SizedBox(height: AppSizes.screenMargin),
          _UserName(),
        ],
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.account_circle,
        size: 120.0,
        color: Colors.grey,
      ),
    );
  }
}

class _UserName extends StatelessWidget with ProviderMixin {
  const _UserName();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProfileViewModel>(context);
    final stringProvider = getStringProvider(context);

    return TextFieldWithValidation(
      label: stringProvider.getString(LocaleKeys.profile_label_username),
      hint: stringProvider.getString(LocaleKeys.profile_hint_username),
      textStream: vm.username,
      onChanged: null,
      onSubmitted: vm.onUsernameSubmitted,
    );
  }
}
