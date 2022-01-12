# SSM-Management-System
## 一个简单的SSM框架项目 Spring+SpringMVC+Mybatis
课题管理系统-6张表：
* Admin
 > id(char), name, password, permission_level
* Student
> id(char), name, sex, id_number, college, major
* Supervisor
> id(char), name, sex, id_number, college
* Project
> id(int), name, proposal_time, file_list, state, summary, jid
* Members
> id(int), director_id(char), executor_id(char) ... ...
* Journal
> id(int), name, publisher, impact_factor
---
表的设计不够合理，有些字段也没有使用到（admin -> __permission_level__），**t_journal**还未使用
#### 简单的练手项目
