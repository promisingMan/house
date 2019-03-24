package dao;

import entity.Lease;
import entity.LeaseExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface LeaseMapper {
    long countByExample(LeaseExample example);

    int deleteByExample(LeaseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Lease record);

    int insertSelective(Lease record);

    List<Lease> selectByExample(LeaseExample example);

    Lease selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Lease record, @Param("example") LeaseExample example);

    int updateByExample(@Param("record") Lease record, @Param("example") LeaseExample example);

    int updateByPrimaryKeySelective(Lease record);

    int updateByPrimaryKey(Lease record);

    List<Map<String, Object>> selectMonthStatistics(Integer buildId);

    List<Map<String, Object>> selectQuarterStatistics(Integer buildId);
}