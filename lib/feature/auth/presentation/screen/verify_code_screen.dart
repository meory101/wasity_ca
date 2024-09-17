import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wasity_captin/core/storage/shared/shared_pref.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/signin_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/request/verify_code_request_entity.dart';
import 'package:wasity_captin/feature/auth/domain/entity/response/signin_response_entity.dart';
import 'package:wasity_captin/feature/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';

import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/button/main_app_button.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';

class VerifyCodeScreen extends StatefulWidget {
  final VerifyCodeArgs args;

  const VerifyCodeScreen({super.key, required this.args});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  TextEditingController codeController = TextEditingController();
  VerifyCodeRequestEntity entity = VerifyCodeRequestEntity();

  void verifyCode() {
    entity.otpCode = codeController.text;
    entity.type = widget.args.siginRequestEntity.type;
    entity.number = widget.args.siginRequestEntity.number;
    context.read<VerifyCodeCubit>().verifyCode(entity: entity);
  }

  @override
  void initState() {
    codeController.text = widget.args.siginResponseEntity.otpCode.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w4),
          child: Column(
            children: [

              SizedBox(
                height: AppHeightManager.h20,
              ),
              AppTextWidget(
                text: "Verify Your Number",
                fontSize: FontSizeManager.fs22,
                color: AppColorManager.white,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: AppHeightManager.h1,
              ),
              RichText(
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Please Enter The 6 digit Code Sent To Your",
                  style: TextStyle(
                    fontFamily: FontFamilyManager.cairo,
                    fontSize: FontSizeManager.fs16,
                    color: AppColorManager.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: " ${"For Verification"}",
                        style: TextStyle(
                          fontFamily: FontFamilyManager.cairo,
                          fontSize: FontSizeManager.fs16,
                          color: AppColorManager.yellow,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: AppHeightManager.h2,
              ),
              Center(
                child: Pinput(
                  controller: codeController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  onCompleted: (value) {
                    setState(() {
                      codeController.text = value;
                      verifyCode();
                    });

                  },
                  length: 6,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  defaultPinTheme: PinTheme(
                      textStyle: TextStyle(
                        fontSize: FontSizeManager.fs16,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: AppWidthManager.w05),
                      decoration: BoxDecoration(
                        color: AppColorManager.white,
                        boxShadow: const [
                          BoxShadow(
                            color: AppColorManager.shadow,
                            blurRadius: 5,
                            spreadRadius: 0,
                            offset:
                                // changes position of shadow
                                Offset(3, 5),
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(AppRadiusManager.r10),
                      ),
                      height: AppHeightManager.h6,
                      width: AppWidthManager.w11),
                ),
              ),
              SizedBox(
                height: AppHeightManager.h5,
              ),
              BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.success) {
                    AppSharedPreferences.cacheAuthUserInfo(
                        token: state.verifyCodeResponseEntity.token.toString(),
                        phoneNumber:
                            widget.args.siginRequestEntity.number ?? "",
                        userId: widget.args.siginResponseEntity.deliveryManId
                            .toString());
                    Navigator.of(context).pushNamed(
                        RouteNamedScreens.profile);
                  }
                  if (state.status == CubitStatus.error) {
                    return NoteMessage.showErrorSnackBar(
                        context: context, text: "Please Check Otp");
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
                    onTap: () {
                      verifyCode();
                    },
                    borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                    height: AppHeightManager.h6,
                    alignment: Alignment.center,
                    color: AppColorManager.yellow,
                    child: AppTextWidget(
                        text: "Verify",
                        color: AppColorManager.white,
                        fontWeight: FontWeight.w600,
                        fontSize: FontSizeManager.fs16),
                  );
                },
              ),
              SizedBox(
                height: AppHeightManager.h2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyCodeArgs {
  SigninRequestEntity siginRequestEntity;
  SigninResponseEntity siginResponseEntity;

  VerifyCodeArgs(
      {required this.siginRequestEntity, required this.siginResponseEntity});
}
