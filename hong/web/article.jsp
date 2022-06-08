<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>所有文章</title>
    <link rel="icon" href="img/favicon.ico">
    <link rel="stylesheet" href="css/index.css" id="cssLink">
    <link rel="stylesheet" href="css/comment.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
    <script src="https://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
</head>

<body>
<!-- 头部 -->
<div class="header">
    <p>广州大学红色文化长廊</p>
</div>

<!-- 导航栏 -->
<div class="topnav">
    <ul>
        <li><a href="index">首页</a></li>
        <li><a href="play.jsp">答题</a></li>
        <%--session没有值，未登录状态--%>
        <c:if test="${empty user }">
            <li><a href="login.jsp">登录</a></li>
            <li><a href="register.jsp">注册</a></li>
        </c:if>
        <%--session有值，已登录状态--%>
        <c:if test="${!empty user }">
            <li><a href="${pageContext.request.contextPath}/updateinfo.jsp">当前登录：${ user.username }</a></li>
            <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
        </c:if>
    </ul>
</div>

<!-- 字体大小选择 下拉菜单 -->
<div class="dropdown">
    <button class="dropbtn">字体大小</button>
    <div class="dropdown-content">
        <a href="javascript:void(0);" onclick="changeFontSize(15)">小</a>
        <a href="javascript:void(0);" onclick="changeFontSize(20)">中</a>
        <a href="javascript:void(0);" onclick="changeFontSize(25)">大</a>
    </div>
</div>

