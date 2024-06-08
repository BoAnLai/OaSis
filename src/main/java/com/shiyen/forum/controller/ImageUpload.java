package com.shiyen.forum.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload") // 
@MultipartConfig
public class ImageUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        
        System.out.println("Received file upload request.");
        
        Part filePart = req.getPart("upload");
        String fileName = System.currentTimeMillis() + "_" + getFileName(filePart);
        ServletContext context = getServletContext();
        String saveDirectory = "/forum/artUpload"; 
        String realPath = context.getRealPath(saveDirectory);
        System.out.println("Real path: " + realPath);
        File fsaveDirectory = new File(realPath);
        if (!fsaveDirectory.exists()) {				
            fsaveDirectory.mkdirs();
        }
        File file = new File(fsaveDirectory, fileName);
        
//        try (InputStream input = filePart.getInputStream()) {
//            Files.copy(input, file.toPath());
//        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
            System.out.println("File saved successfully: " + file.getAbsolutePath());
        } catch (IOException e) {
            e.printStackTrace();
        }

        String fileUrl = req.getContextPath() +  saveDirectory + "/" + fileName;
        String jsonResponse = "{\"url\":\"" + fileUrl + "\"}";
        
        res.getWriter().write(jsonResponse);
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
