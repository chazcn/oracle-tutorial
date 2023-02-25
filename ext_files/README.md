# 使用外部表示例

Oracle 可以通过创建外部表以只读的方式来查询外部数据文件的内容。

修改并运行脚本 **5.ot_external_table.sql** 实现如下操作：

1. 使用 **sys** 用户登录，为 **ot** 用户增加创建 *目录对象* 的权限

   ```sql
   GRANT CREATE ANY DIRECTORY TO OT;
   ```

2. 登录 **ot** 用户，创建指向数据文件所在位置的目录对象，可以同时创建指向访问日志及错误信息的目录对象

   ```sql
   CREATE OR REPLACE DIRECTORY ot_data_dir AS 'your_directory\ext_files\data';
   CREATE OR REPLACE DIRECTORY ot_log_dir AS 'your_directory\ext_files\log';
   CREATE OR REPLACE DIRECTORY ot_bad_dir AS 'your_directory\ext_files\bad';
   ```

3. 使用 **CREATE TABLE** 语句建表，并使用 **ORGANIZATION EXTERNAL** 子句指定其为外部表
