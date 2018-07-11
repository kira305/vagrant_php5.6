# Các lệnh Git thường dùng
***
## Quy định về git
    1. Tạo branch từ develop và đặt tên theo Task trên Backlog
    2. Chỉ làm việc trên branch đã được tạo ra và chỉ merge vào develop khi có yêu cầu
    3. Thỉnh thoảng cần phải rebase develop để lấy source mới nhất về branch
    4. Khi Release cần phải merge vào develop và master
    5. Sau đó tạo Tag Release từ master với tên đặt là releaseYYYYMMDD
***
## 1. Gom các lần commit
    1. Có bao nhiêu lần commit thì thêm ngần đấy dấu ~
```
    Ví dụ : Gom 3 lần commit lại như sau
    git rebase -i HEAD~~~
```
    2. Giữ lại 1 message đầu tiên còn lại chuyển từ pick thành s
    3. Push lên origin branch với chế độ force
    * chú ý khi push -f thì các member khác cần phải xóa branch local và lấy lại từ origin
```
    git push -f
```

## 2. Rebase master hoặc develop (áp dụng khi muốn lấy source mới nhất từ master về)
    1. git rebase master
    2. Trên Eclipse xử lý conflict băng Team -> Merge Tool
    3. Sửa xong file nào thì dùng Team -> Add Index
    4. Sau đó gõ lệnh:
```
    git rebase --continue
```
    * Nếu muốn hủy rebase thì gõ lệnh:
```
    git rebase --abort
```
    5. Push lên origin branch với chế độ force (cưỡng chế)
    * chú ý khi push -f thì các member khác cần phải xóa branch local và lấy lại từ origin
```
    git push -f
```

## 3. Xóa Tag bằng command
    1. Lấy Tag từ origin về local
```
    git push origin:release20170613
```
    2. Sau đó xóa Tag trên Local trước
    3. Cuối cùng mới xóa Tag trên origin

## 4. Tạo branch
```
    git checkout develop
    git branch branch_name
    git checkout branch_name
    git add.
```

## 5. commit
```
    git commit -m "message"
```
    * Hủy commit
```
    git reset commit

    or (SourceTree : chỉ hủy Commit Tree chứ ko hủy code)

    git reset --soft HEAD~1

    or (Hủy cả Commit Tree và Code)

    git reset --hard ORIG_HEAD
```

## 6. Merge mà vẫn giữ nguyên các trạng thái commit trước đó
```
    git merge branch_name --no-ff
```

## 7. Hủy Merge (Hủy cả Commit Tree và Code)
* Hủy trên Local
```
    git reset --hard ORIG_HEAD
```
* Hủy trên Origin (--dry-run : dùng để test trước khi hủy thật sự)
```
    git push origin -f branch_name:branch_name --dry-run

```
## 8. Lấy danh sách file đã thay đổi từ của branch so với develop
```
    git diff --name-only branch_name develop

    or

    git diff master --diff-filter=D --name-only
```

## 9. Lấy danh sách file đã thay đổi từ của branch so với develop rồi đưa vào file zip
* A : New   C : Copy  M : Modify  R : Rename
```
    git archive --format=zip branch_name `git diff --name-only branch_name develop` -o xxxDiff.zip
```
    * Loại bỏ file được tạo mới (new)
```
    git archive --format=zip branch_name `git diff --diff-filter=ACMR --name-only branch_name develop` -o xxxDiff.zip
```
    * Loại bỏ file bị xóa (delete)
```
    git archive --format=zip branch_name `git diff --diff-filter=CMRD --name-only branch_name develop` -o xxxDiff.zip
```

## 10. Làm mới cưỡng chế
```
    git fetch --prune origin
```

## 11. Thiết lập ký tự xuống dòng của Unix là LF
```
  git config --global core.autocrlf false
```

## 12. Thay đổi Commiter và Author
```
●GitのCommitter と Author の違いについて
http://kz-engineer-scrap.hatenablog.com/entry/2016/04/05/032916

●Git の Commit Author と Commiter を変更する
https://qiita.com/sea_mountain/items/d70216a5bc16a88ed932
$ git filter-branch -f --env-filter "GIT_AUTHOR_NAME='sea_mountain'; GIT_AUTHOR_EMAIL='valid_email@example.com'; GIT_COMMITTER_NAME='sea_mountain'; GIT_COMMITTER_EMAIL='valid_email@example.com';" HEAD 
```
## 11. Markdown記述
https://qiita.com/tbpgr/items/989c6badefff69377da7
