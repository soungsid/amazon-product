package com.sms.amazonproduct;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWordController {

    @GetMapping("hello")
    public String helloFriend() {
        return "Ok its working";
    }

}
