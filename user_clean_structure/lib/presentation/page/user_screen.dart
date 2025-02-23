import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/user_cubit.dart';
import 'widget/user_card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        final state = context.read<UserCubit>().state;
        if (state is UserLoaded && !state.hasReachedMax) {
          context.read<UserCubit>().fetchUsers(isLoadMore: true);
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách người dùng'),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial || state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return RefreshIndicator(
              displacement: 10,
              onRefresh: () async {
                context.read<UserCubit>().fetchUsers(isLoadMore: false);
              },
              child: ListView.builder(
                controller: scrollController,
                itemCount: state.hasReachedMax ? state.users.length : state.users.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.users.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final user = state.users[index];
                  return Column(
                    children: [
                      UserCard(user: user),
                      const SizedBox(height: 16),
                    ],
                  );
                },
              ),
            );
          } else if (state is UserError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
