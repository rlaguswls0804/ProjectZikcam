package zikcam.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
public class CkeditorFileUploadController {
	
	@RequestMapping(value="/admin/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
	
	 
	 String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
	 System.out.println("uploadPath  : "+uploadPath);
	
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("application/json");
	 
	 try {
	  
	  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로 
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" +fileName;
	  
	  System.out.println("ckUploadPath :" + ckUploadPath);
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush(); // out에 저장된 데이터를 전송하고 초기화
	  
	  //String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "../resources/ckUpload/" + uid + "_" + fileName; // 작성화면
	  // 업로드시 메시지 출력
	  JsonObject json = new JsonObject();
	  json.addProperty("uploaded", 1);
	  json.addProperty("fileName", fileName);
	  json.addProperty("url", fileUrl); 
	  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	  
	  printWriter.flush();
	  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/ckUpload"));
	  System.out.println("url : "+fileUrl);
	  System.out.println("ckUploadPath : "+ckUploadPath);
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
}
