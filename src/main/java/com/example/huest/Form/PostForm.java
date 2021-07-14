package com.example.huest.Form;
import com.example.huest.model.User;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@Data
public class PostForm {

    private Integer id;
    @NotEmpty(message = "Not empty")
    private String name;
    @NotEmpty(message = "Not empty")
    private String description;
    private Integer user_id;
    private LocalDate date;

}
