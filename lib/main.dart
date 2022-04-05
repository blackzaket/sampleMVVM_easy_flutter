import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_mvvm_easy/ui/viewmodel/player_viewmodel.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => PlayerViewModel())],
    child: const Player(),
  ));

  //sigle provider
  // runApp(Provider(
  //   create: (_) => PlayerViewModel(),
  //   child: const Player(),
  // ));
}

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //viewModel 참조
    var viewModel = Provider.of<PlayerViewModel>(context);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            const Spacer(),
            //viewModel 상태 정보로 View표현
            Text(viewModel.isPlaying ? "재생중" : "정지중"),
            GestureDetector(
              onTap: () {
                //viewModel 상태 정보 변경
                viewModel.playSwitch();
              },
              //viewModel 상태 정보로 View표현
              child: Icon(
                viewModel.isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                size: 80,
              ),
            ),
            const Spacer()
          ]),
        ),
      ),
    );
  }
}
