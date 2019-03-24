package service;

import dao.SellMapper;
import entity.Sell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author zengjia
 * @date 2019/3/11 21:18
 */
@Service
public class SellService {
    @Autowired
    SellMapper sellMapper;

    public void addSell(Sell sell) {
        sellMapper.insert(sell);
    }

    public void deleteSellById(Integer sellId) {
        sellMapper.deleteByPrimaryKey(sellId);
    }

    public void editSell(Sell sell) {
        sellMapper.updateByPrimaryKeySelective(sell);
    }

    public Sell getSell(Integer sellId) {
        Sell sell = sellMapper.selectByPrimaryKey(sellId);
        return sell;
    }

    public List<Sell> getSells() {
        List<Sell> sells = sellMapper.selectByExample(null);
        return sells;
    }

    public List<Map<String, Object>> getMonthStatistics(Integer buildId) {
        List<Map<String, Object>> monthStatistics = sellMapper.selectMonthStatistics(buildId);
        return monthStatistics;
    }

    public List<Map<String, Object>> getQuarterStatistics(Integer buildId) {
        List<Map<String, Object>> quarterStatistics = sellMapper.selectQuarterStatistics(buildId);
        return quarterStatistics;
    }

}
