package controller.all.sale;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class DownloadView extends AbstractXlsView {
	@SuppressWarnings("unchecked") // unchecked : 검증되지 않은 연산자 관련 경고 억제
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"test.xls\";");

		System.out.println("이동됨");

		Sheet sheet = createFirstSheet(workbook);
		createColumnLabel(sheet);

		HashMap cost_map = (HashMap) model.get("cost");
		// int count2= model.get("all_cost");
		int rowNum = 1;

		createFirstSheetRow(sheet, cost_map, rowNum++);
		
		//2페이지
		Sheet sheet2 = createSecondSheet(workbook);
		createColumnLabel2(sheet2);
		
		//List<HashMap> name_cost = (List<HashMap>) model.get("cost");
		List<HashMap> name_cost = (List<HashMap>) cost_map.get("name_cost");
		int rowNum2=1;
		for(HashMap map : name_cost) {
			createSecondSheetRow(sheet2, map, rowNum2++);
		}

	}

	// 1페이지
	private Sheet createFirstSheet(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "총매출");
		sheet.setColumnWidth(1, 256 * 20);
		return sheet;
	}

	private void createColumnLabel(Sheet sheet) {
		Row firstRow = sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("총매출");

		cell = firstRow.createCell(1);
		cell.setCellValue("직영점 매출");

		cell = firstRow.createCell(2);
		cell.setCellValue("가맹점 매출");

	}

	private void createFirstSheetRow(Sheet sheet, HashMap cost_map, int rowNum) {
		Row row = sheet.createRow(rowNum);
		Cell cell = row.createCell(0);
		cell.setCellValue((int) cost_map.get("all_cost"));

		cell = row.createCell(1);
		cell.setCellValue((int) cost_map.get("j_cost"));

		cell = row.createCell(2);
		cell.setCellValue((int) cost_map.get("k_cost"));

	}

	// 2페이지
	
	private Sheet createSecondSheet(Workbook workbook) {
		Sheet sheet2 = workbook.createSheet();
		workbook.setSheetName(1, "지점별");
		sheet2.setColumnWidth(2, 256 * 20);
		return sheet2;
	}
	
	private void createColumnLabel2(Sheet sheet2) {
		Row firstRow2 = sheet2.createRow(0);
		Cell cell = firstRow2.createCell(0);
		cell.setCellValue("지점명");
		
		cell = firstRow2.createCell(1);
		cell.setCellValue("매출");
	}
	
	private void createSecondSheetRow(Sheet sheet2, HashMap map, int rowNum2) {
		Row row2 = sheet2.createRow(rowNum2);
		Cell cell = row2.createCell(0);
		cell.setCellValue((String)map.get("name"));
		
		cell = row2.createCell(1);
		cell.setCellValue(String.valueOf(map.get("cost")));
		
		
	}

}
