<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OaSis Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style type="text/css">
		.card{
			max-width: 250px;
		}
		div.card-body{
			height:300px;
		}
		#btn-container{
			display: flex;
            justify-content: flex-end;
		}
		p{
			height:100%;
			overflow: hidden;
			text-overflow: ellipsis;
		}
	</style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<%@ include file="/home/navbar.jsp" %>
	
	<div class="container mt-5">
      <div class="d-flex justify-content-between">	
      
      
      	<div class="card">
		  <div class="card-header">
		    Featured
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Discuss</h5>
		    <div class="h-75">
			    <p class="card-text">我們的論壇讓你輕鬆參與各種遊戲社群的討論:發表文章、留言評論或是針對文章再發表文張進行討論!馬上加入我們，開始分享遊戲心得、吐槽官方或發表最新迷因圖!</p>
		    </div>
		    <div class="btn-container">
			    <a href="<%= request.getContextPath()%>/game" class="btn btn-primary">Enter</a>
		    </div>
		  </div>
		</div>
		
      	<div class="card" style=" background-size: cover; background-position: center;">
		  <div class="card-header">
		    Featured
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Match Up</h5>
		    <div class="h-75">
			    <p class="card-text">我們的配對功能讓您可以輕鬆組隊，提供多種實用功能，包括出發時間、遊戲標籤、大廳聊天和一對一聊天。無論您是想找到合適的遊戲夥伴，還是在遊戲開始前討論策略，這個功能都能滿足您的需求，讓您的遊戲體驗更加順暢愉快!</p>
		    </div>
		    <div class="btn-container">
			    <a href="<%=request.getContextPath()%>/waiting/waiting_select.jsp" class="btn btn-primary">Enter</a>
		    </div>
		  </div>
		</div>
		
      	<div class="card">
		  <div class="card-header">
		    Featured
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Shopping</h5>
		    <div class="h-75">
			    <p class="card-text">荷包裡錢太多沒地方花嗎?購物車功能讓你從此不需煩惱!把太多的錢錢轉換成自己喜歡的形狀!</p>
		    </div>
		    <div class="btn-container">
			    <a href="#" class="btn btn-primary">Enter</a>
		    </div>
		  </div>
		</div>
		
      	<div class="card">
		  <div class="card-header">
		    Featured
		  </div>
		  <div class="card-body">
		    <h5 class="card-title">Subscribe</h5>
		    <div class="h-75">
			    <p class="card-text">訂閱功能讓您輕鬆追蹤喜愛的文章或遊戲：訂閱您感興趣的文章，第一時間收到最新的更新通知！馬上訂閱，確保您不會錯過任何精彩內容。立即加入我們，享受即時的資訊掌握，讓您的遊戲體驗更加豐富和充實！</p>
		    </div>
		    <div class="btn-container">
			    <a href="#" class="btn btn-primary">Enter</a>
		    </div>
		  </div>
		</div>
		
		
      </div>
  </div>
  
</body>
</html>