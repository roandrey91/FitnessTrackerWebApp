<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Add Minutes</title>
    
    <script type="text/javascript" src="jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function() {
                $.getJSON('<spring:url value="activities.json"/>', {
                    ajax : 'true'
                }, function(data){
                    var html = '<option value="">--Please select one--</option>';
                    var len = data.length;
                    for (var i = 0; i < len; i++) {
                        html += '<option value="' + data[i].desc + '">'
                            + data[i].desc + '</option>';
                    }
                    html += '</option>';

                    $('#activities').html(html);
                });

            });

    </script>
</head>
<body>
<h1>Add minutes Exercised</h1>
Language : <a href="?language=en">English</a> | <a href="?language=ro">Romanian</a>
<form:form commandName="exercise"> <!-- numele de aici trebuie sa fie acelasi cu cel de la metoda -->
    <table>
        <tr>
            <td><spring:message code="goal.text" /></td>
            <td><form:input path="minutes"/></td>
            <td>
                <form:select id="activities" path="activity"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" value="Enter Exercise"/>
            </td>
        </tr>
    </table>
</form:form>
<h1>Our goal for today is: ${goal.minutes}</h1>
</body>
</html>
