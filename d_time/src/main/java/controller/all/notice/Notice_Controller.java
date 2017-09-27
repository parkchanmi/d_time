package controller.all.notice;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Notice_DTO;

@Controller
public class Notice_Controller {
	
	
	@RequestMapping("/admin/notice/notice_list.do")
	public String notice_list() {
		return "admin/notice/notice_list";
	}
	
	
	@RequestMapping("notice_writePro.do")
	public String writeDo(Notice_DTO ndto) {
		MultipartFile n_file=ndto.getN_file();
		if(n_file.getOriginalFilename().equals("")) { //파일없는경우
			System.out.println("파일없음");
			//
			
			
			
			
		}else { //파일이 존재하면
			upload(n_file);
			//
			
		}
		
		return "redirect:Notice_WriteForm.jsp";
		
	}
	private int upload(MultipartFile report) { //f_no리턴
		try {
			//file name 중복제거처리
			long time=System.currentTimeMillis();
			Random r = new Random();
			int i = r.nextInt(50);
			String origin_name=report.getOriginalFilename();
			String filename=time+"_"+i+"_"+origin_name;
			String fileroot="D:\\upload\\"+filename;
			
			File file = new File(fileroot);
			report.transferTo(file);
			System.out.println("전송완료");
			
			
			
		}catch(IllegalStateException i) {
			System.out.println("전송실패 - IllegalStateException");
			i.printStackTrace();
		}catch(IOException io) {
			System.out.println("전송실패 - IOException");
			io.printStackTrace();
		}
		return 0;
	}
	
		
	

}
