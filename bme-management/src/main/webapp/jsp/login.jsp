<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BME课题管理-登录</title>
    <style type="text/css">
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            padding: 0;
            font: 16px/20px microsft yahei;
        }
        .wrap {
            width: 100%;
            height: 100%;
            padding: 15% 0;
            position: fixed;
            opacity: 0.8;
            /* 背景渐变颜色 */
            background: linear-gradient(to bottom right,#f58220, #1d953f);
            background: -webkit-linear-gradient(to bottom right,#50a3a2,#53e3a6);
        }
        .container {
            width: 60%;
            margin: 0 auto;
        }
        .container h1 {
            text-align: center;
            color: #FFFFFF;
            font-weight: 1000;
            font-size: 25px;
        }
        .container h2 {
            text-align: center;
            color: #FF0000;
            font-weight: 1000;
            font-size: 20px;
        }
        .container input {
            width: 320px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 32px auto;
            -webkit-transition: all 0s ease-in 0.1ms;
            -moz-transition: all 0s ease-in 0.1ms;
            transition: all 0s ease-in 0.1ms;
        }
        .container select {
            width: 320px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 32px auto;
            -webkit-transition: all 0s ease-in 0.1ms;
            -moz-transition: all 0s ease-in 0.1ms;
            transition: all 0s ease-in 0.1ms;
        }
        /* 字体 - select */
        .container select  {
            background-color: #FFFFFF;
            font-size: 16px;
            color: #000000;
        }
        /* 字体 - 输入栏 */
        .container input[type="text"] , .container input[type="password"]  {
            background-color: #FFFFFF;
            font-size: 16px;
            color: #000000;
        }
        /* 字体 - 提交*/
        .container input[type='submit'] {
            font-size: 16px;
            letter-spacing: 2px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .container input:focus {
            width: 400px;
        }
        .container input[type='submit']:hover {
            cursor: pointer;
            width: 400px;
            font-weight: 500;
        }
        .to_login{
            color: #a7c4c9;
        }
        .text{
            color: #e2dfe4;
        }
        .wrap ul {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -20;
        }
        .wrap ul li {
            list-style-type: none;
            display: block;
            position: absolute;
            bottom: -120px;
            width: 15px;
            height: 15px;
            z-index: -8;
            border-radius: 50%;
            box-shadow: inset -30px -30px 75px rgba(0, 0, 0, .2),
            inset 0px 0px 5px rgba(0, 0, 0, .5),
            inset -3px -3px 5px rgba(0, 0, 0, .5),
            0 0 20px rgba(255, 255, 255, .75);
            background-color:rgba(255, 255, 255, 0.15);
            animotion: square 25s infinite;
            -webkit-animation: square 25s infinite;
        }
        .wrap ul li:nth-child(1) {
            left: 0;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(2) {
            width: 40px;
            height: 40px;
            left: 10%;
            animation-duration: 15s;
            -moz-animation-duration: 15s;
            -o-animation-duration: 15s;
            -webkit-animation-duration: 11s;
        }
        .wrap ul li:nth-child(3) {
            left: 20%;
            width: 25px;
            height: 25px;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
        }
        .wrap ul li:nth-child(4) {
            width: 50px;
            height: 50px;
            left: 30%;
            -webkit-animation-delay: 3s;
            -moz-animation-delay: 3s;
            -o-animation-delay: 3s;
            animation-delay: 3s;
            animation-duration: 12s;
            -moz-animation-duration: 12s;
            -o-animation-duration: 12s;
            -webkit-animation-duration: 12s;
        }
        .wrap ul li:nth-child(5) {
            width: 60px;
            height: 60px;
            left: 40%;
            animation-duration: 10s;
            -moz-animation-duration: 10s;
            -o-animation-duration: 10s;
            -webkit-animation-duration: 10s;
        }
        .wrap ul li:nth-child(6) {
            width: 75px;
            height: 75px;
            left: 50%;
            -webkit-animation-delay: 7s;
            -moz-animation-delay: 7s;
            -o-animation-delay: 7s;
            animation-delay: 7s;
        }
        .wrap ul li:nth-child(7) {
            left: 60%;
            width: 30px;
            height: 30px;
            animation-duration: 8s;
            -moz-animation-duration: 8s;
            -o-animation-duration: 8s;
            -webkit-animation-duration: 8s;
        }
        .wrap ul li:nth-child(8) {
            width: 90px;
            height: 90px;
            left: 70%;
            -webkit-animation-delay: 4s;
            -moz-animation-delay: 4s;
            -o-animation-delay: 4s;
            animation-delay: 4s;
        }
        .wrap ul li:nth-child(9) {
            width: 50px;
            height: 50px;
            left: 80%;
            animation-duration: 20s;
            -moz-animation-duration: 20s;
            -o-animation-duration: 20s;
            -webkit-animation-duration: 20s;
        }
        .wrap ul li:nth-child(10) {
            width: 75px;
            height: 75px;
            left: 90%;
            -webkit-animation-delay: 6s;
            -moz-animation-delay: 6s;
            -o-animation-delay: 6s;
            animation-delay: 6s;
            animation-duration: 30s;
            -moz-animation-duration: 30s;
            -o-animation-duration: 30s;
            -webkit-animation-duration: 30s;
        }
        @keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% {
                bottom: 400px;
                -webkit-transform: translateY(-500);
                transform: translateY(-500)
            }
        }
        @-webkit-keyframes square {
            0% {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
            100% {
                bottom: 400px;
                -webkit-transform: translateY(-500);
                transform: translateY(-500)
            }
        }
    </style>
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        // $(function (){
        //     $("#login").click(function (){
        //         var account = $("#id").val();
        //         var pw = $("#password").val();
        //         $.post("admin/login",
        //             {
        //                 "id":account,
        //                 "password":pw
        //             },
        //             function (data){
        //             if (data != null){
        //                 if (data.val() == "1"){
        //                     // var date = new Date();
        //                     // date.setTime(date.getTime()+parseInt())
        //                         location.href ="jsp/homepage";
        //                 }else {
        //                     alert("账号/密码错误!");
        //                 }
        //             }
        //         },"json");
        //     })
        // })
    </script>
</head>
<body>
<div class="wrap">
    <div class="container">
        <h1 style="color: whitesmoke; margin: 0; text-align: center">
            Project management system of BME College
        </h1>
        <form action="${pageContext.request.contextPath}/admin/login.do" method="post">
            <label><input type="text" placeholder="Admin Name" name="id"/></label>
            <label><input type="password" placeholder="Admin Password" name="password"/></label>
            <input type="submit" value="Log in"/>
            <h2>${errormsg}</h2>
        </form>
    </div>
    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
</html>
<%--版权声明：本文为CSDN博主「qq_38959715」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。--%>
<%--原文链接：https://blog.csdn.net/qq_38959715/article/details/80819194--%>
