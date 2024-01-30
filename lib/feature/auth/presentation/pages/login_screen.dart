import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tezz_cafe/core/common/dialogs/custom_dialog.dart';
import 'package:tezz_cafe/core/common/dialogs/custom_snackbar.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/core/utils/constants/colors.dart';
import 'package:tezz_cafe/core/utils/validators/validators.dart';
import 'package:tezz_cafe/feature/auth/presentation/manager/auth_bloc.dart';
import 'package:tezz_cafe/presentation/widgets/textfield.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state.status.isSuccess) {
            Navigator.pop(context);
            Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.home, (route) => false);
          }
          if (state.status.isFailure) {
            Navigator.pop(context);
            CustomSnackBar.showErrorMessage(context, state.error);
          }
          if (state.status.isInProgress) {
            CustomDialog.showLoadingDialog(context);
          }
        },
        builder: (BuildContext context, AuthState state) {
          return Padding(
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
                        decoration: const InputDecoration(prefixIcon: Icon(Icons.email), hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: AppValidators.validateEmail,
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: context.read<AuthBloc>().passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
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
