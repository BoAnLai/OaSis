<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="com.mike.purchase.model.*"%>

<% 

PurchaseService purchaseSvc = new PurchaseService();
//PurchaseVO purchase = purchaseSvc.createPurchase(1);
PurchaseVO purchase = purchaseSvc.getCurrentPurchase(1);

%>

<h1>hello world</h1>
<p><%= purchase%></p>