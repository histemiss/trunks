package com.myspring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.database.DbDao;
import com.myutils.MyTime;

@Controller
public class FileUploadController {

    @RequestMapping(path="/upload", method=RequestMethod.POST)
    public String handleFileUpload(@RequestParam("file") MultipartFile file, 
    		@RequestParam("filename") String strName,
    		ModelMap model, HttpServletRequest request, HttpSession session){

    	//获取用户名
    	if (null == session.getAttribute("user_id"))
    		return "redirect:login";
    	
    	long user_id =  (Long) session.getAttribute("user_id");

        if (!file.isEmpty()) {
            try {
            	//随机文件名
            	String strFile = MyTime.getUniqName();
            	//文件目录
            	String strDir = request.getServletContext().getInitParameter("file-upload-dir");
            	Path path = Paths.get(strDir);
            	String strPath = path.resolve(strFile).toString();
            	System.out.println(strPath);

            	//保存文件
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(strPath)));
                stream.write(bytes);
                stream.close();
            	model.addAttribute("message", "Upload success");

            	//文件名
            	strName = Paths.get(strName).getFileName().toString();

            	//插入数据库
            	DbDao dd = new DbDao("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/user_manage","root","1234");
            	dd.insert("insert into upload_info(user_id,file_name, path_name) values(?,?,?)", user_id, strName, strFile);
            } catch (Exception e) {
            	model.addAttribute("message", "file is empty:" + e.getMessage()); 
            }
        } else {
        	model.addAttribute("message", "file is empty:");
        }

        return "redirect:welcome";
    }
    
}
