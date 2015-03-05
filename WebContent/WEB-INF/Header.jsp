<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="cb" class="core.ConfigBean" />

<%-- set data source --%>
<sql:setDataSource
    driver="com.mysql.jdbc.Driver"
    url="${cb.url}"
    user="${cb.username}"
    password="${cb.password}" />

<c:set var="usersession" value="${sessionScope.user}"/>