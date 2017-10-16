package controller.all.notice;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.File_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import net.sf.json.JSONObject;

@Controller
public class Notice_Controller{
	
	private WebApplicationContext context = null;
	
	@Autowired
	private Notice_DAO ndao;
	
	@Autowired
	private File_DAO fdao;
	
	public File_DAO getFdao() {
		return fdao;
	}


	public void setFdao(File_DAO fdao) {
		this.fdao = fdao;
	}


	public Notice_DAO getNdao() {
		return ndao;
	}


	public void setNdao(Notice_DAO ndao) {
		this.ndao = ndao;
	}

	@RequestMapping("/all/notice/notice_list.do")
	public String notice_list(Model model,HttpSession session,HttpServletRequest request) {
		
		String pageNum = request.getParameter("pageNum"); 
		if (pageNum == null) {
			pageNum = "1";
		}
		int count = ndao.Notice_Count();  
		int pageSize = 10;
		
		int currentPage = Integer.parseInt(pageNum);     
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		
		List<Notice_DTO> nlist = ndao.getNoticeList(map); 
		model.addAttribute("nlist", nlist); 
		
		int number = 0;
		number = count - (currentPage - 1) * pageSize;
		session.setAttribute("pageNum", new Integer(pageNum)); 
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("count", count);
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("pageSize",new Integer(pageSize));
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/notice/notice_list";
		}
		
		return "mem/notice/notice_list";
		
		
	}
	
	@RequestMapping("/all/notice/notice_detail.do")
	public String notice_detail(Model model, int n_no,HttpSession session) {
		Notice_DTO ndto = ndao.getNoticeOne(n_no);
		model.addAttribute("ndto", ndto);
		String file_name=null;
		if(ndto.getF_no()!=0)
			file_name = fdao.getFileName(ndto.getF_no());
		if(file_name!=null)
			model.addAttribute("fname",file_name);
		
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/notice/notice_detail";
		}
	
		return "mem/notice/notice_detail";
		
	
	}
	@RequestMapping("/admin/notice/notice_modify.do")
	public String notice_modifyForm(int n_no,Model model) {
		Notice_DTO ndto = ndao.getNoticeOne(n_no);
		model.addAttribute("ndto", ndto);
		
		String file_name=null;
		if(ndto.getF_no()!=0)
			file_name = fdao.getFileName(ndto.getF_no());
		if(file_name!=null)
			model.addAttribute("fname",file_name);
		
		return "admin/notice/notice_modifyForm";
	}
	@RequestMapping("/admin/notice/notice_modifyPro.do")
	public String notice_modifyPro(Notice_DTO ndto) {
		
		int x =ndao.modify_notice(ndto);
		if(x!=1) {
			return "error";
		}
		
		return "redirect:/all/notice/notice_list.do";
	}

	@RequestMapping("/admin/notice/notice_delete.do")
	public String notice_deletePro(int n_no) {
		
		int x =ndao.delete_notice(n_no);
		if(x!=1) {
			return "error";
		}
		
		return "redirect:/all/notice/notice_list.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/admin/notice/notice_write.do")
	public String notice_writeForm() {
		
		return "admin/notice/notice_writeForm";
	}
	
	@RequestMapping("/admin/notice/notice_writePro.do")
	public String notice_writePro(Notice_DTO ndto) {
		
		MultipartFile n_file=ndto.getN_file();
		if(n_file.getOriginalFilename().equals("")) { //파일없는경우
			System.out.println("파일없음");
			Timestamp time = new Timestamp(System.currentTimeMillis());
			ndto.setN_date(time);
			int x =ndao.write_notice(ndto);
			if(x!=1) {
				return "error";
			}
			
		}else { //파일이 존재하면
			ndto.setF_no(upload(n_file));
			Timestamp time = new Timestamp(System.currentTimeMillis());
			ndto.setN_date(time);
			int x =ndao.write_notice_file(ndto);
			if(x!=1) {
				return "error";
			}
		}
		
		return "redirect:/all/notice/notice_list.do";
		
	}
	private int upload(MultipartFile report) { //f_no리턴
		int f_no=0;
		try {
			//file name 중복제거처리
			long time=System.currentTimeMillis();
			Random r = new Random();
			int i = r.nextInt(50);
			String origin_name=report.getOriginalFilename();
			String filename=time+"_"+i+"_"+origin_name;
			String fileroot="D:\\upload\\"+filename;
			long filesize = report.getSize();
			File file = new File(fileroot);
			report.transferTo(file);
			System.out.println("전송완료");
			
			//DB에 저장
			File_DTO fdto = new File_DTO(fileroot,origin_name,filesize);
			f_no=fdao.insertFile(fdto);
			if(f_no<1) {
				System.out.println("DB저장실패");
			}
			
			
		}catch(IllegalStateException i) {
			System.out.println("전송실패 - IllegalStateException");
			i.printStackTrace();
		}catch(IOException io) {
			System.out.println("전송실패 - IOException");
			io.printStackTrace();
		}
		return f_no;
	}
	
	
}


