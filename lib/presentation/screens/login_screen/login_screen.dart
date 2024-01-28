import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tezz_cafe/core/route/ruotes.dart';
import 'package:tezz_cafe/presentation/widgets/textfield.dart';
import 'package:tezz_cafe/utils/colors/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(

          children: [
            Center(
              child: Container(
                  padding: const EdgeInsets.all(50),
                  decoration: const BoxDecoration(

                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor),
                  child: const Text('Login Screen')),
            ),
            const Gap(32),
            const GlobalTextField(
2

                prefixIcon: Icons.email,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                caption: "Email"),
            const GlobalTextField(
                prefixIcon: Icons.lock,
                hintText: "Password",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                caption: "Password"),
            const Gap(24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => context.pushNamed(RouteNames.home),
              child: const Center(child: Text('Kirish', style: TextStyle(fontSize: 18,color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
