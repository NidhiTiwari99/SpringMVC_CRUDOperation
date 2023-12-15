<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<c:url value='/resources/css/bootstrap.min.css'></c:url>" rel="stylesheet">
    </head>
    <body>
        <h1>Student Operations!</h1>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
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
                        <input type="submit" value="Submit" class="btn btn-primary" />
                    </td>
                </tr>

            </table>
        </form:form>
        <h2>${msg}</h2>
                        <img src="<c:url value='/resources/images/12.jpg'></c:url>" height="200" width="200" class="img-circle" />
    
                </div>
            <div class="col-md-9">
                <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Roll No</th>
                    <th>Student Name</th>
                    <th>English</th>
                    <th>Maths</th>
                    <th>Science</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${students}">
                    <tr>
                        <td>${c.rno}</td>
                        <td>${c.name}</td>
                        <td>${c.english}</td>
                        <td>${c.maths}</td>
                        <td>${c.science}</td>
                        <td>
                            <a href="/SpringMVCWithModelForm/editstudent/${c.rno}">Edit</a>
                            &nbsp;
                            <a href="/SpringMVCWithModelForm/deletestudent/${c.rno}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
            </div>
            </div>
        </div>
    </body>
</html>
