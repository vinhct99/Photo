<%-- 
    Document   : Contact
    Created on : Aug 16, 2021, 2:31:04 PM
    Author     : Vinh Cao
--%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/home.css" rel="stylesheet" type="text/css">
        <link href="./css/header.css" rel="stylesheet" type="text/css">
        <link href="./css/right.css" rel="stylesheet" type="text/css">
        <link href="./css/footer.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/newcss.css" rel="stylesheet" type="text/css"> 
        <title>Contact Page</title>
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
                        <h3>Contact</h3>
                    </div>
                    <div class="content-contact">
                        <h4>PHOTOGRAPHER</h4>
                        <div class="country">
                            <p>Address: ${contact.address}<br>City:<span class="tab-1"></span>${contact.city}<br>Country:  ${contact.country}</p>
                        </div>
                        <div class="infor">
                            <table>
                                <tr>
                                    <td>Tel: </td>
                                    <td>${contact.telephone}</td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td>${contact.email}</td>
                                </tr>

                            </table>
                            <label> </label> <span></span>
                        </div> 
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4854095315936!2d105.52487561443567!3d21.013254993684487!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1624977156437!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
    </body>
</html>

