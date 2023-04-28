<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-8 text-left">
    <h3>Item All</h3>

    <table class="table">
        <thead>
        <tr>
            <th>IMG</th>
            <th>ID</th>
            <th>NAME</th>
            <th>PRICE</th>
            <th>REGDATE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="i" items="${allItem}">
            <tr>
                <td><img id="item_img" src="/uimg/${i.imgname}" style="height:200px"></td>
                <td>${i.id}</td>
                <td>${i.name}</td>
                <td><fmt:formatNumber value="${i.price}" type="currency" /></td>
                <td><fmt:formatDate  value="${i.rdate}" pattern="yy-MM-dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>