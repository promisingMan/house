package controller;

import entity.Permission;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;
import util.ConstantUtil;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author zengjia
 * @date 2019/3/5 14:02
 */
@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpSession session) {
        User realUser = userService.getUser(user);
        if (realUser != null) {
            List<Permission> permissions = userService.getPermissions(realUser.getId());
            permissions.sort(Comparator.comparingInt(Permission::getId));
            Map<Permission, List<Permission>> map = new LinkedHashMap<>(16);
            for (Permission permission : permissions) {
                if (permission.getMenu() == 1) {
                    List<Permission> functions = new ArrayList<>();
                    for (Permission fun : permissions) {
                        if (fun.getFatherid().equals(permission.getId())) {
                            functions.add(fun);
                        }
                    }
                    map.put(permission, functions);
                }
            }
            session.setAttribute("user", realUser);
            session.setAttribute("permissions", map);
            return ConstantUtil.INDEX;
        } else {
            return ConstantUtil.LOGIN;
        }

    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return ConstantUtil.LOGIN;
    }

    @RequestMapping("/index")
    public String index() {
        return ConstantUtil.INDEX;
    }
}
