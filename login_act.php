<?php
//最初にSESSIONを開始！！
session_start();

//0.外部ファイル読み込み
include('functions.php');

//1.  DB接続&送信データの受け取り
$pdo = connectToDb();
$lid = $_POST['lid'];
$lpw = $_POST['lpw'];

//2. データ登録SQL作成
$sql = 'SELECT *FROM user_table WHERE lid=:lid AND lpw=:lpw AND life_flg=0';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':lid', $lid, PDO::PARAM_STR);
$stmt->bindValue(':lpw', $lpw, PDO::PARAM_STR);
$res = $stmt->execute();

//3. SQL実行時にエラーがある場合
if ($res == false) {
  showSqlErrorMsg($stmt);
}

//4. 抽出データ数を取得
$val = $stmt->fetch();

//5. 該当レコードがあればSESSIONに値を代入
if ($val['id'] != '') {
  $_SESSION = array();
  $_SESSION['session_id'] = session_id();
  $_SESSION['kanri_flg'] = $val['kanri_flg'];
  $_SESSION['name'] = $val['name'];

  //ログイン失敗の場合はログイン画面へ戻る
} else {
  header('Location:login.php');
  // echo ('error');
}

// 6.管理者ログインか、一般ログインか判別 
if ($val['kanri_flg'] == 1) {
  header('Location:user_select.php');
} else {
  header('Location:select.php');
}
exit();
