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


<%
	UserVO user = (UserVO) session.getAttribute("user");
%>

    <h1>�ק�</h1>
    <div class="register_input_div">
        <form action="updating" method="POST" enctype="multipart/form-data">
            <table>
                <tbody>
               		<tr style="display: none;">
               			<td>
	               			<input name="id" type="number" value="<%=user.getUserEmail()%>">
               			</td>
               		</tr>
                    <tr id="register_input_email">
                        <th>
                            <label for="email">�H�c</label>
                        </th>
                        <td>
                            <input name="email" id="email" type="text" placeholder="����" required value="<%=user.getUserEmail()%>" readonly>
                        </td>
                    </tr>
                    <tr id="register_input_password">
                        <th>
                            <label for="password">�K�X</label>
                        </th>
                        <td>
                            <input name="password" id="password" type="password" placeholder="����" value="<%=user.getUserPassword()%>">
                        </td>
                    </tr>
                    <tr id="register_input_confirm_password">
                        <th>
                            <label for="confirm_password">�T�{�s�K�X</label>
                        </th>
                        <td>
                            <input name="confirm_password" id="password" type="password" placeholder="����" value="<%=user.getUserPassword()%>">
                        </td>
                    </tr>
                    <tr id="register_nickname">
                        <th>
                            <label for="nickname">�ʺ�</label>
                        </th>
                        <td>
                            <input name="nickname" id="nickname" type="text" value="<%=user.getUserNickname()%>">
                        </td>
                    </tr>
                    <tr id="register_intro">
                        <th>
                            <label for="intro">�ۧڤ���</label>
                        </th>
                        <td>
                            <textarea name="intro" id="intro" cols="30" rows="10"><%=user.getUserIntro()%></textarea>
                        </td>
                    </tr>
                    <tr id="register_avatar">
                        <th>
                            <label for="avatar">�Ϥ�(�j�Y��)</label>
                        </th>
                        <td>
                            <input name="avatar" id="avatar" type="file">
                            <div class="imgPreviewDiv" >
                                <img class="imgPreviewPlaceholder" src="<%=user.getUserAvatar()%>" alt="">
                                <img class="imgUpload" src="" alt="" hidden>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="�ק�">
        </form>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="js/userAvatar.js"></script>
</body>

</html>