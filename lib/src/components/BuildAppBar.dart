import 'dart:io';

import 'package:basic_calculator/src/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildAppbar extends StatefulWidget {
  const BuildAppbar({super.key});

  @override
  State<BuildAppbar> createState() => _BuildAppbarState();
}

class _BuildAppbarState extends State<BuildAppbar> with WidgetsBindingObserver {
  bool _hovering = false;
  bool isInForeground = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      isInForeground = state == AppLifecycleState.resumed;
    });

    if (state == AppLifecycleState.resumed) {
      print("✅ Aplicativo voltou para o foco (foreground)");
    } else if (state == AppLifecycleState.inactive) {
      print("⏸ Aplicativo saiu do foco (background)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          spacing: 10,
          children: [
            // Botão de sair "X"
            Container(
              width: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              height: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              color: AppColors.background,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: isInForeground
                        ? AppColors.buttonClose
                        : AppColors.buttonDark,
                    borderRadius: (Platform.isIOS || Platform.isAndroid)
                        ? const BorderRadius.all(
                            Radius.circular(16),
                          )
                        : const BorderRadius.all(
                            Radius.circular(8),
                          ),
                  ),
                  alignment: Alignment.center,
                  child: _hovering
                      ? const Icon(
                          FontAwesomeIcons.xmark,
                          size: 10,
                        )
                      : null,
                ),
              ),
            ),
            // Botão de minimizar "---"
            Container(
              width: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              height: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              color: AppColors.background,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: isInForeground
                        ? AppColors.buttonMinimization
                        : AppColors.buttonDark,
                    borderRadius: (Platform.isIOS || Platform.isAndroid)
                        ? const BorderRadius.all(
                            Radius.circular(16),
                          )
                        : const BorderRadius.all(
                            Radius.circular(8),
                          ),
                  ),
                  alignment: Alignment.center,
                  child: _hovering
                      ? const Icon(
                          FontAwesomeIcons.minus,
                          size: 10,
                        )
                      : null,
                ),
              ),
            ),
            // Botão sem ação
            Container(
              width: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              height: (Platform.isIOS || Platform.isAndroid) ? 24 : 12,
              color: AppColors.background,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.buttonDark,
                    borderRadius: (Platform.isIOS || Platform.isAndroid)
                        ? const BorderRadius.all(
                            Radius.circular(16),
                          )
                        : const BorderRadius.all(
                            Radius.circular(8),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
