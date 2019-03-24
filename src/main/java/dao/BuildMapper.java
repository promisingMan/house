package dao;

import entity.Build;
import entity.BuildExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BuildMapper {
    long countByExample(BuildExample example);

    int deleteByExample(BuildExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Build record);

    int insertSelective(Build record);

    List<Build> selectByExample(BuildExample example);

    Build selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Build record, @Param("example") BuildExample example);

    int updateByExample(@Param("record") Build record, @Param("example") BuildExample example);

    int updateByPrimaryKeySelective(Build record);

    int updateByPrimaryKey(Build record);
}