import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:k/cubit/mode_cubit/mode_cubit.dart';
import 'package:k/cubit/mode_cubit/mode_states.dart';

class customModeButon extends StatefulWidget {
  const customModeButon({
    super.key,
  });

  @override
  State<customModeButon> createState() => _customModeButonState();
}

class _customModeButonState extends State<customModeButon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _postionAnim;
  late Animation<double> _angleAnim;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 170),
    );
    _postionAnim = Tween<Offset>(
      begin: Offset(-30, 0),
      end: Offset(30, 0),
    ).animate(_controller);
    _angleAnim = Tween<double>(begin: 2, end: 6).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, ModeCubitStates>(
      builder: (context, state) {
        if (state is lightModeState) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _angleAnim.value,
              origin: _postionAnim.value,
              child: Transform.translate(
                offset: _postionAnim.value,
                child: GestureDetector(
                  onTap: () {
                    if (context.read<ModeCubit>().modeIs()) {
                      _controller.reverse();
                      BlocProvider.of<ModeCubit>(context).mode();
                    } else {
                      _controller.forward();
                      BlocProvider.of<ModeCubit>(context).mode();
                    }
                  },
                  child: Container(
                    child: Icon(
                      context.read<ModeCubit>().modeIs()
                          ? FontAwesomeIcons.solidMoon
                          : FontAwesomeIcons.solidSun,
                      size: 30,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
