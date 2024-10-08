<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
/* 비 애니메이션 설정 */
    .rain {
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        pointer-events: none;
        overflow: hidden;
        z-index: 0;
    }

    .drop {
        position: absolute;
        bottom: 100%;
        width: 2px;
        height: 30px;
        background: #478abc;
        border-radius: 20px;
        animation: fall linear infinite;
    }

    @keyframes fall {
        0% {
            transform: translateY(0);
            opacity: 1;
        }
        100% {
            transform: translateY(100vh);
            opacity: 0;
        }
    }
</style>
</head>
<body>
	<div class="rain">
        <%
            Random random = new Random();
            for (int i = 0; i < 100; i++) {
                double leftPosition = random.nextDouble() * 100;
                double duration = 1 + random.nextDouble() * 2;
                double delay = random.nextDouble() * 5;
        %>
            <div class="drop"
            	 style="left: <%= leftPosition %>vw;
            	 animation-duration: <%= duration %>s;
            	 animation-delay: <%= delay %>s;
            	 ">
            </div>
        <%
            }
        %>
    </div>
    <ul>
    	<li>저장된 값 : ${req}</li>
    	<li>매개변수1 : ${param.par1}</li>
    	<li>매개변수2 : ${param.par2}</li>
    </ul>
</body>
</html>