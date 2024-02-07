import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/common/dialogs/custom_dialog.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_keys.dart';
import 'package:tezz_cafe/core/utils/local_storage/storage_repository.dart';
import 'package:tezz_cafe/core/utils/validators/validators.dart';
import 'package:tezz_cafe/feature/auth/presentation/manager/auth_bloc.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:tezz_cafe/feature/clients/presentation/manager/client_tab_bloc.dart';
import 'package:tezz_cafe/feature/waitress/presentation/manager/waitress_bloc.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.status.isSuccess) {
            context.read<WaitressBloc>().add(GetWaitressEvent(state.token!));
            context.read<ClientTabBloc>().add(GetZones(StorageRepository.getString(StorageKeys.cafeId)));
            context.read<ClientTabBloc>().add(GetTablesByCafe(StorageRepository.getString(StorageKeys.cafeId)));

            Navigator.pop(context);
            toastification.show(
              context: context,
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              title: const Text('Muvaffaqiyatli'),
              autoCloseDuration: const Duration(seconds: 5),
              alignment: Alignment.bottomCenter,
              description: const Text('Xush kelibsiz'),
            );
            Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.home, (route) => false);
          }
          if (state.status.isFailure) {
            context.pop();
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              title: const Text('Xatolik'),
              autoCloseDuration: const Duration(seconds: 5),
              alignment: Alignment.bottomCenter,
              description: Text(state.error),
            );
            // CustomSnackBar.showErrorMessage(context, state.error);
          }
          if (state.status.isInProgress) {
            CustomDialog.showLoadingDialog(context);
          }
        },
        builder: (BuildContext context, AuthState state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
                  child: const Text('Logo'),
                ),
                const Gap(30),
                Form(
                  key: context.read<AuthBloc>().formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: context.read<AuthBloc>().usernameController,
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.email), hintText: "Username"),
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.validateUsername,
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: context.read<AuthBloc>().passwordController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () => context.read<AuthBloc>().add(ChangePasswordEvent()),
                                icon: Icon(state.isVisible ? Icons.visibility_off : Icons.visibility))),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: state.isVisible,
                        validator: AppValidators.validatePassword,
                      ),
                    ],
                  ),
                ),
                // add checkbox for remaind me
                const Gap(16),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Checkbox(
                      value: state.isChecked,
                      onChanged: (value) {
                        context.read<AuthBloc>().add(ChangeCheckedEvent());
                      }),
                  Text(
                    'Eslab qolish',
                    style: context.bodyLarge?.copyWith(color: AppColors.black),
                  ),
                ]),
                const Gap(24),
                FilledButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLoginEvent());
                      // context.pushReplacementNamed(RouteNames.home);
                    },
                    child: const Text('Kirish'))
              ],
            ),
          );
        },
      ),
    );
  }
}
