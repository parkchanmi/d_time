package controller.admin.product;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Member_DTO;
import model.Orders_DTO;
import model.Product_DTO;


public class Product_DAO extends SqlSessionDaoSupport{

	/*public List<Product_DTO> productone(String p_type) {

		List<Product_DTO> proddto = getSqlSession().selectList("store.selectProductOne",p_type);

		return proddto;
	}*/
	
	public List<Product_DTO> productlist() {

		List<Product_DTO> prolist = getSqlSession().selectList("store.selectProductlist");
		return prolist;
	}
	
	
	public Product_DTO productname() { 

		Product_DTO prodname = (Product_DTO) getSqlSession().selectList("store.selectProductdto");
		return prodname;
	}

}
