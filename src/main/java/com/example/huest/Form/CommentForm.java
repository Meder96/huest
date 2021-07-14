package com.example.huest.Form;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentForm {
private Integer id;
private String text;
private Integer post_id;
private Integer user_id;
}
