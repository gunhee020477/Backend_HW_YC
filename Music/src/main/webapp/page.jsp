<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // 파라미터(view)
    String view = request.getParameter("view");
    if (view == null) view = "login";

    // layout.jsp에게 넘길 값
    request.setAttribute("pageType", view);
    request.setAttribute("content", "pageContent.jsp");
%>

<jsp:forward page="layout.jsp" />