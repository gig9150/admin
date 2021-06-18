package com.roomio.carret.mapper;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class ManagerSqlProvider {
	
	public String getGroupsCnt(Map<Object,Object> params) {
		SQL sql = new SQL() {{
			SELECT("count(*)");
			FROM("role_groups");
			if(((String)params.get("searchOption")).equals("all")) {
				WHERE("role_group_name like concat('%',#{keyWord},'%')");
				OR();
				WHERE("franchise_code like concat('%',#{keyWord},'%')");
			}else {
				WHERE("#{searchOption} like concat('%',#{keyWord},'%')");
			}
		}};
		
		return sql.toString();
		

		
	}
	
	public String getGroupsList(Map<Object,Object> params) {
		SQL sql = new SQL() {{
			SELECT("role_group_id,role_group_name,role_group_info,regdate,registrar,franchise_code");
			FROM("role_groups");
			if(((String)params.get("searchOption")).equals("all")) {
				WHERE("role_group_name like concat('%',#{keyWord},'%')");
				OR();
				WHERE("franchise_code like concat('%',#{keyWord},'%')");
			}else {
				WHERE("#{searchOption} like concat('%',#{keyWord},'%')");
			}
		}};
		
		return sql.toString();
		

	}
}
