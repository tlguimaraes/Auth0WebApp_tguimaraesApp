<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  String recv = "";
  String recvbuff = "";
  //Calling API with token to act on behalf of the user.
  String jsonurl =
      "https://tguimaraes.auth0.com/userinfo?access_token=" + request.getParameter("access_token");
  URL jsonpage = new URL(jsonurl);
  URLConnection urlcon = jsonpage.openConnection();
  BufferedReader buffread = new BufferedReader(new InputStreamReader(urlcon.getInputStream()));

  while ((recv = buffread.readLine()) != null)
    recvbuff += recv;
  buffread.close();

  System.out.println(recvbuff);
%>
<p></p>

<%
  if (recvbuff.indexOf("admin") > 0) {
    out.println("Hello Administrator!");
  } else {
    out.println("Hello end-user");
  }
%>
