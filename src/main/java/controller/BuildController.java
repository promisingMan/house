package controller;

import entity.Build;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.BuildService;
import service.LeaseService;
import service.SellService;
import util.ConstantUtil;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zengjia
 * @date 2019/3/11 21:17
 */
@Controller
@RequestMapping("/build")
public class BuildController {
    @Autowired
    BuildService buildService;

    @Autowired
    SellService sellService;

    @Autowired
    LeaseService leaseService;

    @RequestMapping("/addBuild")
    public String addBuild() {
        return ConstantUtil.ADD_BUILD;
    }

    @RequestMapping("/deleteBuild")
    public ModelAndView deleteBuild(Integer buildId) {
        ModelAndView mv = new ModelAndView();
        buildService.deleteBuildById(buildId);
        List<Build> builds = buildService.getBuilds();
        mv.addObject("builds", builds);
        mv.setViewName(ConstantUtil.LIST_BUILDS);
        return mv;
    }

    @RequestMapping("/editBuild")
    public ModelAndView editBuild(Integer buildId) {
        ModelAndView mv = new ModelAndView();
        Build build = buildService.getBuild(buildId);
        mv.addObject("build", build);
        mv.setViewName(ConstantUtil.EDIT_BUILD);
        return mv;
    }

    @RequestMapping("/listBuilds")
    public ModelAndView listBuilds() {
        ModelAndView mv = new ModelAndView();
        List<Build> builds = buildService.getBuilds();
        mv.addObject("builds", builds);
        mv.setViewName(ConstantUtil.LIST_BUILDS);
        return mv;
    }

    @RequestMapping("/saveBuild")
    public ModelAndView saveBuild(Build build, String type) {
        ModelAndView mv = new ModelAndView();
        if (ConstantUtil.ADD.equals(type)) {
            buildService.addBuild(build);
        } else {
            buildService.editBuild(build);
        }
        List<Build> builds = buildService.getBuilds();
        mv.addObject("builds", builds);
        mv.setViewName(ConstantUtil.LIST_BUILDS);
        return mv;
    }

    @RequestMapping("/buildStatistics")
    public ModelAndView buildStatistics() {
        ModelAndView mv = new ModelAndView();
        List<Build> builds = buildService.getBuilds();
        mv.addObject("builds", builds);
        mv.setViewName(ConstantUtil.LIST_BUILDS_STATISTICS);
        return mv;
    }

    @RequestMapping("/monthStatistics")
    public ModelAndView monthStatistics(Integer buildId) {
        //统计销售
        List<Map<String, Object>> sellMonthStatistics = sellService.getMonthStatistics(buildId);
        List<Integer> sellMonth = new ArrayList<>();
        List<Integer> totalSales = new ArrayList<>();
        for (Map<String, Object> monthStatistic : sellMonthStatistics) {
            sellMonth.add((Integer) monthStatistic.get("month"));
            totalSales.add(Math.toIntExact((Long) monthStatistic.get("totalSales")));
        }

        //统计出租
        List<Map<String, Object>> leaseMonthStatistics = leaseService.getMonthStatistics(buildId);
        List<Integer> leaseMonth = new ArrayList<>();
        List<Integer> totalLeases = new ArrayList<>();
        for (Map<String, Object> monthStatistic : leaseMonthStatistics) {
            leaseMonth.add((Integer) monthStatistic.get("month"));
            totalLeases.add(Math.toIntExact((Long) monthStatistic.get("totalLeases")));
        }

        String buildName = buildService.getBuild(buildId).getBuildname();

        ModelAndView mv = new ModelAndView();

        mv.addObject("sellMonth", sellMonth);
        mv.addObject("totalSales", totalSales);
        mv.addObject("leaseMonth", leaseMonth);
        mv.addObject("totalLeases", totalLeases);
        mv.addObject("buildName", buildName);

        mv.setViewName(ConstantUtil.BUILD_MONTH_STATISTICS);
        return mv;
    }

