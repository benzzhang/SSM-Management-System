<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
    <meta charset="UTF-8">
    <title>BME课题管理系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
</head>

<body>
    <!--头部-->
    <header class="publicHeader">
        <h1>>>BME课题管理系统</h1>
        <div class="publicHeaderR">
            <p><span><a style="color: #FFF21B" href="${pageContext.request.contextPath}/admin/modify.do?id=${admin.id}&flag=update" style="">${admin.name}</a></span> , 欢迎你！</p>
            <a id="exit" href="javascript:if(confirm('您真的要退出吗？')){location.href='${pageContext.request.contextPath}/admin/logout.do'}">退出</a>
        </div>
    </header>
    <!--时间-->
    <section class="publicTime">
        <span id="time">
            <script>
                let date = new Date();
                document.write("今天是：" + date.getFullYear() + "年" + (date.getMonth() + 1) + "月" +
                    date.getDate() +"日 "+ " 星期" + "日一二三四五六".charAt(date.getDay()))
            </script>
        </span>
    </section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li ><a href="${pageContext.request.contextPath}/project/list.do">课题管理</a></li>
                <li><a href="${pageContext.request.contextPath}/student/list.do">学生管理</a></li>
                <li><a href="${pageContext.request.contextPath}/supervisor/list.do">导师管理</a></li>
                <%-- <li><a href="${pageContext.request.contextPath}/journal/list.do">期刊管理</a></li> --%>
            </ul>
        </nav>
    </div>