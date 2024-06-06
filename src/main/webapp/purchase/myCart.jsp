<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>
<%@ page import="com.mike.user.model.*"%>
<%@ page import="com.mike.purchase.model.*"%>
<%@ page import="com.mike.item.model.*"%>
<%@ page import="com.mike.tool.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OaSis - My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/avatar.css">
    <style>
	  table#table-1 {
		background-color: #CCCCFF;
	    border: 2px solid black;
	    text-align: center;
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
	  }
	  table#table-1 h4 {
	    color: red;
	    display: block;
	    margin-bottom: 1px;
	  }
	  h4 {
	    color: blue;
	    display: inline;
	  }
	  table {
		max-width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
	  }
	  table, th, td {
	    border: 1px solid #CCCCFF;
	  }
	  th, td {
	    padding: 5px;
	    text-align: center;
	    max-width: 100px;
	    max-height: 20px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	  }
	  tr th:first-child{
	  	width: 50px;
	  }
	  
	  @media (max-width: 800px) {
        table, th, td {
            font-size: 12px;
        }
    	}
    
	</style>
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="../home/navbar.jsp" %>
    
    <%
	PurchaseService purchaseSvc = new PurchaseService();
	PurchaseVO purchase = purchaseSvc.getCurrentPurchase(user.getUserId());
	//List<ItemVO> itemList = purchase.getItemsByPurchaseId();
	
	List<ItemVO> itemList = purchase.getItems();
	if(itemList.size() != 0){ 
    %>
    
    
    <div class="container">
	    <table class="table table-striped align-middle table-bordered text-center" id="datatable">
	    	<thead>
		    	<tr class="text-center">
		    		<th>明細ID</th>
		    		<th>產品ID</th>
		    		<th>單價</th>
		    		<th>數量</th>
		    		<th>總價</th>
		    		<th>刪除</th>
		    	</tr>
	    	</thead>
	    	<tbody class="table-group-divider">
		    	<% for(ItemVO item: itemList){ %>
					<tr>
						<td><%= item.getItemId() %></td>
						<td><%= item.getItemProductId() %></td>
						<td><%= item.getItemPrice() %></td>
						<td><%= item.getItemCount() %></td>
						<td><%= item.getItemTotal() %></td>
						
						<td>
						  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/item/removing" style="margin-bottom: 0px;">
						     <input type="submit" class="btn btn-outline-dark" value="移除">
						     <input type="hidden" name="removeItemId"  value="<%= item.getItemId() %>"></FORM>
						</td>
					</tr>
		    	<% } %>
	    	</tbody>				
	    </table>
	    <div class="mx-5">
	    <form action="/oasis/purchaseClosing" method="POST" enctype="multipart/form-data" class="border border-primary-subtle border-2 rounded p-4 mb-3">
		    
		    <input name="userId" class="form-control" value="<%= user.getUserId() %>" hidden=true></input>
		    <input name="purchaseId" class="form-control" value="<%= purchase.getPurchaseId() %>" hidden=true></input>
		    
		    <div class="alert alert-info container text-center mt-5" id="updatedNotiftication" role="alert" style="display:none;">
			  使用者資料完成更新!
			</div>
			<div class="alert alert-warning container text-center mt-5" id="wrongCellphoneNotiftication" role="alert" style="display:none;">
			  手機號碼只接受 09XX-XXX-XXX 或相近的格式
			</div>

 		    <div class="mb-4">
      	     	<label for="realName" class="form-label fs-4 fw-bold">真實姓名</label>
                <input name="realName" id="realName" class="form-control" value="<%= StringProcessor.nullToEmpty(user.getUserRealName()) %>" placeholder="購物核對身份" required></input>
	       	</div>
	       	<div class="mb-4">
               <label for="cellphone" class="form-label fs-4 fw-bold">手機號碼</label>
               <input name="cellphone" id="cellphone" class="form-control" value="<%= StringProcessor.nullToEmpty(user.getUserCellphone()) %>" placeholder="購物核對身份" required></input>
	       	</div>
	       	<div class="mb-4">
                <label for="address" class="form-label fs-4 fw-bold">地址</label>
	           	<textarea name="address" id="address" class="form-control" cols="30" rows="5" placeholder="購物商品寄送地址" required><%= StringProcessor.nullToEmpty(user.getUserAddress()) %></textarea>
	       	</div>
	       	<div class="d-flex justify-content-evenly">
		       	<button class="btn btn-secondary" id="savePaymentInfoBtn">儲存結帳資訊</button>
	            <input type="submit" class="btn btn-primary" value="送出結帳">
	       	</div>
	    </form>
	    </div>
	    
	    
    </div>
    
    <% }else{ %>
    	
    	<div class="container text-center mt-5 ">
		    <p class="lead fw-bold">購物車現在沒有東西，歡迎至<span><a href="<%=request.getContextPath()%>/product">產品頁面</a></span>選擇喜歡的商品</p>
		</div>
    	
    <% } %>

	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#datatable').DataTable();
        });
    </script>
    <script>
		$(document).ready(function() {
		  $("#savePaymentInfoBtn").click(function(e) {
			  e.preventDefault();
			  console.log("savePaymentInfoBtn has been clicked!")
			  
		    let data = {
				  			userId: <%= user.getUserId() %>,
		    				realName: $("#realName").val(),
		    				cellphone: $("#cellphone").val(),
		    				address: $("#address").val()
		    			};
		
		    $.ajax({
		      type: "POST",
		      url: "/oasis/paymentInfoUpdating",
		      data: data,
		      success: function(response) {
		        console.log("Success! Response:", response);
		        $("#updatedNotiftication").fadeIn(250).fadeOut(3000);
		      },
		      error: function(jqXHR, textStatus, errorThrown) {
		        console.error("手機號碼只接受 09XX-XXX-XXX 或相近的格式");
		        $("#wrongCellphoneNotiftication").fadeIn(250).fadeOut(3000);
		      }
		    });
		  });
		});
	</script>
</body>

</html>