    @RequestMapping("/quarterStatistics")
    public ModelAndView quarterStatistics(Integer buildId) {
        //统计销售
        List<Map<String, Object>> sellQuarterStatistics = sellService.getQuarterStatistics(buildId);
        List<Integer> sellQuarter = new ArrayList<>();
        List<Integer> totalSales = new ArrayList<>();
        for (Map<String, Object> quarterStatistic : sellQuarterStatistics) {
            sellQuarter.add((Integer) quarterStatistic.get("quarter"));
            totalSales.add(Math.toIntExact((Long) quarterStatistic.get("totalSales")));
        }

        //统计出租
        List<Map<String, Object>> leaseQuarterStatistics = leaseService.getQuarterStatistics(buildId);
        List<Integer> leaseQuarter = new ArrayList<>();
        List<Integer> totalLeases = new ArrayList<>();
        for (Map<String, Object> quarterStatistic : leaseQuarterStatistics) {
            leaseQuarter.add((Integer) quarterStatistic.get("quarter"));
            totalLeases.add(Math.toIntExact((Long) quarterStatistic.get("totalLeases")));
        }

        String buildName = buildService.getBuild(buildId).getBuildname();

        ModelAndView mv = new ModelAndView();

        mv.addObject("sellQuarter", sellQuarter);
        mv.addObject("totalSales", totalSales);
        mv.addObject("leaseQuarter", leaseQuarter);
        mv.addObject("totalLeases", totalLeases);
        mv.addObject("buildName", buildName);
        mv.setViewName(ConstantUtil.BUILD_QUARTER_STATISTICS);
        return mv;
    }

    @RequestMapping("/compare")
    public ModelAndView compare(String type, Integer[] params) {
        List<Map<Integer, Integer>> sellList = new ArrayList<>();
        List<Map<Integer, Integer>> leaseList = new ArrayList<>();
        List<String> buildNames = new ArrayList<>();
        // 如果是月度统计比较
        if (ConstantUtil.MONTH.equals(type)) {
            // 封装数据
            for (Integer param : params) {
                Map<Integer, Integer> sellMap = new LinkedHashMap<>();
                Map<Integer, Integer> leaseMap = new LinkedHashMap<>();

                List<Map<String, Object>> sellMonthStatistics = sellService.getMonthStatistics(param);
                List<Map<String, Object>> leaseMonthStatistics = leaseService.getMonthStatistics(param);

                for (Map<String, Object> sellMonthStatistic : sellMonthStatistics) {
                    Integer sellMonth = (Integer) sellMonthStatistic.get("month");
                    Integer totalSales = Math.toIntExact((Long) sellMonthStatistic.get("totalSales"));
                    sellMap.put(sellMonth, totalSales);
                }

                for (Map<String, Object> leaseMonthStatistic : leaseMonthStatistics) {
                    Integer leaseMonth = (Integer) leaseMonthStatistic.get("month");
                    Integer totalLeases = Math.toIntExact((Long) leaseMonthStatistic.get("totalLeases"));
                    leaseMap.put(leaseMonth, totalLeases);
                }

                String buildName = buildService.getBuild(param).getBuildname();
                buildNames.add(buildName);
                sellList.add(sellMap);
                leaseList.add(leaseMap);
            }

        } else {
            // 封装数据
            for (Integer param : params) {
                Map<Integer, Integer> sellMap = new LinkedHashMap<>();
                Map<Integer, Integer> leaseMap = new LinkedHashMap<>();

                List<Map<String, Object>> sellQuarterStatistics = sellService.getQuarterStatistics(param);
                List<Map<String, Object>> leaseQuarterStatistics = leaseService.getQuarterStatistics(param);

                for (Map<String, Object> sellQuarterStatistic : sellQuarterStatistics) {
                    Integer sellQuarter = (Integer) sellQuarterStatistic.get("quarter");
                    Integer totalSales = Math.toIntExact((Long) sellQuarterStatistic.get("totalSales"));
                    sellMap.put(sellQuarter, totalSales);
                }

                for (Map<String, Object> leaseQuarterStatistic : leaseQuarterStatistics) {
                    Integer leaseQuarter = (Integer) leaseQuarterStatistic.get("quarter");
                    Integer totalLeases = Math.toIntExact((Long) leaseQuarterStatistic.get("totalLeases"));
                    leaseMap.put(leaseQuarter, totalLeases);
                }

                String buildName = buildService.getBuild(param).getBuildname();
                buildNames.add(buildName);
                sellList.add(sellMap);
                leaseList.add(leaseMap);
            }

        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("type",type);
        mv.addObject("buildNames", buildNames);
        mv.addObject("sellList", sellList);
        mv.addObject("leaseList", leaseList);
        mv.setViewName(ConstantUtil.BUILDS_COMPARE_STATISTICS);
        return mv;
    }
}
