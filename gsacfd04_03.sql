-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2019 年 10 月 17 日 15:08
-- サーバのバージョン： 10.4.6-MariaDB
-- PHP のバージョン: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `gsacfd04_03`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `gs_bm_table`
--

CREATE TABLE `gs_bm_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `gs_bm_table`
--

INSERT INTO `gs_bm_table` (`id`, `name`, `url`, `comment`, `indate`) VALUES
(2, 'ハリーポッター', 'https://www.sayzansha.com/smp/harrypotter/', '  ページ数が多くて、手が疲れました。', '2019-10-06 15:49:09'),
(3, '起業の科学', 'https://honto.jp/netstore/pd-book_28630343.html', '  セミナーありがとうございました', '2019-10-09 20:43:40'),
(11, '役所窓口で1日200件を解決! 指導企業1000社のすごいコンサルタントが教えている クレーム対応 最強の話しかた', 'https://www.diamond.co.jp/book/9784478029039.html', ' 目から鱗でした。', '2019-10-10 20:02:08'),
(13, '図書館戦争シリーズ', 'https://promo.kadokawa.co.jp/toshokan-sensou/', '  SFだけどリアルな要素もあって、物語に入り込めました。', '2019-10-16 19:48:31'),
(15, 'サードドア', 'https://book.toyokeizai.net/thirddoor/', ' 最近人気らしい。', '2019-10-17 22:05:55');

-- --------------------------------------------------------

--
-- テーブルの構造 `php02_table`
--

CREATE TABLE `php02_table` (
  `id` int(12) NOT NULL,
  `task` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `php02_table`
--

INSERT INTO `php02_table` (`id`, `task`, `deadline`, `comment`, `indate`) VALUES
(2, 'kadai1', '2019-10-11', ' test', '2019-10-05 15:51:27'),
(3, 'kadai3', '2019-10-12', 'test', '2019-10-05 15:51:47'),
(4, 'kadai4', '2019-10-13', 'test', '2019-10-05 15:52:02'),
(5, 'kadai5', '2019-10-14', 'test', '2019-10-05 15:52:16'),
(6, 'kadai6', '2019-10-15', 'test6', '2019-10-05 15:52:29'),
(7, 'kadai7', '2019-10-16', 'test', '2019-10-05 15:52:42'),
(8, 'kadai8', '2019-10-17', 'test', '2019-10-05 15:52:56'),
(9, 'kadai9', '2019-10-18', 'test', '2019-10-05 15:53:08'),
(10, 'kadai10', '2019-10-19', 'test', '2019-10-05 15:53:21'),
(11, '今日の課題', '2019-10-05', 'qqq', '2019-10-05 17:11:15');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_table`
--

CREATE TABLE `user_table` (
  `id` int(12) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `lpw` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `kanri_flg` int(1) NOT NULL,
  `life_flg` int(1) NOT NULL,
  `indate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `user_table`
--

INSERT INTO `user_table` (`id`, `name`, `lid`, `lpw`, `kanri_flg`, `life_flg`, `indate`) VALUES
(1, 'なが', 'naga', 'naga01', 1, 0, '0000-00-00 00:00:00'),
(3, 'あ', 'a', 'a01', 1, 0, '2019-10-13 18:34:03'),
(4, 'てて', 'te', 'te01', 1, 1, '2019-10-13 18:35:07'),
(6, 'ち', 'ti', 'ti01', 0, 0, '2019-10-13 19:42:48'),
(7, 'な', 'a', 'na02', 1, 1, '2019-10-13 20:17:56');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `gs_bm_table`
--
ALTER TABLE `gs_bm_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `php02_table`
--
ALTER TABLE `php02_table`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `gs_bm_table`
--
ALTER TABLE `gs_bm_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- テーブルのAUTO_INCREMENT `php02_table`
--
ALTER TABLE `php02_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- テーブルのAUTO_INCREMENT `user_table`
--
ALTER TABLE `user_table`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
