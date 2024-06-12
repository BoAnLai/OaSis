<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Timestamp,java.util.Date,java.text.SimpleDateFormat"%>
<%
//獲取當前時間
	Date currentDate = new Date();
	// 將當前時間轉換為 Timestamp 對象
	Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
	 // 定義時間戳格式
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedTimestamp = sdf.format(currentTimestamp);
%>

<!DOCTYPE html>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <title>修改文章</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 5px;
      color: #333;
    }

    input[type="text"],
    textarea {
      margin-bottom: 10px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }

    textarea {
      resize: vertical;
      height: 500px;
      overflow: auto;
    }

    button {
      padding: 10px;
      border: none;
      border-radius: 4px;
      background-color: #5cb85c;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #4cae4c;
    }

    .ck-editor__editable {
      min-height: 500px;
      margin-bottom: 50px;
    }

    .ck-placeholder {
      text-align: center;
      font-size: 30px;
      color: lightgray;
      padding-top: 25%;
    }
  </style>
<script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>

<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="/home/navbar.jsp" %>
    <%@ include file="/forum/forumHeader.jsp" %>
  
  <div class="container">
    <h1>修改文章</h1>
    <form id="postForm" action="<%=request.getContextPath()%>/post" method="POST" >
      
      
      
      <label for="title">標題</label>
      <input type="text" id="title" name="artTitle" readonly required value="${artVO.artTitle}">

      <label for="content">內容</label>
      <textarea id="content" name="artContent" value="${artVO.artContent}" ></textarea>
			
	  <input type="hidden" name="artTimestamp" value="<%= formattedTimestamp %>">
	  <input type="hidden" name="artId" value="${artVO.artId}">
	  
      
      <input type="hidden" name="act" value="updateArt" >
      <button type="submit" >發佈文章</button>
    </form>
  </div>
  
	<script src="/oasis/forum/js/MyUploadAdapter.js"></script>
	<script>
	const content = `${artVO.artContent}`;
	ClassicEditor
    .create(document.querySelector('#content'), {
        toolbar: {
            items: [
                'undo', 'redo',
                '|', 'heading',
                '|', 'bold', 'italic',
                '|', 'link', 'insertImage', 'insertTable', 'mediaEmbed', 'blockQuote',
                '|', 'bulletedList', 'numberedList', 'outdent', 'indent'
            ]
        },
        extraPlugins: [MyCustomUploadAdapterPlugin],
        language: 'zh-tw', 
        cloudServices: {
            uploadUrl:'/oasis/upload' 
        }
    })
        .then(editor => {
       	  window.editor = editor;
       	  editor.setData(content);
         
        })
        .catch( error => {
            console.error( error );
        } );
    
    document.getElementById('postForm').addEventListener('submit', function(event) {
        // 获取 CKEditor 实例
        var editor = CKEDITOR.instances.content;
        // 更新 textarea 中的内容
        if (!editor.getData().trim()) {
        // 如果内容为空，阻止表单提交
        event.preventDefault();
        // 提示用户编辑器内容不能为空
        alert('内容不能为空');
    }	else{
        editor.updateSourceElement();
        }
    });
	</script>

</body>

</html>