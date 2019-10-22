<?php
// 関数ファイルの読み込み
include('functions.php');

// getで送信されたidを取得
$id = $_GET['id'];

//DB接続します
$pdo = connectToDb();

//データ登録SQL作成，指定したidのみ表示する
$sql = 'SELECT *FROM gs_bm_table WHERE id=:id';
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute();

//データ表示
if ($status == false) {
  // エラーのとき
  showSqlErrorMsg($stmt);
} else {
  // エラーでないとき
  $rs = $stmt->fetch();
  // var_dump($rs);
  // fetch()で1レコードを取得して$rsに入れる
  // $rsは配列で返ってくる．$rs["id"], $rs["task"]などで値をとれる
  // var_dump()で見てみよう
}
?>


<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>読書履歴</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
  <style>
    div {
      padding: 10px;
      font-size: 16px;
    }
  </style>
</head>

<body>

  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">読んだ本を登録しよう</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="select.php">読んだ本一覧</a>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <form method="post" action="update.php">
    <div class="form-group">
      <label for="name">書籍名</label>
      <!-- 受け取った値をvaluesに埋め込もう -->
      <input type="text" class="form-control" id="name" name="name" value="<?= $rs["name"] ?>">
    </div>
    <div class="form-group">
      <label for="url">URL</label>
      <!-- 受け取った値をvaluesに埋め込もう -->
      <input type="text" class="form-control" id="url" name="url" value="<?= $rs["url"] ?>">
    </div>
    <div class="form-group">
      <label for="comment">感想</label>
      <!-- 受け取った値挿入しよう -->
      <textarea class="form-control" id="comment" name="comment" rows="3"> <?= $rs["comment"] ?></textarea>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-outline-info">送信</button>
    </div>
    <!-- idは変えたくない = ユーザーから見えないようにする-->
    <input type="hidden" name="id" value="<?= $id ?>">
  </form>

</body>

</html>