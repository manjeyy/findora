<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.landf.features.auth.AuthConstants" %>
<%
    Object authUser = session.getAttribute(AuthConstants.SESSION_USER_KEY);
    if (authUser != null) {
        response.sendRedirect(request.getContextPath() + "/dashboard");
        return;
    }

    response.sendRedirect(request.getContextPath() + "/auth/login");
%>