package service;

import dao.BuildMapper;
import entity.Build;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/11 21:18
 */
@Service
public class BuildService {
    @Autowired
    BuildMapper buildMapper;

    public void addBuild(Build build) {
        buildMapper.insert(build);
    }

    public void deleteBuildById(Integer buildId) {
        buildMapper.deleteByPrimaryKey(buildId);
    }

    public void editBuild(Build build) {
        buildMapper.updateByPrimaryKeySelective(build);
    }

    public Build getBuild(Integer buildId) {
        Build build = buildMapper.selectByPrimaryKey(buildId);
        return build;
    }

    public List<Build> getBuilds() {
        List<Build> builds = buildMapper.selectByExample(null);
        return builds;
    }
}
