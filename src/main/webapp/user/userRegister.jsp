<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mike.user.model.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="css/avatar.css">
</head>

<body>

    <h1>���U</h1>
    <div class="register_input_div">
        <form action="registering" method="POST" enctype="multipart/form-data">
            <table>
                <tbody>
                    <tr id="register_input_email">
                        <th>
                            <label for="email">��J�H�c</label>
                        </th>
                        <td>
                            <input name="email" id="email" type="text" placeholder="����" required>
                        </td>
                    </tr>
                    <tr id="register_input_password">
                        <th>
                            <label for="password">��J�K�X</label>
                        </th>
                        <td>
                            <input name="password" id="password" type="password" placeholder="����" required>
                        </td>
                    </tr>
                    <tr id="register_input_confirm_password">
                        <th>
                            <label for="confirm_password">�A����J�K�X</label>
                        </th>
                        <td>
                            <input name="confirm_password" id="confirm_password" type="password" placeholder="����" required>
                        </td>
                    </tr>
                    <tr id="register_nickname">
                        <th>
                            <label for="nickname">��J�ʺ�</label>
                        </th>
                        <td>
                            <input name="nickname" id="nickname" type="text">
                        </td>
                    </tr>
                    <tr id="register_intro">
                        <th>
                            <label for="intro">�ۧڤ���</label>
                        </th>
                        <td>
                            <textarea name="intro" id="intro" cols="30" rows="10"></textarea>
                        </td>
                    </tr>
                    <tr id="register_avatar">
                        <th>
                            <label for="avatar">�W�ǹϤ�(�j�Y��)</label>
                        </th>
                        <td>
                            <input name="avatar" id="avatar" type="file">
                            <div class="imgPreviewDiv">
                                <img class="imgPreviewPlaceholder" src="https://via.placeholder.com/300x200" alt="">
                                <img class="imgUpload" src="" alt="" hidden>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="���U to user/registering">
            <input type="reset" value="�M�����">
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="js/userAvatar.js"></script>
    <script>
	    <c:forEach var="errorMsg" items="${requestScope.errorMsgs}">
	    	alert("${errorMsg}");
	  	</c:forEach>
    </script>
</body>

</html>