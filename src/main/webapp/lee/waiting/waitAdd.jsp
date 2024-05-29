<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lee.waiting.model.*"%>

<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
	WaitingVO watVO = (WaitingVO) request.getAttribute("watVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>隊伍資料新增 - addEmp.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    
    body{margin-top:20px;
    background-color:#eee;
    }
    
    
    
    .project-list-table {
        border-collapse: separate;
        border-spacing: 0 12px
    }
    
    .project-list-table tr {
        background-color: #fff
    }
    
    .table-nowrap td, .table-nowrap th {
        white-space: nowrap;
    }
    .table-borderless>:not(caption)>*>* {
        border-bottom-width: 0;
    }
    .table>:not(caption)>*>* {
        padding: 0.75rem 0.75rem;
        background-color: var(--bs-table-bg);
        border-bottom-width: 1px;
        box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
    }
    
    .avatar-sm {
        height: 2rem;
        width: 2rem;
    }
    .rounded-circle {
        border-radius: 50%!important;
    }
    .me-2 {
        margin-right: 0.5rem!important;
    }
    img, svg {
        vertical-align: middle;
    }
    
    a {
        color: #3b76e1;
        text-decoration: none;
    }
    
    .badge-soft-danger {
        color: #f56e6e !important;
        background-color: rgba(245,110,110,.1);
    }
    .badge-soft-success {
        color: #63ad6f !important;
        background-color: rgba(99,173,111,.1);
    }
    
    .badge-soft-primary {
        color: #3b76e1 !important;
        background-color: rgba(59,118,225,.1);
    }
    
    .badge-soft-info {
        color: #57c9eb !important;
        background-color: rgba(87,201,235,.1);
    }
    
    .avatar-title {
        align-items: center;
        background-color: #3b76e1;
        color: #fff;
        display: flex;
        font-weight: 500;
        height: 100%;
        justify-content: center;
        width: 100%;
    }
    .bg-soft-primary {
        background-color: rgba(59,118,225,.25)!important;
    }
    
    
</style>


</head>






<table class="table project-list-table table-nowrap align-middle table-borderless">
<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/WaitingServlet" name="form1">


 <div class="container text-center">
      <div class="row">
        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group flex-nowrap">
  		<span class="input-group-text" id="inputGroup-sizing-lg">NUMBER</span>
  		<input type="text" class="form-control" name="userid" placeholder="您的編號ID" aria-label="Username" aria-describedby="addon-wrapping" required="required">
		</div>     
        </font></font></div>
      </div>
      
      <div class="row">
        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group flex-nowrap">
  		<span class="input-group-text" id="inputGroup-sizing-lg">RESERVE</span>
  		<input type="text" id="f_date1" class="form-control" name="reserve" placeholder="預約出發時間" aria-label="Username" aria-describedby="addon-wrapping" required="required">
		</div>
        </font></font></div>
      </div>
      
      <div class="row">
        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group flex-nowrap">
  		<span class="input-group-text" id="inputGroup-sizing-lg">MAXPEOP</span>
  		<input type="text" class="form-control" name="max" placeholder="列隊上限" aria-label="Username" aria-describedby="addon-wrapping" required="required">
		</div>
        </font></font></div>
      </div>
      
      <div class="row">
        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
        <div class="input-group flex-nowrap">
  		<span class="input-group-text" id="inputGroup-sizing-lg">GAME</span>
  		<input type="text" class="form-control" name="game" placeholder="遊戲類型" aria-label="Username" aria-describedby="addon-wrapping" required="required">
		</div>
        </font></font></div>
      </div>
    </div>

	 
	
	

	<jsp:useBean id="deptSvc" scope="page" class="com.lee.waiting.controller.WaitingServlet" />
	




<br>
<input type="hidden" name="action" value="insert">
<input type="submit" class="btn btn-info" value="送出新增">
</FORM>

</table>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  Timestamp reserve = null;
  try {
	  reserve = watVO.getWaitingReserve();
   } catch (Exception e) {
	   reserve = new Timestamp(System.currentTimeMillis());
   }
%>
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
		   value: '<%=reserve%>', // value:   new Date(),
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