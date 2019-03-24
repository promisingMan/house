package dao;

import entity.Sell;
import entity.SellExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SellMapper {
    long countByExample(SellExample example);

    int deleteByExample(SellExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Sell record);

    int insertSelective(Sell record);

    List<Sell> selectByExample(SellExample example);

    Sell selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Sell record, @Param("example") SellExample example);

    int updateByExample(@Param("record") Sell record, @Param("example") SellExample example);

    int updateByPrimaryKeySelective(Sell record);

    int updateByPrimaryKey(Sell record);

    List<Map<String, Object>> selectMonthStatistics(Integer buildId);

    List<Map<String, Object>> selectQuarterStatistics(Integer buildId);
}