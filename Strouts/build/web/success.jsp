<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="java.util.*"%>
<%@page import="org.w3c.dom.*" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>



<!DOCTYPE html>
<jsp:useBean id="cafe" class="com.myapp.struts.calcQuantity" scope="request" />
<jsp:setProperty name="cafe" property="*"/>

<jsp:useBean id="sugar" class="com.myapp.struts.calcQuantity" scope="request"/>
<jsp:setProperty name="sugar" property="*"/>

<jsp:useBean id="water" class="com.myapp.struts.calcQuantity" scope="request"/>
<jsp:setProperty name="water" property="*"/>

<%!
  public boolean isTextNode(Node n){
  return n.getNodeName().equals("#text");
  }
  
  
%>


<%!
  Vector v = new Vector();
  String n;
%>

<%
  DocumentBuilderFactory docFactory = 
  DocumentBuilderFactory.newInstance();
  DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
  Document doc = docBuilder.parse("http://texwww.inf.uth.gr:8080/~mapapage/items.xml");
  
  Element  element = doc.getDocumentElement(); 
  NodeList personNodes = element.getChildNodes(); 
  for (int i=0; i<personNodes.getLength(); i++){
    Node emp = personNodes.item(i); 
    if (isTextNode(emp)) continue;
    NodeList NameDOBCity = emp.getChildNodes(); 
  
    for (int j=0; j<NameDOBCity.getLength(); j++ ){
        Node node = NameDOBCity.item(j);
        String s = node.getNodeName();  
        if ( isTextNode(node)) 
        continue;
 
      n=node.getFirstChild().getNodeValue();
      v.add(n);
    } 
    
}
  

%>


<html>
    
    
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Success to e-Shopping Basket</title>
</head>
<body bgcolor="#E6E6FA">
  
    
    <h3>Congratulations!</h3>

    <p><font color=#555>You have successfully logged in.</font></p>
    

    <p> <font color=#555>Your name is: <bean:write name="LoginForm" property="name" />.</font></p> 

    <p><font color=#555>Your email address is: <bean:write name="LoginForm" property="email" />.</font></p>
    
    

<h1 align="center"><font color=#be7429>Your e-Basket</font></h1>


<h3 align="center"><font color=#be7429>Enter the quantity of your items:</font></h3>


<form method="POST" action="success.jsp">
<table border="2"  align="center">
    
<tr>
<th>Item</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
</tr>
	
<tr>
<td>Cafe</td>
<td><%=(String)v.get(1) %> </td>
<td>
    <input type="text" name="qcafe" size="6" value="${cafe.qcafe}">
</td>
<td>${18.50 * cafe.qcafe}</td>
</tr>

<tr>
<td>Sugar</td>
<td><%=(String)v.get(3) %></td>
<td>
    <input type="text" name="qsugar" size="6" value="${sugar.qsugar}">
</td>

<td>${6.95 * sugar.qsugar}</td>
</tr>

<tr>
<td>Water</td>
<td><%=(String)v.get(5) %></td>
<td>
    <input type="text" name="qwater" size="6" value="${water.qwater}">
</td>

<td>${1.29 * water.qwater}</td>
</tr>

<tr>
<td>Total:</td>
<td></td>
<td></td>

<td>
    ${(18.50 * cafe.qcafe)+(6.95 * sugar.qsugar)+(1.29 * water.qwater)}
</td>
</tr>

</tbody>
</table>

<br>

<div  align="center">
<input type=submit name="Add" value="Add to basket">
</div>
</form>


<h4><font color=#be7429>For more info download the source code/README file:</font></h4>

<form method="get" action="http://texwww.inf.uth.gr:8080/~mapapage/README.pdf">
    
<div>
<input type="submit" value="README" onclick="repServlet" />
</div>
    
</form>


<form method="get" action="http://texwww.inf.uth.gr:8080/~mapapage/myCode.tar">
    
<div>
<input type="submit" value="SourceCode" onclick="SrcServlet" />
</div>
    
</form>


<h4>Papageorgiou Marilena on Project 4</h4>
<p><a href="http://github.com/mapapage/StroutsBasket">My GitHub</a></p>
</body>

</html>




