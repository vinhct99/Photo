<%-- 
    Document   : HomePage
    Created on : Aug 16, 2021, 2:50:33 PM
    Author     : Vinh Cao
--%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" session ="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/css/home.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/right.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css"> 
        <link href="<%=request.getContextPath()%>/css/newcss.css" rel="stylesheet" type="text/css"> 
        <title>Home Page</title>
    </head>
    <body>

        <div class="container">
            <div class="nav">
                <div class= "nav-inner">
                    <ul>
                        <li> <a class="${active=="0"?"activeMenu":""}" href="HomeServlet">My front page</a></li>
                            <c:forEach items="${top3}" var="i" >
                            <li> <a class="${active==i.ID?"activeMenu":""}" href="GaleryServlet?galeryID=${i.ID}">${i.name}</a> </li>
                            </c:forEach>
                        <li> <a class="${active=="4"?"activeMenu":""}" href="ContactServlet">Contact</a> </li>
                    </ul>
                </div>

            </div>
            <div class="header">
                <div class="header-inner">
                    <div class="img"> </div>
                    <!--<img rel="nofollow" src="./images/logo.png"/>-->
                    <div class="title ">
                        PHOTOGRAPHER
                    </div>
                    <div class="subtitle">
                        Welcome to this website
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="left">
                    <div class="image">
                        <img src="${contact.image_main}" alt="First">
                    </div>
                    <div class="description">
                        Lorem ipsum dolor sit amet
                    </div>
                    
                    <div class="content">

                            <c:if test="${index > maxPage}">
                                <h3> Not found this page!!!</h3>
                            </c:if>
                            <ul >

                                <c:if test="${index <= maxPage}">
                                    <c:forEach items="${listGalery}" var="i" >
                                        <li class="span4">
                                            <div class="image">
                                                <img src="${i.image}" style="height: 150px">
                                            </div>
                                            <h4>
                                                <a href="GaleryServlet?galeryID=${i.ID}">${i.title}</a>
                                            </h4>
                                            <p>${i.description}</p>
                                        </li>
                                    </c:forEach>

                                </c:if>
                            </ul>                         
                        <div class="paging">
                            <c:if test="${maxPage < 1}">
                                <h3>Not Found!!</h3>
                            </c:if>
                            <c:if test="${maxPage > 1}">
                                <c:forEach begin="1" end="${maxPage}" var="i">
                                    <a class="${i==index?"active":""}" href="HomeServlet?index=${i}">${i}</a>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${contact.about}
                    </div>
                </div>
                <div class="right">
                    <div class="header-right">
                        <h4>Share this page</h4>
                    </div>
                    <div class="social">
                        <div>
                            <ul>
                                <li><img src="${contact.icon_face}"><a href="${contact.face_url}"><span>Share on Facebook</span></a></li>
                                <li><img src="${contact.icon_twitter}"><a href="${contact.twitter_url}"><span>Share on Twitter</span></a></li>
                                <li><img src="${contact.icon_google}"><a href="${contact.google_url}"><span>Share on Google</span></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="foot">
            <div class="link">
                <a href="#">Created with SimpleSite </a>
                <%
                    String view = (String) session.getServletContext().getAttribute("totalView");
                    for (int i = 0; i < view.length(); i++) {%>
                <span class="footer-page-counter"><%= view.charAt(i)%></span>
                <%}%>
            </div>

        </div>
    </body>
</html>
