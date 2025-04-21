<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            display: flex;
            gap: 20px;
        }
        .form-container {
            flex: 1;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .table-container {
            flex: 2;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="text"], input[type="email"], input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .action-links a {
            margin-right: 10px;
            text-decoration: none;
        }
        .action-links a.edit {
            color: #2196F3;
        }
        .action-links a.delete {
            color: #F44336;
        }
    </style>
</head>
<body>
<h1>Student Management System</h1>

<div class="container">
    <div class="form-container">
        <h2>${student.id != null ? 'Edit Student' : 'Add New Student'}</h2>

        <c:if test="${student.id != null}">
            <form action="<c:url value='/update'/>" method="post">
                <input type="hidden" name="id" value="${student.id}">

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${student.name}" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${student.email}" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value="${student.age}" required>

                <input type="submit" value="Update Student">
            </form>
        </c:if>

        <c:if test="${student.id == null}">
            <form action="<c:url value='/save'/>" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>

                <input type="submit" value="Save Student">
            </form>
        </c:if>
    </div>

    <div class="table-container">
        <h2>Student List</h2>

        <c:if test="${empty students}">
            <p>No students found in the database.</p>
        </c:if>

        <c:if test="${not empty students}">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="std" items="${students}">
                    <tr>
                        <td>${std.id}</td>
                        <td>${std.name}</td>
                        <td>${std.email}</td>
                        <td>${std.age}</td>
                        <td class="action-links">
                            <a href="<c:url value='/edit/${std.id}'/>" class="edit">Edit</a>
                            <a href="<c:url value='/delete/${std.id}'/>" class="delete"
                               onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>