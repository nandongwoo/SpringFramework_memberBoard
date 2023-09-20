<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    #wrap {
        position: relative;
        min-height: 35%;
        padding-bottom: 114px;
    }

    footer {
        font-size: 125%;
        position: absolute;
        bottom: 25px;
    }

</style>

<div id="wrap">

</div>


<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("wrap");
    footer.innerHTML = "<footer class='mx-3'>&copy;" + date.getFullYear() + "&nbsp; dongwoo All rights reserved"
</script>
