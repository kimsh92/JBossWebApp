<%@ page session="false" %>
<html>
<!-- Copyright (c) 1999-2001 by BEA Systems, Inc. All Rights Reserved.-->
<head>
<title>LoadBalancing Test</title>
</head>
<body bgcolor=#FFFFFF>
<p>
<font face="Helvetica">

<h2>
<font color=#DB1260>
LoadBalancing Test
</font>
</h2>

<p>
This servlet returns information about the HTTP request
itself. You can modify this servlet to take this information
and store it elsewhere for your HTTP server records. This
servlet is also useful for debugging.

<h3>
Server Name
</h3>

<pre>
<%= System.getProperty("weblogic.Name") %>
</pre>

<h3>
Servlet Spec Version Implemented
</h3>

<pre>
<%= getServletConfig().getServletContext().getMajorVersion() + "." + getServletConfig().getServletContext().getMinorVersion() %>
</pre>

<h3>
Requested URL
</h3>

<pre>
<%= HttpUtils.getRequestURL(request) %>
</pre>

<h3>
Request parameters
</h3>

<pre>
<%
java.util.Enumeration enum = request.getParameterNames();
while(enum.hasMoreElements()){
  String key = (String)enum.nextElement();
  String[] paramValues = request.getParameterValues(key);
  for(int i=0;i < paramValues.length;i++){
      out.println(key + " : "  + paramValues[i]); 
  }
}
%>
</pre>

<h3>
Request information
</h3>

<pre>
Request Method: <%= request.getMethod() %>
Request URI: <%= request.getRequestURI() %>
Request Protocol: <%= request.getProtocol() %>
Servlet Path: <%= request.getServletPath() %>
Path Info: <%= request.getPathInfo() %>
Path Translated: <%= request.getPathTranslated() %>
Query String: <%= request.getQueryString() %>
Content Length: <%= request.getContentLength() %>
Content Type: <%= request.getContentType() %>
Server Name: <%= request.getServerName() %>
Server Port: <%= request.getServerPort() %>
Remote User: <%= request.getRemoteUser() %>
Remote Address: <%= request.getRemoteAddr() %>
Remote Host: <%= request.getRemoteHost() %>
Authorization Scheme: <%= request.getAuthType() %>

WL-Proxy-Client-IP: <%= request.getHeader("WL-Proxy-Client-IP") %>
Proxy-Client-IP: <%= request.getHeader("Proxy-Client-IP") %>
X-Forwarded-For: <%= request.getHeader("X-Forwarded-For") %>

</pre>

<h3>Certificate Information ¤Ì.¤Ì</h3>


<h3>
Request headers
</h3>

<pre>
<%
enum = request.getHeaderNames();
while (enum.hasMoreElements()) {
  String name = (String)enum.nextElement();
  out.println(name + ": " + request.getHeader(name));
}
%>
</pre>

<p>

</font>
</body>
</html>
