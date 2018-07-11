# 20180612リリース内容

#### 修正内容はここ記載

# 対象ファイル
## 新規
```
```

## 更新
```
hyperion-job.com/data/Smarty/templates/default/products/detail.tpl
hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl
sp.hyperion-job.com/src/Controller/Component/CommonComponent.php
sp.hyperion-job.com/src/Controller/Component/JobInfoComponent.php
sp.hyperion-job.com/src/Controller/Component/UserComponent.php
sp.hyperion-job.com/src/Controller/JobDetailController.php
sp.hyperion-job.com/src/Template/Email/text/apply_mail_jp.ctp
sp.hyperion-job.com/src/Template/Email/text/apply_mail_vn.ctp
sp.hyperion-job.com/src/Template/Email/text/regist_success_mail_vn.ctp
sp.hyperion-job.com/src/Template/SearchJob/index.ctp
vn.hyperion-job.com/data/Smarty/templates/default/products/detail.tpl
vn.hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl
vn.hyperion-job.com/data/class/helper/SC_Helper_Mail.php

```

## 削除
```
```

# 事前準備

 * developブランチをmasterブランチにmergeする

 * masterブランチにリリースタグを付与する release20180405

差分ファイルは、リリースタグ付与後に下記のコマンドで行う。
# 差分ファイル作成
```
git archive --format=zip phuong_multi_lang `git diff --name-only --diff-filter=CMRD phuong_multi_lang develop` -o 20180612_hyp_job_release.zip
```

#### バックアップディレクトリの作成
```
mkdir /tmp/phuongtx/backup.`date +%Y%m%d`/
```

#### テーブルのバックアップ（今回不要）
```
```

#### crontabのバックアップ（今回不要）
```
```

## phpファイル修正
#### backup
```
cd /var/www/test/
cp -p --parents	hyperion-job.com/data/Smarty/templates/default/products/detail.tpl	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Controller/Component/CommonComponent.php	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Controller/Component/JobInfoComponent.php	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Controller/Component/UserComponent.php	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Controller/JobDetailController.php	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Template/Email/text/apply_mail_jp.ctp	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Template/Email/text/apply_mail_vn.ctp	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Template/Email/text/regist_success_mail_vn.ctp	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	sp.hyperion-job.com/src/Template/SearchJob/index.ctp	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	vn.hyperion-job.com/data/Smarty/templates/default/products/detail.tpl	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	vn.hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl	/tmp/phuongtx/backup.`date +%Y%m%d`/
cp -p --parents	vn.hyperion-job.com/data/class/helper/SC_Helper_Mail.php	/tmp/phuongtx/backup.`date +%Y%m%d`/

```

# リリース本作業

#### GUI管理画面からの更新作業

###### LP管理データの作成
- 管理画面 ＞ デザイン管理 ＞ PC ＞ レイアウト設定
    - ページを新規入力
        - 名称: 2015年新車登録台数ランキング
        - URL: 2015newcar_ranking
        - [x] 共通のヘッダーを使用する
        - [x] 共通のフッターを使用する

* ページの内容は、ファイルで管理するため入力不要

#### テーブルの更新　（phpPgAdminから作業）（今回不要）
- 「結果のページ分割処理を行う」のチェックを外す
```
```

## copy
```
sudo cp -rp /tmp/phuongtx/phuong_20180710/hyperion-job.com/data /var/www/test/hyperion-job.com
sudo cp -rp /tmp/phuongtx/phuong_20180710/hyperion-job.com/html /var/www/test/hyperion-job.com
```
```
sudo cp -rp /tmp/phuongtx/phuong_20180710/vn.hyperion-job.com/data /var/www/test/vn.hyperion-job.com
sudo cp -rp /tmp/phuongtx/phuong_20180710/vn.hyperion-job.com/html /var/www/test/vn.hyperion-job.com
```
```
sudo cp -rp /tmp/phuongtx/phuong_20180710/sp.hyperion-job.com/src /var/www/test/sp.hyperion-job.com
```

#### copy 結果確認
###### diffコマンドでの確認
```
LC_ALL=C diff -qr --strip-trailing-cr /tmp/phuongtx/phuong_20180710/hyperion-job.com/ /var/www/test/hyperion-job.com/ | grep -v '^Only in'
```
```
LC_ALL=C diff -qr --strip-trailing-cr /tmp/phuongtx/phuong_20180710/vn.hyperion-job.com/ /var/www/test/vn.hyperion-job.com/ | grep -v '^Only in'
```
* 差分がないこと

#### crontabの設定（今回不要）

#### キャッシュのクリア

###### 全て削除
```
rm -f /var/www/test/hyperion-job.com/data/cache/*
rm -f /var/www/test/hyperion-job.com/data/Smarty/templates_c/admin/*
rm -f /var/www/test/hyperion-job.com/data/Smarty/templates_c/default/*
```
```
rm -f /var/www/test/vn.hyperion-job.com/data/cache/*
rm -f /var/www/test/vn.hyperion-job.com/data/Smarty/templates_c/admin/*
rm -f /var/www/test/vn.hyperion-job.com/data/Smarty/templates_c/default/*
```

## 確認項目

# recovery

#### ファイルの戻し
```
 # 新規追加したファイルの削除
 #
 # 新規追加したディレクトリの削除
 #
 # 変更したファイルを戻す
 #cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/hyperion-job.com/data/Smarty/templates/default/products/detail.tpl	/var/www/test/hyperion-job.com/data/Smarty/templates/default/products/detail.tpl
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl	/var/www/test/hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Controller/Component/CommonComponent.php	/var/www/test/sp.hyperion-job.com/src/Controller/Component/CommonComponent.php
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Controller/Component/JobInfoComponent.php	/var/www/test/sp.hyperion-job.com/src/Controller/Component/JobInfoComponent.php
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Controller/Component/UserComponent.php	/var/www/test/sp.hyperion-job.com/src/Controller/Component/UserComponent.php
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Controller/JobDetailController.php	/var/www/test/sp.hyperion-job.com/src/Controller/JobDetailController.php
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Template/Email/text/apply_mail_jp.ctp	/var/www/test/sp.hyperion-job.com/src/Template/Email/text/apply_mail_jp.ctp
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Template/Email/text/apply_mail_vn.ctp	/var/www/test/sp.hyperion-job.com/src/Template/Email/text/apply_mail_vn.ctp
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Template/Email/text/regist_success_mail_vn.ctp	/var/www/test/sp.hyperion-job.com/src/Template/Email/text/regist_success_mail_vn.ctp
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/sp.hyperion-job.com/src/Template/SearchJob/index.ctp	/var/www/test/sp.hyperion-job.com/src/Template/SearchJob/index.ctp
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/vn.hyperion-job.com/data/Smarty/templates/default/products/detail.tpl	/var/www/test/vn.hyperion-job.com/data/Smarty/templates/default/products/detail.tpl
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/vn.hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl	/var/www/test/vn.hyperion-job.com/data/Smarty/templates/default/user_data/apply_popup.tpl
#cp -p	/tmp/phuongtx/backup.`date +%Y%m%d`/vn.hyperion-job.com/data/class/helper/SC_Helper_Mail.php	/var/www/test/vn.hyperion-job.com/data/class/helper/SC_Helper_Mail.php

```

#### crontabの戻し（今回不要）
```
```

#### DB構造の戻し(今回不要)
```
```

#### DBデータの戻し（今回不要）
```
```

#### キャッシュのクリア
###### 全て削除
```
rm -f /var/www/testjp.hyperion-job.jp/data/cache/*
```
```
rm -f /var/www/testvn.hyperion-job.jp/data/cache/*
```
