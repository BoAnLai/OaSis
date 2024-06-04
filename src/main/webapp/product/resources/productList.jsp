<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jiahong.product.model.*"%>

<%
    ProductService productService = new ProductService();
    List<ProductVO> productList = productService.listAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>產品列表</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <%@ include file="/home/navbar.jsp" %>
    <div class="container">
        <h1 class="text-center">產品列表</h1>
        <table class="table table-striped align-middle table-bordered text-center" id="productTable">
            <thead>
                <tr>
                    <th>產品名稱</th>
                    <th>產品圖片</th>
                    <th>產品價格</th>
                    <th>下單</th>
                </tr>
            </thead>
            <tbody>
                <% for(ProductVO product: productList){ %>
                    <tr>
                        <td><%= product.getProductName() %></td>
                        <td>
                            <img src="<%= product.getProductImg() %>" alt="產品圖片" width="100" class="product-img" data-bs-toggle="modal" data-bs-target="#imageModal" data-img-src="<%= product.getProductImg() %>" data-product-name="<%= product.getProductName() %>">
                        </td>
                        <td><%= product.getProductPrice() %></td>
                        <td>
                            <button class="btn btn-primary">加入購物車</button>
                            <button class="btn btn-success">購買</button>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">產品名稱</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <img id="modalImage" src="" alt="產品圖片" class="img-fluid">
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const modalImage = document.getElementById('modalImage');
            const imageModal = document.getElementById('imageModal');
            const modalTitle = document.getElementById('imageModalLabel');

            imageModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget; // 觸發模態框的按鈕
                const imgSrc = button.getAttribute('data-img-src'); // 獲取圖片源
                const productName = button.getAttribute('data-product-name'); // 獲取產品名稱
                modalImage.src = imgSrc; // 更新模態框中的圖片源
                modalImage.style.maxWidth = '100%'; // 設置圖片的最大寬度為 100%
                modalImage.style.height = 'auto'; // 設置圖片高度自動
                modalTitle.textContent = productName; // 更新模態框的標題
            });
        });
    </script>

</body>
</html>
