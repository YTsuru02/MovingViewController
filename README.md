# MovingViewController
  ユーザーがこのライブラリを使うに当たって、コーディングする処理は以下の通りである。
　*01.操作したいView（MovingView）を作成する。
　*02.MovingViewを操作するコントローラーのView（MovingViewController）を作成する。
　*03.移動する上限を表すView（TargetTopView）を作成する。
　*04.移動する下限を表すView（TargetBottomView）を作成する。
　*（05.もし操作したいViewに対して、連動させるViewがある場合、そのView（BackgroundView）を作成する。）
　*05.MovingViewControllerのボトムとMovingViewのトップを距離を0でConstraintを掛ける。
　*06.MovingViewControllerのボトムとTargetBottomViewの距離を任意の値でConstraintを掛ける。
　*07.現在適用しようとしているViewContrllerのViewによって、MovingViewControllerクラスのインスタンスを作成する。
　*08.MovingViewControllerクラスに定義されているプロパティ（MovingView、MovingViewController、TargetTopView、TargetBottomView、BackgroundView）を設定する。
　*09.MovingViewControllerクラスのインスタンスメソッド、set()を呼び出す。
　
  これらの処理を行う事によって、以下の処理を実現出来る。
　*01.MovingViewControllerを指でスライド、スワイプする事によって、それに応じてMovingViewを動かす事が出来る。
