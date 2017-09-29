package controller.all.notice;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import net.sf.json.JSONObject;

@Controller
public class Img_Upload_Controller implements ApplicationContextAware{

	@Autowired
	private File_DAO fdao;
	
	public File_DAO getFdao() {
		return fdao;
	}
	public void setFdao(File_DAO fdao) {
		this.fdao = fdao;
	}


	private WebApplicationContext context = null;

	//String PATH = context.getServletContext().getRealPath("/WEB-INF/upload_img");
	
	@Autowired // json 데이터로 응답을 보내기 위한
	MappingJackson2JsonView jsonView;

	@RequestMapping(value="/summernote/imgupload.do", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView upload(MultipartHttpServletRequest request) throws Exception {
		
		// 응답용 객체를 생성하고, jsonView 를 사용하도록 합니다.
		ModelAndView model = new ModelAndView();
		model.setView(jsonView);
		
		Iterator itr =  request.getFileNames();
		String path = context.getServletContext().getRealPath("/upload_img");
		String realpath="http://192.168.40.58:8082/d_time/upload_img/";
		
	
        if(itr.hasNext()) {
        	MultipartFile mpf = request.getFile((String) itr.next());
            
        	long time=System.currentTimeMillis();
			Random r = new Random();
			int i = r.nextInt(50);
			String origin_name=mpf.getOriginalFilename();
			String filename=time+"_"+i+"_"+origin_name;
        	
            File file = new File(path +"/"+ filename);
           
            mpf.transferTo(file);
            System.out.println(realpath);
        
            
            // 업로드된 파일이 있을경우 응답입니다.
            JSONObject json = new JSONObject();
            json.put("code", "true");
            json.put("path",realpath+filename);
            json.put("name",origin_name);
            model.addObject("result", json);
            return model;
            
        } else {
        	
        	  // 파일이 없을 경우 응답 입니다.
            JSONObject json = new JSONObject();
            json.put("code", "false");
            model.addObject("result", json);
            return model;
            
        }
	}


	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException{
		this.context = (WebApplicationContext)applicationContext;
	}
}
