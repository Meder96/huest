package com.example.huest.Form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
public class UserForm {
    private Integer id;
    @NotEmpty(message = "Not Empty")
    private String name;
    @NotEmpty(message = "Not Empty")
    private String password;

}
