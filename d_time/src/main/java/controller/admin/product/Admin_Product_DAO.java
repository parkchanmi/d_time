package controller.admin.product;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Product_Add_Temp;
import model.Product_DTO;


public class Admin_Product_DAO extends SqlSessionDaoSupport{

	public List<Product_DTO> getProductList() {
		List<Product_DTO> plist= getSqlSession().selectList("admin_product.product_all");
		return plist;
	}

	public int insertProducts(Product_Add_Temp ptemp) {
		int x = 0;
		
		if(ptemp.getAddDrink()!=null) {
			System.out.println("음료추가!");
			String[] drink = ptemp.getAddDrink();
			int[] dstd = ptemp.getAddDstd();
			for(int i=0;i<drink.length;i++) {
				if(drink[i]==null) continue;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("p_name", drink[i]);
				map.put("p_std", dstd[i]);
				x = getSqlSession().insert("admin_product.insert_product_d",map);
				if(x==0) {
					System.out.println("insert에러");
					return x;
				}
			}
		}
		if(ptemp.getAddFood()!=null) {
			System.out.println("식품추가!");
			String[] food = ptemp.getAddFood();
			int[] fstd = ptemp.getAddFstd();
			for(int i=0;i<food.length;i++) {
				if(food[i]==null) continue;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("p_name", food[i]);
				map.put("p_std", fstd[i]);
				x = getSqlSession().insert("admin_product.insert_product_f",map);
				if(x==0) {
					System.out.println("insert에러");
					return x;
				}
			}
		}
		if(ptemp.getAddProduct()!=null) {
			System.out.println("상품추가!");
			String[] p = ptemp.getAddProduct();
			int[] pstd = ptemp.getAddPstd();
			for(int i=0;i<p.length;i++) {
				if(p[i]==null) continue;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("p_name", p[i]);
				map.put("p_std", pstd[i]);
				x = getSqlSession().insert("admin_product.insert_product_p",map);
				if(x==0) {
					System.out.println("insert에러");
					return x;
				}
			}
		}
		if(ptemp.getAddThing()!=null) {
			System.out.println("소모품추가!");
			String[] thing = ptemp.getAddThing();
			int[] tstd = ptemp.getAddTstd();
			for(int i=0;i<thing.length;i++) {
				if(thing[i]==null) continue;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("p_name", thing[i]);
				map.put("p_std", tstd[i]);
				x = getSqlSession().insert("admin_product.insert_product_t",map);
				if(x==0) {
					System.out.println("insert에러");
					return x;
				}
			}
		}
		
		return x;
		
	}

	public int deleteProduct(int p_no) {
		int x = getSqlSession().delete("admin_product.delete_product",p_no);
		return x;
	}
}
