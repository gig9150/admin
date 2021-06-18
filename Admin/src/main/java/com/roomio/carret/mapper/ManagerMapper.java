package com.roomio.carret.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.session.RowBounds;

public interface ManagerMapper {
	
	//매니저 로그인
	@Select("select name " +
			"from manager_member " +
			"where id=#{id} and pw = #{pw}")
	 String checkManagerMember(@Param("id")String id,@Param("pw")String pw);
	
	//요구 상세 꺼내오기
	@Select("SELECT role_detail_id,name " +
			"FROM role_detail")
	List<HashMap<String,String>> getRoleDetailList();
	
	//역할 그룹 추가
	@Insert("INSERT INTO role_groups(role_group_name,role_group_info,franchise_code,registrar) " +
			"VALUES(#{roleGroupName},#{roleGroupInfo},#{franchiseCode},#{registrar})")
	void addRoleGroups(@Param("roleGroupName")String roleGroupName,
			@Param("roleGroupInfo")String roleGroupInfo,
			@Param("franchiseCode")String franchiseCode,
			@Param("registrar")String registrar);
	
	@SelectKey(statement = "select role_group_id from role_groups order by role_group_id desc limit 1", keyProperty = "role_group_id", before = true, resultType = String.class)
	
	//역할 그룹 디테일추가
	@Insert("INSERT INTO role_group_and_detail(role_group_id,role_detail_id) " +
			"values(#{role_group_id},#{roleDetail})")
	void addRoleGroupsDetail(@Param("roleDetail")String roleDetail);
	
	//역할 그룹 리스트 전체글 갯수
	@SelectProvider(type=ManagerSqlProvider.class,method="getGroupsCnt")
	int getRoleGroupsCnt(@Param("searchOption")String searchOption,
						@Param("keyWord")String keyWord);
	
	//역할 그룹 리스트
	@SelectProvider(type=ManagerSqlProvider.class,method="getGroupsList")
	List<HashMap<String,String>> getRoleGroupsList(
												@Param("searchOption")String searchOption,
												@Param("keyWord")String keyWord,
												RowBounds rowBounds);
	
	//역할 그룹 삭제
	@Delete("delete from role_groups " +
			"where role_group_id = #{roleGroupId}")
	void deleteRoleGroups(@Param("roleGroupId")int roleGroupId);
	
	@Delete("delete from role_group_and_detail " +
			"where role_group_id=#{roleGroupId}")
	void deleteRoleGroupsDetail(@Param("roleGroupId")int roleGroupId);
	//역할 그룹 수정
	
	
	
}
