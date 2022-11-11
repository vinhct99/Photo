<%-- 
    Document   : Galery
    Created on : Aug 16, 2021, 2:40:17 PM
    Author     : Vinh Cao
--%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/css/home.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/right.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/slide.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/newcss.css" rel="stylesheet" type="text/css"> 
        <title>Galery Page</title>
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
                    <div class="about">
                        <h3>${galery.name}</h3>
                    </div>
                    <div class="contentGalery">
                        <div class="container">
                            <c:forEach items="${listImage}" var="i">
                                <div class="mySlides">
                                    <img src="${i.getImage_url()}" style="height: auto">
                                </div>
                            </c:forEach>
                            <a class="prev" onclick="plusSlides(-1)">&#10094</a>
                            <a class="next" onclick="plusSlides(1)">&#10095</a>

                            <ul >
                                <c:if test="${index <= maxPage}">
                                    <c:forEach items="${listImage}" var="i">
                                        <li class="span4">
                                            <img class="demo cursor" style="height: 100px" src="${i.getImage_url()}" onclick="currentSlide(${i.id} - (${galeryID} - 1) * 10)">
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                        <div class="paging">
                            <c:if test="${maxPage > 1}">
                                <c:forEach begin="1" end="${maxPage}" var="i">
                                    <a class="${i==index?"active":""}" href="GaleryServlet?index=${i}&galeryID=${galeryID}">${i}</a>
                                    <c:set var="index" value="${index}" />
                                </c:forEach>
                            </c:if>
                        </div>
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
            <div class="linkk">
                <a href="#">Created with SimpleSite </a>
                <%
                    String view = (String) session.getServletContext().getAttribute("totalView");
                    for (int i = 0; i < view.length(); i++) {%>
                <span class="footer-page-counter"><%= view.charAt(i)%></span>
                <%}%>
            </div>
        </div>
        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("demo");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>
    </body>
</html>
