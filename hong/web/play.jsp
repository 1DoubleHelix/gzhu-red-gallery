<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>党史知识答题</title>
    <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/play.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<!-- 头部 -->
<div class="header">
    <p>广州大学红色文化长廊</p>
</div>

<div class="content">
    <!-- 选项卡片 -->
    <div class="card" id="ctcard" style="display: none;">
        <!-- 题目 -->
        <p><span id="title"></span><br></p>
        <!-- 选项 -->
        <p id="content" class="content"></p>
        <form action="">
            <input type="radio" name="radioGroup" value="0"><label id="answer0"></label>
            <input type="radio" name="radioGroup" value="1"><label id="answer1"></label>
            <input type="radio" name="radioGroup" value="2"><label id="answer2"></label>
            <input type="radio" name="radioGroup" value="3"><label id="answer3"></label>
            <input type="button" onclick="showSelected()" value="提交">
        </form>
    </div>

    <!-- 跑马灯卡片 -->
    <div class="card">
        <p style="font-size: 15px">点击“开始”按钮进行答题，回答正确显示党徽，回答错误显示红色方块</p>
        <p style="font-size: 15px"><a href="index.jsp">返回首页</a></p>
        <ul id='uls'>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li>
                <button id='btn_start'>开始</button>
                <button id='btn_stop'>停止</button>
            </li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>

</div>
<!-- 页脚 -->
<div class="footer">
    <div class="foot-content">
        <img src="img/gzhu.png" alt="gzhu_logo">
        <p>邮编：510006 通讯地址：广州市大学城外环西路230号</p>
    </div>
</div>
</body>

<script>
    obj = {
        "topics": [

            {
                "title": "( )拉开了中国民主主义革命的帷幕",
                "answer": "1",
                "content": [
                    "新文化运动",
                    "五四运动",
                    "中国共产党成立",
                    "五卅运动"
                ]
            },

            {
                "title": "( ),中国共产党第一次全国代表大会在( )开幕",
                "answer": "2",
                "content": [
                    "1921年7月1日,南京",
                    "1921年7月21日,上海",
                    "1921年7月23日,上海",
                    "1921年7月30日,南京"
                ]
            },

            {
                "title": "( )第一次提出明确的反帝反封建的民主革命纲领",
                "answer": "1",
                "content": [
                    "中共一大",
                    "中共二大",
                    "中共三大",
                    "中共四大"
                ]
            },

            {
                "title": "国共合作实现后,以( )为中心,很快开创了反对帝国主义和封建军阀的革命新局面",
                "answer": "3",
                "content": [
                    "天津", "上海", "杭州", "广州"
                ]
            },

            {
                "title": "中共四大时,全国党员人数是( )",
                "answer": "2",
                "content": [
                    "594人",
                    "794人",
                    "994人",
                    "1594人"
                ]
            },

            {
                "title": "( )标志着中国共产党独立地领导革命战争创建人民军队和武装夺取政权的开始",
                "answer": "1",
                "content": [
                    "武昌起义",
                    "南昌起义",
                    "秋收起义",
                    "广州起义"
                ]
            },

            {
                "title": "1929年( )决议的中心思想是要用无产阶级思想进行军队和党的建设",
                "answer": "1",
                "content": [
                    "遵义会议",
                    "古田会议",
                    "八七会议",
                    "龙岩会议"
                ]
            },

            {
                "title": "( )以后,中日之间的民族矛盾逐渐上升为主要矛盾,中国国内的阶级关系发生重大变动",
                "answer": "1",
                "content": [
                    "卢沟桥事变",
                    "九一八事变",
                    "天津事变",
                    "西安事变"
                ]
            },

            {
                "title": "( )毛泽东总结经验,作了《论持久战》的长篇讲演",
                "answer": "2",
                "content": [
                    "1931年",
                    "1935年",
                    "1938年",
                    "1945年"
                ]
            },

            {
                "title": "( )4月23日,中共七大在延安杨家岭开幕",
                "answer": "2",
                "content": [
                    "1941年",
                    "1943年",
                    "1945年",
                    "1947年"
                ]
            }
        ]
    }
    var btn_start = document.getElementById("btn_start");
    var btn_stop = document.getElementById("btn_stop");
    var arr = [0, 1, 2, 5, 8, 7, 6, 3]; //按这个下标依次旋转
    var lis = document.getElementsByTagName("li");
    var answer_checker = true; //答案正确状态，间接改变方块颜色
    // var chooseTopic = Math.floor(Math.random() * 10); //生成0到9之间的随机整数
    var chooseTopic = 0;
    var num = 0; //定义初识下标

    //开始答题
    btn_start.onclick = function () {
        // 显示答题卡片
        document.getElementById("ctcard").style.display = "block";
        btn_start.disabled = true;
        //跑马灯部分
        time = setInterval(function () {
            lis[arr[num]].className = "";
            num++;
            if (num > 7) {
                num = 0;
            }
            if (answer_checker == true) {
                // 方块变为党徽
                lis[arr[num]].className = "tblock";
            } else {
                // 方块变红
                lis[arr[num]].className = "fblock";
            }
        }, 1000) //每1000毫秒跳动一次

        //答题部分
        document.getElementById("title").innerHTML = "题目：" + obj.topics[chooseTopic].title;
        // document.getElementById("content").innerHTML = "请选择：<br>";
        //显示题目
        document.getElementById("title").innerHTML = "题目：" + obj.topics[chooseTopic].title;
        for (i = 0; i < 4; i++) {
            document.getElementById("answer" + i).innerHTML = obj.topics[chooseTopic].content[i];
        }

    }

    //停止按钮
    btn_stop.onclick = function () {
        // 隐藏答题卡片
        document.getElementById("ctcard").style.display = "none";
        btn_start.disabled = false;
        clearInterval(time);
    }

    function showSelected() {
        var radios = document.getElementsByName("radioGroup");
        for (let i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                // alert("你选中的是第" + (i + 1) + "个选项，值是" + radios[i].value);
                if (i == obj.topics[chooseTopic].answer) {
                    //回答正确
                    answer_checker = true;
                    document.getElementById("title").innerHTML = "题目：" + obj.topics[chooseTopic].title;
                    for (i = 0; i < 4; i++) {
                        document.getElementById("answer" + i).innerHTML = obj.topics[chooseTopic].content[i];
                    }
                } else {
                    //回答错误
                    answer_checker = false;
                    document.getElementById("title").innerHTML = "题目：" + obj.topics[chooseTopic].title;
                    for (i = 0; i < 4; i++) {
                        document.getElementById("answer" + i).innerHTML = obj.topics[chooseTopic].content[i];
                    }
                }
                if (chooseTopic > 8) {
                    chooseTopic = 0
                } else {
                    chooseTopic++;
                }
                break;
            }
        }
    }

</script>

</html>