<div class="content">
    <!-- 文章 -->
    <div class="card">
        <h2>广州大学打造“党建红色文化长廊”</h2>
        <h5> 作者：朱汉斌 来源：中国科学报 发布时间：2021/12/4 22:48:05 <a href="https://news.sciencenet.cn/htmlnews/2021/12/470180.shtm">阅读原文</a>
        </h5>
        <hr>
        <p>12月3日，广州大学举行党建红色文化长廊教育宣传启动仪式，党建红色文化长廊（以下简称红色长廊）正式启用。据悉，广州大学创新性地规划建设了长达千米，集展览宣教、主题景观展示、文化交流服务等多功能于一体的红色长廊。</p>
        <p>广州大学党委书记屈哨兵表示，红色长廊是用好红色资源、发扬红色传统、传承红色基因的重要载体，也是构建全域思政育人新模式的重要依托。</p>
        <p>据介绍，红色长廊展陈包含近12万文字、近300张图片（其中近50幅为广州大学师生创作的作品），通过文字、图片、浮雕、灯光、音效、多媒体技术等综合打造一本绵延千米、多角度、立体化的党史“教科书”。</p>
        <p>“红色长廊以时间为线索，以科技互动、文化体验等多元化表现手段，打造绵延千米、沉浸式、立体化的党史学习教育新阵地，校园即思政课堂的全域性思政育人新格局呼之欲出。”屈哨兵表示。</p>
    </div>

    <div class="card">
        <div class="comment">
            <div class="update">
                <!-- 评论框 -->
                <form action="${pageContext.request.contextPath}/updatecomment" method="post">
                    <%--提交文章id 隐藏方式--%>
                    <input type="hidden" name="aid" value="1">
                    <%--提交用户名 隐藏方式--%>
                    <input type="hidden" name="username" value="${ user.username }">

                    <%--session没有值 未登录状态 不可评论--%>
                    <c:if test="${empty user }">
                        <input type="text" id="comment" placeholder="请先登录再评论" name="comment" readonly>
                        <input type="submit" class="submit" value="评论" name="submint" disabled>
                    </c:if>
                    <%--session有值 已登录状态 显示评论框--%>
                    <c:if test="${!empty user }">
                        <input type="text" id="comment" placeholder="请输入评论" name="comment">
                        <input type="submit" class="submit" value="评论" name="submint">
                    </c:if>

                </form>
            </div>

            <!-- 已有评论 -->
            <div class="content">

            </div>
        </div>
    </div>

    <div class="card">
        <h2>广州大学千米“红色长廊”启用，让党史学习教育“活”起来</h2>
        <h5>中国教育在线 林剑 通讯员 发布时间:2021-12-03 17:08:00 <a
                href="https://guangdong.eol.cn/gdgd/202112/t20211203_2183264.shtml">阅读原文</a></h5>
        <hr>
        <p>
            “回望党的百年光辉历程，眺望前方漫漫征途，我们必须始终赓续红色血脉，用党的百年奋斗重大成就和历史经验鼓舞斗志、指引方向;回望广州大学的发展历史，博学笃行、与时俱进的广大人始终以家国人民为上，以铸魂育人为本，坚守为党育人为国育才初心。”在中国共产党成立100周年的重大历史时刻、在全国上下深入学习贯彻党的十九届六中全会精神之际，为着力构建“党建+融合”机制，积极探索党史学习教育新模式，推动广大师生进一步“学史明理、学史增信、学史崇德、学史力行”，广州大学创新性地规划建设了长达千米，集展览宣教、主题景观展示、文化交流服务等多功能于一体的党建红色文化长廊(简称“红色长廊”)。</p>
        <p>12月3日上午，广州大学举行党建红色文化长廊教育宣传启动仪式，红色长廊正式启用。市委党史学习教育第八巡回指导组组长及组员、广州大学校领导等出席启动仪式。</p>
        <p>
            “广州大学党建红色文化长廊以时间为线索，以科技互动、文化体验等多元化表现手段，打造绵延千米、沉浸式、立体化的党史学习教育新阵地，校园即思政课堂的全域性思政育人新格局呼之欲出。”广州大学党委书记屈哨兵表示，红色长廊把握百年党史发展中的重大关键节点，从新民主主义革命时期、社会主义革命和建设时期、改革开放和社会主义现代化建设时期、中国特色社会主义新时代四个时期生动讲述中国共产党走过的峥嵘岁月，着重凸显中国共产党人的精神谱系，集中展示了包括伟大建党精神，革命时期的井冈山精神、苏区精神、长征精神，社会主义革命和建设时期的抗美援朝精神、“两弹一星”精神、红旗渠精神、北大荒精神，改革开放精神、抗洪精神、抗击“非典”精神以及中国特色社会主义新时代的脱贫攻坚精神、抗疫精神、科学家精神、探月精神等68种精神。</p>
        <p>
            屈哨兵表示，红色长廊是用好红色资源、发扬红色传统、传承红色基因的重要载体，也是构建全域思政育人新模式的重要依托。“红色长廊充分利用学校原有风雨长廊，采用与原有建筑体现的飘带感相呼应的设计理念，宛若穿梭于葱郁校园的红飘带，让动人的故事、英雄的先辈跃然眼前。”</p>
        <p>
            仪式上，广州大学党委副书记聂贵新介绍了广州大学党建红色文化长廊(一期)的基本建设情况。红色长廊建设充分利用学校现有信息文化长廊及周边区域，进行整体规划设计、功能改造，并将之辐射至整个校园，构建党建引领人才培养、校园即思政课堂的全域思政育人新格局。长廊一楼的展览宣教区建设由主题雕塑、序厅、228根柱子构成的基础展区、宣誓广场、长征精神主题展览厅、科学家精神主题展览区、劳模精神主题展览区、改革开放伟大成就主题展览区等组成。</p>
        <p>
            “这是《地球上的红飘带》主题雕塑，以雕塑语言描述中央红军长征的完整过程，代表着红军长征的史诗像一条鲜艳夺目的红飘带飘于这个星球上，给人类，给后世留下永远的纪念……”启动仪式现场，广州大学党史学习教育师生宣传团的成员们以红色长廊入口处的主题雕塑为源头，生动讲述红色长廊的不同功能分区和展览内容。广州大学党委书记屈哨兵、校长魏明海向师生宣讲团成员们颁发聘书，魏明海宣布长廊启用。</p>
        <p>
            在现场，记者了解到，红色长廊展陈包含近12万文字、近300张图片(其中近50幅为广州大学师生创作的作品)，通过文字、图片、浮雕、灯光、音效、多媒体技术等综合打造一本绵延千米、多角度、立体化的党史“教科书”。展陈涉及人物300多位，事件近300件，“南陈北李”相约建党、新中国成立、小岗村红手印、歌颂改革开放的电影《雅马哈鱼档》等丰富的史料均在展示之列，让师生们行走在物理空间长廊的同时，了解、学习党的光辉历史，传承红色基因、赓续精神血脉。</p>
        <p>
            “百年党史为高校立德树人提供了十分丰厚的育人资源。迈向第二个百年奋斗目标、开启全面建设社会主义现代化国家新征程，我们要以培养担当民族复兴大任的时代新人为出发点和落脚点，进一步凝聚起全校师生奋进新征程、建功新时代的强大动力。”广州大学党委书记屈哨兵表示，在建党百年之际启用红色长廊，既是学校党建育人的新起点，也为师生们在新征程上不断深化党史学习教育、推进思政课程与课程思政建设找到了突破口。“我们要久久为功，深入推动百年党史、共产党人的精神谱系进教材、进课堂，最大化利用红色资源，以红色长廊带动构建全员、全过程、全方位育人新格局落到实处。”</p>
        <p>广州大学相关负责人表示，接下来，广州大学党建红色文化长廊还将在长廊二楼建设多功能活动区，为师生提供多元化服务，在周边建设改造主题景观党建园、微型红色广场等。目前，线上云平台相关内容建设也在同步进行中。</p>
        <p>
            “漫步校园、途经红色长廊，我们时常驻足观看，或是约上三五好友前来打卡。”师生宣讲团成员、马克思主义学院20级研究生梁峰表示，红色长廊已经成为红色文化打卡点、又一处校园地标。广州大学人文学院、地理科学与遥感学院等基层党委(党总支、直属党支部)负责人表示，红色长廊的视觉效果与文化内涵相得益彰，极大拓展了党建红色文化新的教育空间、教育形式，将有力推动全校师生共同建设学校党建文化新品牌、思政课程与课程思政的重要阵地。</p>
    </div>

    <!-- <div class="card">
      <h2>Title</h2>
      <h5>yy/dd/mm</h5>
      <div class="fakeimg"></div>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quidem ea blanditiis molestiae, officia nisi doloribus iure maiores temporibus non amet quos. Officiis blanditiis, earum ipsa unde aut accusamus quam inventore?</p>
    </div> -->
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
    var card = document.querySelectorAll(".card");

    // 修改字体大小
    function changeFontSize(size) {
        //选择所有文章卡片
        for (let i_card = 0; i_card < card.length; i_card++) {
            var card_p = card[i_card].querySelectorAll("p");
            // 选择卡片中的所有段落
            for (let i_p = 0; i_p < card_p.length; i_p++) {
                // 修改字体大小
                card_p[i_p].style.fontSize = size + "px";
            }
        }
    }
</script>
</html>
