package controller.admin.stock;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Orders_DTO;
import model.Stock_DTO;

public class Stock_DAO extends SqlSessionDaoSupport {

	public List<Stock_DTO> stocklist(int s_no) {

		List<Stock_DTO> stocklist = getSqlSession().selectList("store.selectStocklist", s_no);

		return stocklist;
	}

	public Stock_DTO stockdto(int s_no) {

		Stock_DTO stockdto = getSqlSession().selectOne("store.selectStocklist", s_no);

		return stockdto;
	}

	public int stockCountupdate(int s_no) {

		int x = getSqlSession().update("store.updatestockCount", s_no);

		return x;
	}

	public int stockCount(int s_no) {

		int x = getSqlSession().selectOne("store.selectCount", s_no);

		return x;
	}

	public void stock_cofmadd(int o_no, int s_no) {

		Orders_DTO orderStock = getSqlSession().selectOne("store.selectOrderStockOne", o_no);// o_no에 해당하는 값 갖고오기.

		/* oder_drink */
		String order_drink = orderStock.getO_drink();
		String[] split_odrink = order_drink.split(",");

		for (int i = 0; i < split_odrink.length; i = i + 2) {
			HashMap odrink = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_odrink[i + 1]);// 발주신청으로 입력받은 수량.

			int st_std = getSqlSession().selectOne("store.selectCount", split_odrink[i]);
			System.out.println("단위:" + st_std);
			int need_count = st_std * countadd; // (1000*3)

			odrink.put("s_no", s_no);
			odrink.put("st_name", split_odrink[i]);
			odrink.put("st_count", need_count); // 3000
			odrink.put("st_type", "음료");

			String stnameSame = getSqlSession().selectOne("store.stnameSame", odrink);
			System.out.println(stnameSame);

			if (stnameSame != null) {
				int stockadd = getSqlSession().update("store.updatestock", odrink);

			}
			if (stnameSame == null) {
				int stockinsert = getSqlSession().insert("store.insertstock", odrink);
			}

		}

		/* order_food */
		String order_food = orderStock.getO_food();
		String[] split_ofood = order_food.split(",");

		for (int j = 0; j < split_ofood.length; j = j + 2) {
			HashMap ofood = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_ofood[j + 1]);// 발주신청으로 입력받은 수량.

		/*	int st_std = getSqlSession().selectOne("store.selectCount", split_ofood[j]);
			System.out.println("단위:" + st_std);*/
			//int need_count = st_std * countadd; // (1000*3)

			ofood.put("s_no", s_no);
			ofood.put("st_name", split_ofood[j]);
			ofood.put("st_count", countadd); // 3000
			ofood.put("st_type", "식품");

			String stnameSame = getSqlSession().selectOne("store.stnameSame", ofood);
			System.out.println(stnameSame);

