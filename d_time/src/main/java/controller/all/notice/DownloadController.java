package controller.all.notice;
import java.io.File;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController implements ApplicationContextAware{

	@Autowired
	private File_DAO fdao;
	
	public File_DAO getFdao() {
		return fdao;
	}
	public void setFdao(File_DAO fdao) {
		this.fdao = fdao;
	}

	private WebApplicationContext context = null;
	
	@RequestMapping("/all/notice/download.do")
	public ModelAndView download(int f_no) throws Exception{
		File downloadFile = getFile(f_no);
		return new ModelAndView("download","downloadFile",downloadFile);
	}
	private File getFile(int f_no) {
		
		String path = fdao.getFilePath(f_no);
		//f_no로 부터 db상의 경로찾아옴
	//	String path = context.getServletContext().getRealPath("/WEB-INF/설명.txt"); -> 프로젝트 상 경로
	//	String path = "D:\\upload\\1506497124422_26_url정보.txt";
		return new File(path);
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException{
		this.context = (WebApplicationContext)applicationContext;
	}
}
