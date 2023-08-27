<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Elastic Search Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
</head>
<body>
    <h1>Retrieved Elastic Data</h1>
    <p>Place: ${retrievedElastic.place}</p>
    <p>Latitude: ${retrievedElastic.latitude}</p>
    <p>Longitude: ${retrievedElastic.longitude}</p>

    <h2>Matching Results from Elasticsearch</h2>
    <ul>
        <c:forEach items="${searchHits}" var="hit">
            <li>${hit.content.place}</li>
        </c:forEach>
    </ul>
</body>
</html>
