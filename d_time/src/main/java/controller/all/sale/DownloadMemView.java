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
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class DownloadMemView extends AbstractXlsView{
	@SuppressWarnings("unchecked")
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"mem_test.xls\";");
		
		Sheet mem_sheet = createFirstMemSheet(workbook);
		createColumnLabel(mem_sheet);
		
		Sheet mem_sheet2 = createSecondMemSheet(workbook);
		createColumnLabel2(mem_sheet2);
		
		HashMap mem_map = (HashMap) model.get("mem_cost");
		//1번시트
		List<HashMap> month = (List<HashMap>) mem_map.get("month");
		int rowNum_mon = 1;
		for(HashMap month_map : month) {
			createFirstMemSheetRow(mem_sheet, month_map, rowNum_mon++);
		}
		
		//2번시트
		List<HashMap> type = (List<HashMap>) mem_map.get("type");
		int rowNum_type = 1;
		for(HashMap type_map : type) {
			createSecontMemSheetRow(mem_sheet2, type_map, rowNum_type++);
		}
	}

	//1.연매출시트
	private Sheet createFirstMemSheet(Workbook workbook) {
		Sheet mem_sheet = workbook.createSheet();
		workbook.setSheetName(0, "연매출");
		mem_sheet.setColumnWidth(1, 256*20);
		return mem_sheet;
	}

	private void createColumnLabel(Sheet mem_sheet) {
		Row firstRow = mem_sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("월");
		
		cell = firstRow.createCell(1);
		cell.setCellValue("매출액");		
	}

	private void createFirstMemSheetRow(Sheet mem_sheet, HashMap month_map, int rowNum_mon) {
		Row row = mem_sheet.createRow(rowNum_mon);
		Cell cell = row.createCell(0);
		cell.setCellValue(String.valueOf(month_map.get("month")));
		
		cell = row.createCell(1);
		cell.setCellValue(String.valueOf(month_map.get("cost")));
	}
	
	//2.상품판매별 시트
	private Sheet createSecondMemSheet(Workbook workbook) {
		Sheet type_sheet = workbook.createSheet();
		workbook.setSheetName(1, "상품별");
		type_sheet.setColumnWidth(1, 256*20);
		return type_sheet;
	}
	
	private void createColumnLabel2(Sheet mem_sheet2) {
		Row firstRow = mem_sheet2.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("분류");
		
		cell = firstRow.createCell(1);
		cell.setCellValue("판매횟수");
		
		cell = firstRow.createCell(2);
		cell.setCellValue("판매금액");
		
	}
	
	private void createSecontMemSheetRow(Sheet mem_sheet2, HashMap type_map, int rowNum_type) {
		Row row = mem_sheet2.createRow(rowNum_type);
		Cell cell = row.createCell(0);
		cell.setCellValue((String) type_map.get("type_name"));
		
		cell = row.createCell(1);
		cell.setCellValue(String.valueOf(type_map.get("type_count")));
		
		cell = row.createCell(2);
		cell.setCellValue(String.valueOf(type_map.get("type_cost")));
	}


}
