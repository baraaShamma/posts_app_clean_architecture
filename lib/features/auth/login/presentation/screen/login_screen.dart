import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_app_clean_architecture/app/app_preferences.dart';
import 'package:posts_app_clean_architecture/app/navigation/app_route.dart';
import 'package:posts_app_clean_architecture/app/util/snackbar_message.dart';
import 'package:posts_app_clean_architecture/app/widgets/loading_widget.dart';
import 'package:posts_app_clean_architecture/features/auth/login/domain/entities/login.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/bloc/login/login_bloc.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/widget/button-auth-widget.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/widget/logo_auth_widget.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/widget/text_body_auth_widget.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/widget/text_form_auth_widget.dart';
import 'package:posts_app_clean_architecture/features/auth/login/presentation/widget/text_title_auth_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app_clean_architecture/injection_container.dart';
import 'package:posts_app_clean_architecture/app/constant/colors.dart';
import 'package:posts_app_clean_architecture/resources/constant/values_manager.dart';
import 'package:posts_app_clean_architecture/resources/function/valid_input.dart';
import 'package:posts_app_clean_architecture/resources/localization/language_drop_down_form_field.dart';
import 'package:posts_app_clean_architecture/resources/localization/language_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Login login = Login(email: '', password: '');

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() => AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '1'.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.black,
              ),
        ),
      );

  Widget _buildBody() {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: AppSizeH.s5, horizontal: AppSizeW.s10),
      child: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) async {
              if (state is LoadingLoginState) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LoadingWidget();
                    });
              } else if (state is ErrorLoginState) {
                context.pop();
                return SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
              if (state is SuccessLoginState) {
                context.pop();

                context.goNamed(RoutesNames.postsScreen);
                return SnackBarMessage()
                    .showSuccessSnackBar(message: "18".tr(), context: context);
              }
            },
            builder: (context, state) {
              return Column(children: [
                const LogoAuthWidget(),
                TextTitleAuthWidget(text: "2".tr()),
                SizedBox(height: AppSizeH.s20),
                TextBodyAuthWidget(text: "3".tr()),
                SizedBox(height: AppSizeH.s40),
                TextFormAuthWidget(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 100, "email", context);
                  },
                  myController: email,
                  hintText: "4".tr(),
                  iconData: Icons.alternate_email_outlined,
                  labelText: "8".tr(),
                ),
                TextFormAuthWidget(
                  onTapIcon: () {},
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 5, 30, "password", context);
                  },
                  myController: password,
                  hintText: "5".tr(),
                  iconData: Icons.lock_outline_rounded,
                  labelText: "9".tr(),
                ),
                SizedBox(height: AppSizeH.s40),
                ButtonAuthWidget(
                    text: "7".tr(),
                    onPressed: () {
                      login.email = email.text;
                      login.password = password.text;
                      var formData = _formState.currentState;
                      if (formData!.validate()) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(ClickButtonLoginEvent(login: login));
                      }
                    }),
                SizedBox(height: AppSizeH.s10),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
