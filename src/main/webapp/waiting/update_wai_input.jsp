<%@page import="com.mike.game.model.GameVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mike.game.model.GameService"%>
<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% //見com.emp.controller.EmpServlet.java第163行存入req的empVO物件 (此為從資料庫取出的empVO, 也可以是輸入格式有錯誤時的empVO物件)
	WaitingVO waiVO = (WaitingVO) request.getAttribute("waiVO");
%>

<%
    List<GameVO> gameList = null;
    try {
        gameList = GameService.listAll();
    } catch (Exception e) {
        e.printStackTrace(); //
    }
    request.setAttribute("gameList", gameList);
%>
<%----<%= empVO==null %>--${empVO.deptno}--  --%> <!-- Line 100 -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>列隊資料修改 - update_emp_input.jsp</title>

	 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
    
    </style>
    
    
    
  </head>



<h3 class="container text-center">
<button class="btn btn-primary" type="button" disabled>
  <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
  <span role="status">資料修改中...</span>
</button>
</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
		<ul>
		    <c:forEach var="message" items="${errorMsgs}">
		    
		    <div class="alert alert-danger" role="alert">
	  		${message}
			</div>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${not empty successMsgs}">
		<ul>
		    <c:forEach var="message" items="${successMsgs}">	    
		    <div class="alert alert-success" role="alert">
	  		${successMsgs}
			</div>
			</c:forEach>
		</ul>
	</c:if>

<FORM METHOD="post" ACTION="Waiting.do" name="form1">


  <body class="p-3 m-0 border-0 bd-example m-0 border-0 bd-example-row">
	<div class="container text-center">
      <div class="row row-cols-1">
      
        <div class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">  
        <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end">
  		<td style="color: red">房間編號:<font color=red ><b>*</b></font></td>
		<td><%=waiVO.getWaitingID()%></td>
		</div>
        </font></font></div>
        
  
        <input class="form-control" type="text" placeholder="隊伍創建人:${user.userNickname}" aria-label="Disabled input example" disabled>
        
        
        <div class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group input-group-lg">
	  	<span class="input-group-text" id="inputGroup-sizing-lg">出發日期:</span>
	  	<input type="text" class="form-control" name="reserve" id="f_date1"   value="<%=waiVO.getWaitingUserId()%>" size="45" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required="required">
		</div>
        </font></font></div><br>
        
        
        <div class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group input-group-lg">
	  	<span class="input-group-text" id="inputGroup-sizing-lg">上限人數:</span>
	  	<input type="text" class="form-control" name="max"   value="<%=waiVO.getWaitingMaxPeople()%>" size="45" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" >
		</div>
        </font></font></div><br>
        
        
        
        <div class="input-group mb-3"><font style="vertical-align: inherit;">
        <div class="input-group input-group-lg">
		  <label class="input-group-text" for="inputGroupSelect01">遊戲類型:</label>
		  <select class="form-select" id="inputGroupSelect01" name="game">
		    <c:forEach var="GameVO" items="${gameList}">
                <option value="${GameVO.gameName}" ${GameVO.gameName == param.game ? 'selected' : ''}>${GameVO.gameName}</option>
            </c:forEach>
          
        </select></div></font>
		</div>
              
      </div>
    </div> 

<br>
<div class="btn-group" role="group" aria-label="Third group">
<input type="hidden" name="action" value="update">
<input type="hidden" name="waino" value="<%=waiVO.getWaitingID()%>">
<input type="submit" class="btn btn-info" value="送出修改">
</div></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:true,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d H:i',         //format:'Y-m-d H:i:s',
 		   value: '<%=waiVO.getWaitingReserve()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>