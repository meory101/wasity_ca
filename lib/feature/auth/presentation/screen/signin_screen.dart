import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasity_captin/core/resource/cubit_status_manager.dart';
import 'package:wasity_captin/core/widget/snack_bar/note_message.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:wasity_captin/feature/auth/presentation/screen/verify_code_screen.dart';
import 'package:wasity_captin/router/router.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final formKey = GlobalKey<FormState>();
  SigninRequestEntity entity = SigninRequestEntity();
  int maxLength = 10;

  @override
  void initState() {
    super.initState();
  }

  onSingInClicked() async {
    context.read<SigninCubit>().signIn(entity: entity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(AppWidthManager.w3Point8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppHeightManager.h15,
                    ),
                    AppTextWidget(
                      text: "Sign In To Wasity.",
                      color: AppColorManager.white,
                      fontSize: FontSizeManager.fs20,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      height: AppHeightManager.h1point8,
                    ),
                    AppTextWidget(
                      text:
                          "Sign In Using Your Phone Number As Wasity Delivery Man And Start Making money.",
                      color: AppColorManager.white,
                      fontSize: FontSizeManager.fs16,
                      height: AppHeightManager.h02,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(
                      height: AppHeightManager.h7,
                    ),
                    TitleAppFormFiled(
                      textInputType: TextInputType.number,
                      hint: "09xxxxxxxx",
                      title: "Phone Number",
                      onChanged: (value) {
                        entity.number = value;
                        entity.type = "1";
                        return null;
                      },
                      validator: (value) {
                        if ((value ?? "").isEmpty) {
                          return 'Enter phone number';
                        }
                        if (value?.length != 10) {
                          return 'Enter valid phone number';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppWidthManager.w2point5),
                      child: AppTextWidget(
                          text: "phone number",
                          color: AppColorManager.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: FontSizeManager.fs14),
                    ),
                    SizedBox(
                      height: AppHeightManager.h5,
                    ),
                    BlocConsumer<SigninCubit, SigninState>(
                      listener: (context, state) {
                        print(state);
                        if (state.status == CubitStatus.success) {
                          NoteMessage.showSuccessSnackBar(
                              context: context,
                              duration: 4,
                              text: state.signinResponseEntity.otpCode
                                  .toString());
                          Navigator.of(context).pushNamed(
                              RouteNamedScreens.verifyCode,
                              arguments: VerifyCodeArgs(
                                  siginRequestEntity: entity,
                                  siginResponseEntity:
                                      state.signinResponseEntity));
                        }

                      },
                      builder: (context, state) {
                        if (state.status == CubitStatus.loading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColorManager.yellow,
                            ),
                          );
                        }

                        return MainAppButton(
                          onTap: onSingInClicked,
                          height: AppHeightManager.h6,
                          alignment: Alignment.center,
                          color: AppColorManager.yellow,
                          borderRadius:
                              BorderRadius.circular(AppRadiusManager.r15),
                          child: AppTextWidget(
                              text: "Sign In",
                              color: AppColorManager.white,
                              fontWeight: FontWeight.w400,
                              fontSize: FontSizeManager.fs16),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
