package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;
import util.ConstantUtil;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/5 17:26
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/addUser")
    public ModelAndView addUser(User user) {
        ModelAndView mv = new ModelAndView();
        userService.addUser(user);
        List<User> users = userService.getUsers();
        mv.addObject("users", users);
        mv.setViewName(ConstantUtil.LIST_USERS);
        return mv;
    }

    @RequestMapping("/delUser")
    public ModelAndView deleteUser(Integer userId) {
        ModelAndView mv = new ModelAndView();
        userService.deleteUserById(userId);
        List<User> users = userService.getUsers();
        mv.addObject("users", users);
        mv.setViewName(ConstantUtil.LIST_USERS);
        return mv;
    }


    @RequestMapping("/editUser")
    public ModelAndView editUser(User user) {
        ModelAndView mv = new ModelAndView();
        userService.editUser(user);
        List<User> users = userService.getUsers();
        mv.addObject("users", users);
        mv.setViewName(ConstantUtil.LIST_USERS);
        return mv;
    }

    @RequestMapping("/listUsers")
    public ModelAndView listUsers() {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.getUsers();
        mv.addObject("users", users);
        mv.setViewName(ConstantUtil.LIST_USERS);
        return mv;
    }

}
