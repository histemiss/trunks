package com.myspring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.db.FileJT;
import com.myutils.MyTime;

@Controller
public class FileUploadController {

	@Autowired
	FileJT fileJT;
	@Autowired
	private ServletContext context; 
	
	@RequestMapping(path="/upload", method=RequestMethod.POST)
    public String handleFileUpload(@RequestParam("file") MultipartFile file, 
    		@RequestParam("filename") String strName,
    		ModelMap model){

    	//获取用户名
    	if (null == model.get("user_id"))
    		return "redirect:login";

    	long user_id =  (Long) model.get("user_id");
        if (!file.isEmpty()) {
            try {
            	//文件目录
            	String strPath = context.getInitParameter("file-upload-dir");
            	strPath = Paths.get(strPath).resolve(MyTime.getUniqName()).toString();
            	System.out.println(strPath);

            	//保存文件
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(strPath)));
                stream.write(file.getBytes());
                stream.close();

            	//上传的文件名与存储的文件名
            	strName = Paths.get(strName).getFileName().toString();
            	strPath = Paths.get(strPath).getFileName().toString();

            	//插入数据库
            	fileJT.create(user_id, strName, strPath);

                return "redirect:welcome";
            } catch (Exception e) {
            	model.addAttribute("err", "file is empty:" + e.getMessage()); 
            }
        } else {
        	model.addAttribute("err", "file is empty:");
        }

        return "hello";
    }
    
}
