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
	if(itemList != null){ 
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
	    <form>
 		    <div class="mb-4">
      	     	<label for="realName" class="form-label fs-4 fw-bold">真實姓名</label>
                <input name="realName" id="realName" class="form-control" value="" placeholder="購物核對身份" required></input>
	       	</div>
	       	<div class="mb-4">
               <label for="cellphone" class="form-label fs-4 fw-bold">手機號碼</label>
               <input name="cellphone" id="cellphone" class="form-control" value="" placeholder="購物核對身份" required></input>
	       	</div>
	       	<div class="mb-4">
                <label for="address" class="form-label fs-4 fw-bold">地址</label>
	           	<textarea name="address" id="address" class="form-control" cols="30" rows="5" placeholder="購物商品寄送地址" required></textarea>
	       	</div>
	    </form>
    </div>
    
    <% }else{ %>
    	
    	<div>
    		<h1>購物車現在沒有東西，歡迎至<span><a href="<%=request.getContextPath()%>/product">產品頁面</a></span>>選擇喜歡的商品</h1>
    	</div>
    	
    <% } %>

	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#datatable').DataTable();
        });
    </script>
</body>

</html>