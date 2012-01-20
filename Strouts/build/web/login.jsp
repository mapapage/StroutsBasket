<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" type="text/css" href="stylesheet.css">
       
        <title>Login Form</title>
    </head>
    <body>
        <h1>Your e-Shop</h1>
        <h2>Log in </h2>
        
        <html:form action="/login">
            <table border="0">
    
                <tbody>
                    <tr>
                        <td colspan="2">
                        <bean:write name="LoginForm" property="error" filter="false"/>
                        &nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td>Name:</td>
                        <td><html:text property="name" /></td>
                     </tr>
               
                    <tr>
                        <td>e-mail:</td>
                        <td><html:text property="email" /></td>
                    </tr>
                    
                    <tr>
                         <td></td>
                         <td><html:submit value="Log in" /></td>
                    </tr>           
                </tbody>
            </table>
                   
    <br> <br>

    <h4>Papageorgiou Marilena on Project 4</h4>
    <p><a href="http://github.com/mapapage/StroutsBasket">My GitHub</a></p>
    


</html:form>
   
</html>
