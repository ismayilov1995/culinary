import 'package:culinary_app/blocs/auth/authentication_bloc.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserWelcomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final bool authenticated = state.status == AuthStatus.authenticated;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            title: AppText(
              'Welcome',
              color: Theme.of(context).helperTextColor,
              fontSize: 14,
            ),
            subtitle: AppText(
              authenticated ? state.auth!.user.name : 'Guest chef',
              font: 'Pacifico',
              fontSize: 26,
              color: Theme.of(context).textColor,
            ),
            trailing: PopupMenuButton(
              child: AppCircleAvatar(
                imagePath: authenticated
                    ? state.auth!.user.avatar
                    : 'https://static.wikia.nocookie.net/queen-of-the-south/images/e/e6/Kelly_anne_sacar_con_sifron_el_mar.jpg/revision/latest/top-crop/width/220/height/220?cb=20180718062632',
              ),
              onSelected: (dynamic v) =>
                  _onMenuItemSelect(context, v, state.auth),
              itemBuilder: (context) => [
                if (authenticated) ...[
                  PopupMenuItem(
                    child: Text('Write recipe'),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('Go to profile'),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Favorite'),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text('Logout'),
                    value: 3,
                  ),
                ] else ...[
                  PopupMenuItem(
                    child: Text('Login'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('Create account'),
                    value: 2,
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  void _onMenuItemSelect(BuildContext context, int v, Auth? auth) {
    switch (v) {
      case 0:
        ChefDetailScreen.route(context,
            email: auth!.user.email, id: auth.user.id, isUser: true);
        break;
      case 1:
        LoginScreen.route(context);
        break;
      case 2:
        RegisterScreen.route(context);
        break;
      case 3:
        context
            .read<AuthenticationBloc>()
            .add(AuthLogoutRequested(logOutAll: false));
        break;
      case 4:
        CreateRecipeScreen.route(context);
        break;
      case 5:
        CreateRecipeScreen.route(context);
        break;
    }
  }
}
