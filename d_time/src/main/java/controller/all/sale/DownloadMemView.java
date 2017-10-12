package controller.all.sale;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsView;

public class DownloadMemView extends AbstractXlsView{
	@SuppressWarnings("unchecked")
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"mem_test.xls\";");
		
		Font font = workbook.createFont();
		CellStyle style = workbook.createCellStyle();
		CellStyle style2 = workbook.createCellStyle();
		
		HashMap mem_map = (HashMap) model.get("mem_cost");
		
		Sheet mem_sheet = createFirstMemSheet(workbook);
		createColumnLabel(mem_sheet, font, style);
		
		Sheet mem_sheet2 = createSecondMemSheet(workbook);
		createColumnLabel2(mem_sheet2, mem_map, font, style,style2);
		
		Sheet mem_sheet3 = createThirdMemSheet(workbook);
		createColumnLabel3(mem_sheet3, mem_map, font, style,style2);
		
		//1번시트
		List<HashMap> month = (List<HashMap>) mem_map.get("month");
		int rowNum_mon = 1;
		for(HashMap month_map : month) {
			createFirstMemSheetRow(mem_sheet, month_map, rowNum_mon++);
		}
		
		//2번시트
		List<HashMap> type = (List<HashMap>) mem_map.get("type");
		int rowNum_type = 2;
		for(HashMap type_map : type) {
			createSecontMemSheetRow(mem_sheet2, type_map, rowNum_type++);
		}
		
		//3번시트
		List<HashMap> all = (List<HashMap>) mem_map.get("all");
		int rowNum_all = 2;
		for(HashMap all_map : all) {
			createThirdMemSheetRow(mem_sheet3, all_map, rowNum_all++);
		}
	}

	//1.연매출시트
	private Sheet createFirstMemSheet(Workbook workbook) {
		Sheet mem_sheet = workbook.createSheet();
		workbook.setSheetName(0, "연매출");
		mem_sheet.setColumnWidth(1, 256*20);
		return mem_sheet;
	}

	private void createColumnLabel(Sheet mem_sheet,Font font, CellStyle style) {
		
		font.setColor(Font.COLOR_RED);
		font.setFontHeightInPoints((short) 11);
		font.setBold(true);
		style.setFont(font);
		
		Row firstRow = mem_sheet.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("월");
		cell.setCellStyle(style);
		
		cell = firstRow.createCell(1);
		cell.setCellValue("매출액");
		cell.setCellStyle(style);

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
	
	private void createColumnLabel2(Sheet mem_sheet2, HashMap mem_map, Font font, CellStyle style, CellStyle style2) {
		
		font.setColor(Font.COLOR_RED);
		font.setFontHeightInPoints((short) 11);
		font.setBold(true);
		style.setFont(font);
		style2.setFillForegroundColor(IndexedColors.LEMON_CHIFFON.index);//기간 배경색
		style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		Row firstRow = mem_sheet2.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("기간 : " + (String)mem_map.get("from") + "~" + (String)mem_map.get("to"));
		cell.setCellStyle(style2);
		
		mem_sheet2.addMergedRegion(new CellRangeAddress(0,0,0,2));
		
		Row secondRow = mem_sheet2.createRow(1);
		
		cell = secondRow.createCell(0);
		cell.setCellValue("분류");
		cell.setCellStyle(style);
		
		cell = secondRow.createCell(1);
		cell.setCellValue("판매횟수");
		cell.setCellStyle(style);
		
		cell = secondRow.createCell(2);
		cell.setCellValue("판매금액");
		cell.setCellStyle(style);

	}
	
	private void createSecontMemSheetRow(Sheet mem_sheet2, HashMap type_map, int rowNum_type) {
		Row row = mem_sheet2.createRow(rowNum_type);
		Cell cell = row.createCell(0);
		cell.setCellValue((String) type_map.get("type_name"));
		
		cell = row.createCell(1);
		cell.setCellValue(String.valueOf(type_map.get("type_count")));
		
		cell = row.createCell(2);
		cell.setCellValue(String.valueOf(type_map.get("type_cost")));
		
		for(int i=0; i<4; i++){
			 mem_sheet2.autoSizeColumn((short)i);
			 mem_sheet2.setColumnWidth(i, (mem_sheet2.getColumnWidth(i))+512 );
			}
	}
	
	//3.기간 총 리스트
	private Sheet createThirdMemSheet(Workbook workbook) {
		Sheet all_sheet = workbook.createSheet();
		workbook.setSheetName(2, "매출 리스트");
		all_sheet.setColumnWidth(1, 256*20);
		return all_sheet;
	}
	private void createColumnLabel3(Sheet mem_sheet3, HashMap mem_map, Font font, CellStyle style, CellStyle style2) {
		
		font.setColor(Font.COLOR_RED);
		font.setFontHeightInPoints((short) 11);
		font.setBold(true);
		style.setFont(font);
		//style2.setFillBackgroundColor(HSSFColor.LEMON_CHIFFON.index); 
		style2.setFillForegroundColor(IndexedColors.LEMON_CHIFFON.index);//기간 배경색
		style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		Row firstRow = mem_sheet3.createRow(0);
		Cell cell = firstRow.createCell(0);
		cell.setCellValue("기간 : " + (String)mem_map.get("from") + "~" + (String)mem_map.get("to"));
		cell.setCellStyle(style2);
		mem_sheet3.addMergedRegion(new CellRangeAddress(0,0,0,3)); //셀병합

		Row secondRow = mem_sheet3.createRow(1);
		cell = secondRow.createCell(0);
		cell.setCellValue("판매 날짜");
		cell.setCellStyle(style);
		
		cell = secondRow.createCell(1);
		cell.setCellValue("판매 금액");
		cell.setCellStyle(style);
		
		cell = secondRow.createCell(2);
		cell.setCellValue("판매 내역");
		cell.setCellStyle(style);
		
		cell = secondRow.createCell(3);
		cell.setCellValue("판매 분류");
		cell.setCellStyle(style);
	}
	private void createThirdMemSheetRow(Sheet mem_sheet3, HashMap all_map, int rowNum_all) {
		Row row = mem_sheet3.createRow(rowNum_all);
		
		Cell cell = row.createCell(0);
		cell.setCellValue(String.valueOf(all_map.get("sel_date")));
		
		cell = row.createCell(1);
		cell.setCellValue(String.valueOf(all_map.get("sel_cost")));
		
		cell = row.createCell(2);
		cell.setCellValue((String) all_map.get("sel_history"));
		
		cell = row.createCell(3);
		cell.setCellValue((String)all_map.get("sel_type"));
		
		for(int i=0; i<4; i++){
			 mem_sheet3.autoSizeColumn((short)i);
			 mem_sheet3.setColumnWidth(i, (mem_sheet3.getColumnWidth(i))+512 );
			}
	}
}
