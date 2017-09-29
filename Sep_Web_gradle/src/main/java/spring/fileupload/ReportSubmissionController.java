package spring.fileupload;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mybatis.FileDTO;
import spring.mybatis.FileDao;

@Controller
public class ReportSubmissionController {

	FileDao dao;
	
	
	public FileDao getDao() {
		return dao;
	}

	public void setDao(FileDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/report/submission.do",method=RequestMethod.GET)
	public String form() {
		return "report/submissionForm";
	}

	@RequestMapping(value="/report/submitReport1.do",method=RequestMethod.POST)
	public String submitReport1(@RequestParam("studentNumber") String studentNumber,
								@RequestParam("report") MultipartFile report) {
		if(report.getOriginalFilename().equals("")) {
			System.out.println("파일없음");
		}else { //파일이 존재하면
			upload(report);
		}
		
		printInfo(studentNumber,report);
		return "report/submissionComplete";
	}

	@RequestMapping(value="/report/submitReport2.do",method=RequestMethod.POST)
	public String submitReport2(MultipartHttpServletRequest request) {
		String studentNumber = request.getParameter("studentNumber");
		MultipartFile report = request.getFile("report");
		if(report.getOriginalFilename().equals("")) {
			System.out.println("파일없음");
		}else { //파일이 존재하면
			upload(report);
		}
		printInfo(studentNumber, report);
		return "report/submissionComplete";

	}

	@RequestMapping(value="/report/submitReport3.do",method=RequestMethod.POST)
	public String submitReport3(ReportCommand reportCommand) {
		MultipartFile report=reportCommand.getReport();
		if(report.getOriginalFilename().equals("")) {
			System.out.println("파일없음");
		}else { //파일이 존재하면
			upload(report);
		}
		printInfo(reportCommand.getStudentNumber(), reportCommand.getReport());
		return "report/submissionComplete";
	}
	private void printInfo(String studentNumber, MultipartFile report) {
		System.out.println(studentNumber + "가 업로드 한 파일: "
				+ report.getOriginalFilename());
	}
	private void upload(MultipartFile report) {
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
			
			//DB에 저장
			FileDTO fdto = new FileDTO(origin_name,fileroot);
			int result=dao.insertFile(fdto);
			if(result!=1) {
				System.out.println("DB저장실패");
			}
			
			//DB에 존재하는 전체 파일 출력
			List<FileDTO> fdata = dao.selectAllFile();
			for (FileDTO file1 : fdata) {
				System.out.println(file1);
			}
			
		}catch(IllegalStateException i) {
			System.out.println("전송실패 - IllegalStateException");
			i.printStackTrace();
		}catch(IOException io) {
			System.out.println("전송실패 - IOException");
			io.printStackTrace();
		}
	}
}
