package service;

import dao.LeaseMapper;
import entity.Lease;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author zengjia
 * @date 2019/3/11 21:18
 */
@Service
public class LeaseService {
    @Autowired
    LeaseMapper leaseMapper;

    public void addLease(Lease lease) {
        leaseMapper.insert(lease);
    }

    public void deleteLeaseById(Integer leaseId) {
        leaseMapper.deleteByPrimaryKey(leaseId);
    }

    public void editLease(Lease lease) {
        leaseMapper.updateByPrimaryKeySelective(lease);
    }

    public Lease getLease(Integer leaseId) {
        Lease lease = leaseMapper.selectByPrimaryKey(leaseId);
        return lease;
    }

    public List<Lease> getLeases() {
        List<Lease> leases = leaseMapper.selectByExample(null);
        return leases;
    }

    public List<Map<String, Object>> getMonthStatistics(Integer buildId) {
        List<Map<String, Object>> monthStatistics = leaseMapper.selectMonthStatistics(buildId);
        return monthStatistics;
    }

    public List<Map<String, Object>> getQuarterStatistics(Integer buildId) {
        List<Map<String, Object>> quarterStatistics = leaseMapper.selectQuarterStatistics(buildId);
        return quarterStatistics;
    }
}