			if (stnameSame != null) {
				int stockadd = getSqlSession().update("store.updatestock", ofood);

			}
			if (stnameSame == null) {
				int stockinsert = getSqlSession().insert("store.insertstock", ofood);
			}
		}

		/* order_product */
		String order_product = orderStock.getO_product();
		String[] split_product = order_product.split(",");

		for (int k = 0; k < split_product.length; k = k + 2) {
			HashMap oproduct = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_product[k + 1]);// 발주신청으로 입력받은 수량.

			int st_std = getSqlSession().selectOne("store.selectCount", split_product[k]);
			System.out.println("단위:" + st_std);
			//int need_count = st_std * countadd; // (1000*3)

			oproduct.put("s_no", s_no);
			oproduct.put("st_name", split_product[k]);
			oproduct.put("st_count", countadd); // 3000
			oproduct.put("st_type", "상품");

			String stnameSame = getSqlSession().selectOne("store.stnameSame", oproduct);
			System.out.println(stnameSame);

			if (stnameSame != null) {
				int stockadd = getSqlSession().update("store.updatestock", oproduct);

			}
			if (stnameSame == null) {
				int stockinsert = getSqlSession().insert("store.insertstock", oproduct);
			}
		}

		/* order_thing */
		String order_thing = orderStock.getO_thing();
		String[] split_thing = order_thing.split(",");

		for (int n = 0; n < split_thing.length; n = n + 2) {
			HashMap othing = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_thing[n + 1]);// 발주신청으로 입력받은 수량.

			int st_std = getSqlSession().selectOne("store.selectCount", split_thing[n]);
			System.out.println("단위:" + st_std);
			//int need_count = st_std * countadd; // (1000*3)

			othing.put("s_no", s_no);
			othing.put("st_name", split_thing[n]);
			othing.put("st_count", countadd); // 3000
			othing.put("st_type", "소모품");

			String stnameSame = getSqlSession().selectOne("store.stnameSame", othing);
			System.out.println(stnameSame);

			if (stnameSame != null) {
				int stockadd = getSqlSession().update("store.updatestock", othing);

			}
			if (stnameSame == null) {
				int stockinsert = getSqlSession().insert("store.insertstock", othing);
			}
		}

	}

	public List<HashMap> odrink(int o_no, int s_no) {

		List ordrinklist = new ArrayList();

		Orders_DTO orderStock = getSqlSession().selectOne("store.selectOrderStockOne", o_no);// o_no에 해당하는 값 갖고오기.

		/* oder_drink */
		String order_drink = orderStock.getO_drink();
		String[] split_odrink = order_drink.split(",");

		for (int i = 0; i < split_odrink.length; i = i + 2) {

			HashMap odrink = new HashMap();
			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_odrink[i + 1]);// 발주신청으로 입력받은 수량.

			odrink.put("s_no", s_no);
			odrink.put("st_name", split_odrink[i]);
			odrink.put("st_num", countadd);
			odrink.put("st_type", "음료");

			ordrinklist.add(odrink);

		}

		System.out.println(ordrinklist);

		return ordrinklist;
	}

	public List<HashMap> orfood(int o_no, int s_no) {

		List ordrinklist = new ArrayList();

		Orders_DTO orderStock = getSqlSession().selectOne("store.selectOrderStockOne", o_no);// o_no에 해당하는 값 갖고오기.

		/* oder_food */
		String order_food = orderStock.getO_food();
		String[] split_ofood = order_food.split(",");

		for (int j = 0; j < split_ofood.length; j = j + 2) {
			HashMap ofood = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_ofood[j + 1]);// 발주신청으로 입력받은 수량.

			ofood.put("s_no", s_no);
			ofood.put("st_name", split_ofood[j]);
			ofood.put("st_num", countadd);
			ofood.put("st_type", "식품");

			ordrinklist.add(ofood);

		}

		System.out.println(ordrinklist);

		return ordrinklist;
	}

	public List<HashMap> orproduct(int o_no, int s_no) {
		List ordrinklist = new ArrayList();

		Orders_DTO orderStock = getSqlSession().selectOne("store.selectOrderStockOne", o_no);// o_no에 해당하는 값 갖고오기.

		/* oder_drink */
		String order_product = orderStock.getO_product();
		String[] split_product = order_product.split(",");

		for (int k = 0; k < split_product.length; k = k + 2) {
			HashMap oproduct = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_product[k + 1]);// 발주신청으로 입력받은 수량.

			oproduct.put("s_no", s_no);
			oproduct.put("st_name", split_product[k]);
			oproduct.put("st_num", countadd);
			oproduct.put("st_type", "식품");

			ordrinklist.add(oproduct);

		}

		System.out.println(ordrinklist);

		return ordrinklist;
	}

	public List<HashMap> orthing(int o_no, int s_no) {

		List ordrinklist = new ArrayList();

		Orders_DTO orderStock = getSqlSession().selectOne("store.selectOrderStockOne", o_no);// o_no에 해당하는 값 갖고오기.

		String order_thing = orderStock.getO_thing();
		String[] split_thing = order_thing.split(",");

		for (int n = 0; n < split_thing.length; n = n + 2) {
			HashMap othing = new HashMap();

			s_no = orderStock.getS_no();

			int countadd = Integer.parseInt(split_thing[n + 1]);// 발주신청으로 입력받은 수량.

			othing.put("s_no", s_no);
			othing.put("st_name", split_thing[n]);
			othing.put("st_num", countadd);
			othing.put("st_type", "식품");

			ordrinklist.add(othing);

		}

		System.out.println(ordrinklist);

		return ordrinklist;
	}

}
