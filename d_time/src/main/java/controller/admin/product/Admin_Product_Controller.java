package controller.admin.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Product_Add_Temp;
import model.Product_DTO;

@Controller
public class Admin_Product_Controller {
	
	@Autowired
	private Admin_Product_DAO pdao;
	
	
	public Admin_Product_DAO getPdao() {
		return pdao;
	}

	public void setPdao(Admin_Product_DAO pdao) {
		this.pdao = pdao;
	}

	@RequestMapping("/admin/product/product_list.do")
	public String product_list(Model model) {
		List<Product_DTO> plist = pdao.getProductList();
		if(plist!=null) System.out.println(plist.size());
		model.addAttribute("plist",plist);
		return "admin/product/product_list";
	}
	
	@RequestMapping("/admin/product/product_add.do")
	public String product_add(Product_Add_Temp ptemp, Model model) {
		/*String[] addDrink = ptemp.getAddDrink();
		int[] addDstd =ptemp.getAddDstd();
		for(int i=0;i<addDrink.length;i++)
		{
		 System.out.println("음료, "+addDrink[i]+", "+addDstd[i]); 
		}*/
		int x = pdao.insertProducts(ptemp);
		if(x==0) {//에러}
		}
		
		return "redirect:/admin/product/product_list.do";
	}
	@RequestMapping(value="/admin/product/product_delete.do")
	public String product_delete(int p_no) {
		int x = pdao.deleteProduct(p_no);
		
		return "redirect:/admin/product/product_list.do";
	}
	

}
