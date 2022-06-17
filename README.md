# 广州大学红色长廊

web开发项目

## 实现功能

1. 用户注册、登录、注销、修改个人信息
2. 首页轮播图（使用swiper）
3. 文章评论
4. 抢答小游戏

## MySQL创建表

数据库名 `hongdb`

```sql
create table user
(
    uid      varchar(32)  not null
        primary key,
    username varchar(20)  not null,
    password varchar(20)  not null,
    name     varchar(20)  not null,
    age      int unsigned null
);

create table comments
(
    aid      int unsigned null,
    username varchar(20)  not null,
    comment  text         null
);
```

## 关于项目

1. 选修课作业，应该不会再维护，请勿提issue
2. 如果对你有帮助希望点亮star