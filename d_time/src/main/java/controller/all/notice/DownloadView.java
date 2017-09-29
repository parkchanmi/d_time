package controller.all.notice;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView { //커스텀 뷰

	public DownloadView() {
		setContentType("application/download;charset=utf-8");
		//다운로드를 위한 필수 contentType
	}
	@Override
	protected void renderMergedOutputModel(Map<String,Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file=(File)model.get("downloadFile");
		response.setContentType(getContentType());
		response.setContentLength((int)file.length());
		
		String userAgent = request.getHeader("User-Agent");//브라우저정보
		boolean ie = userAgent.indexOf("MSIE")>-1;
		//true : MSIE브라우저로 접속
		//false : MSIE가 아닌 브라우저로 접속
		
		String fileName= null;
		if(ie) {
			fileName = URLEncoder.encode(file.getName(),"utf-8");
		}else {
			fileName = new String(file.getName().getBytes("utf-8"),
					"iso-8859-1");
			
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ fileName + "\";");//다운로드 받을 fileName 지정
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			//file로 부터 inputStream -> Application ->response로 outputStream
		}finally {
			if(fis!=null)
				try {
					fis.close();
				}catch(IOException ex) {}
		}
		out.flush(); //완전히 전송
	}
}
