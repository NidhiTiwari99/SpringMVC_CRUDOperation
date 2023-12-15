<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Student Details!</h1>
        <form:form method="post">
            <table>
                <tr>
                    <td>Roll No</td>
                    <td><form:input path="rno" /> </td>
                </tr>
                <tr>
                    <td>Student Name</td>
                    <td><form:input path="name" /> </td>
                </tr>
                <tr>
                    <td>English</td>
                    <td><form:input path="english" /> </td>
                </tr>
                <tr>
                    <td>Maths</td>
                    <td><form:input path="maths" /> </td>
                </tr>
                <tr>
                    <td>Science</td>
                    <td><form:input path="science" /> </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="/SpringMVCWithModelForm/student">Back</a>
                        <input type="submit" value="Update" />
                        
                    </td>
                </tr>

            </table>
        </form:form>
    </body>
</html>
