package com.roomio.carret.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ShopMapper {
	
	@Select("select member_id,status,date_format(regdate, '%Y-%m-%d') as regdate from shop")
	List<HashMap<Object, Object>> getShopList();
}
