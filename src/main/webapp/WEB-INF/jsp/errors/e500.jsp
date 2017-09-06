<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h2>An error occured, please contact webmaster.</h2>

<p>Message:<br>
    ${exception.message}</p>
</body>
</html>